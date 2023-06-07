<?php

/**
 * Handle all Logging to the system.
 */
class Log
{

    private static $tracking_id = 0;
    private static $uri = null;

    /**
     * Create and then send a critical log message.
     *
     * @param array|string     $context An array of strings or a string that is used to tag the log message.
     * @param string           $message Message to log
     * @param \Exception|mixed $data    Sends some extra data, if exception then adds to backtrace else to
     *                                  data.data
     */
    public static function critical($context, $message, $data = null)
    {
        self::logger('critical', $context, $message, $data, true);
    }

    /**
     * Create and then send an error log message.
     *
     * @param array|string     $context An array of strings or a string that is used to tag the log message.
     * @param string           $message Message to log
     * @param \Exception|mixed $data    Sends some extra data, if exception then adds to backtrace else to
     *                                  data.data
     */
    public static function error($context, $message, $data = null)
    {
        self::logger('error', $context, $message, $data, true);
    }


    /**
     * Create and then send a info log message.
     *
     * @param array|string     $context An array of strings or a string that is used to tag the log message.
     * @param string           $message Message to log
     * @param \Exception|mixed $data    Sends some extra data, if exception then adds to backtrace else to
     *                                  data.data
     */
    public static function info($context, $message, $data = null)
    {
        self::logger('info', $context, $message, $data, false);
    }

    /**
     * Create and then send a debug log message.
     *
     * @param array|string     $context An array of strings or a string that is used to tag the log message.
     * @param string           $message Message to log
     * @param \Exception|mixed $data    Sends some extra data, if exception then adds to backtrace else to
     *                                  data.data
     */
    public static function debug($context, $message, $data = null)
    {
        self::logger('debug', $context, $message, $data, false);
    }


    /**
     * Builds a log message with various information from users, then
     * sends it to log server.
     *
     * @param string           $level      Error severity level.
     * @param string|string[]  $context    Tag for identify this type of error or where error was created.
     * @param string           $message    Message to send.
     * @param \Exception|mixed $data       Send some extra data, if exception then adds to backtrace else to
     *                                     data.data
     * @param boolean          $detailsLog Add a backtrace to the log message.
     */
    public static function logger($level, $context, $message, $data = null, $detailsLog = false)
    {
        // Get execution ID for this process.
        $trackingId = self::getTrackingId();

        $caller = self::getCallerMethod();

        // Set mandatory fields.
        $body = [
            'severity' => $level,
            'source' => 'GIFT',
            'context' => is_string($context) ? [$context] : $context,
            'instance' => gethostname(),
            'message' => (string)$message,
            'timestamp' => self::getTimestamp(),
            'tracking_id' => $trackingId,
            'data' => [
                'std' => [
                    'uri' => self::getUri(),
                    'domain' => self::getDomain(),
                    'caller' => $caller,
                ],
            ],
        ];

        if ($data instanceof \Exception) {
            $body['data']['std']['backtrace'][] = (string)$data;
        } else {
            $body['data']['my'] = $data;
        }

        if ($detailsLog) {
            // Add backtrace...
            $ex = new \Exception();
            $body['data']['std']['backtrace'][] = $ex->getTraceAsString();
            $body['data']['std']['http_method'] = $_SERVER['REQUEST_METHOD'] ?? '[unknown]';
            $body['data']['std']['http_post_args'] = $_POST;
            $body['data']['std']['http_cookies'] = $_COOKIE;
            $backtrace = '';
            if (!empty($body['data']['std']['backtrace'])) {
                $backtrace = "\n" . implode("\n", $body['data']['std']['backtrace']);
            }
            @error_log($level . $caller . ': ' . $message . $backtrace);
        } else {
            @error_log($level . $caller . ': ' . $message);

        }
        @error_log("JSON-LOG:" . json_encode($body));
    }

    /**
     * @return string
     */
    private static function getCallerMethod()
    {
        $caller = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 4)[3];
        $method = (!empty($caller['class'])) ? ($caller['class'] . $caller['type']) : '';
        return $method . $caller['function'];
    }

    /**
     * Get a tracking id for this reqeust that will be the same on all server.
     *
     * @return int
     */
    private static function getTrackingId()
    {
        if (!self::$tracking_id) {
            self::$tracking_id = strrev(uniqid());
        }
        return self::$tracking_id;
    }

    /**
     * Fetches timestamp in a human readable format.
     * Example: 2014-01-01 14:04:04.123456
     *
     * @return string
     *   Nicely formatted timestamp.
     */
    private static function getTimestamp()
    {
        [$msec, $sec] = explode(' ', microtime());
        $timestamp = date('Y - m - d\TH:i:s', $sec) . ' . ' . substr($msec, 2, 6) . 'Z';
        return $timestamp;
    }

    /**
     * Get the request URI or arguments if CLI.
     *
     * @return String
     */
    private static function getUri()
    {
        if (!self::$uri) {
            if (self::isCli()) {
                self::$uri = implode(' ', $_SERVER['argv']);
            } else {
                if (isset($_SERVER['REQUEST_URI'])) {
                    self::$uri = $_SERVER['REQUEST_URI'];
                } else {
                    self::$uri = '[unknown]';
                }
            }
        }
        return self::$uri;
    }

    /**
     * Get the domain of the server.
     *
     * @return string
     */
    private static function getDomain()
    {
        return isset($_SERVER["HTTP_HOST"]) ? $_SERVER["HTTP_HOST"] : '[unknown]';
    }


    public static function isCli(): bool
    {
        return (php_sapi_name() === 'cli') || defined('STDIN');
    }
}
