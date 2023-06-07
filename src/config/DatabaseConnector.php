<?php

include_once './vendor/Log.php';

/**
 * This class establishing a PDO connection with Database
 */
class DatabaseConnector
{
    private $dbConnection = null;

    public function __construct()
    {
        try {
            $options = [
                PDO::ATTR_EMULATE_PREPARES => false,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ];
            $this->dbConnection = new PDO(
                "mysql:host=db;dbname=gift;charset=utf8mb4",
                getenv('MYSQL_USER'),
                getenv('MYSQL_PASSWORD'),
                $options
            );

        } catch (Exception $e) {
            \Log::critical(__METHOD__, $e->getMessage(), $e);
            exit($e->getMessage());
        }
    }

    /**
     * This function return the PDO object
     * @return \PDO|null
     */
    public function getConnection()
    {
        return $this->dbConnection;
    }
}