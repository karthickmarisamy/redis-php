<?php

require_once('./autoload.php');

$router = new Router(new Request);

/**
 * This post method accepts the employee and make the gift assignments
 */
$router->post('/', function ($request) {

    \Log::info('POST Method - Assign Gift To employees Request', "Recived Input from user " . json_encode($_POST));

    $distribution = new DistributionController(
        new DistributionModel(
            new DatabaseConnector()
        )
    );
    $response = $distribution->assignEmployeeGift();

    \Log::info('POST Method - Assign Gift To employees Response', $response);

    return $response;
});

/**
 * This method just return the error message when user opens in browser
 */
$router->get('/', function () {
    return "<h1> PAGE NOT FOUND <h1>";
});