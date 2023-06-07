<?php

include_once './interface/IInputValidation.php';
include_once './vendor/Log.php';

/**
 * This DistributionController duty is assigning a gift to employees
 */
class DistributionController implements IInputValidation
{

    private $employeeId;
    private $distributionModel;
    private $httpCode;
    private $queryResponse;

    public function __construct(DistributionModel $distributionModel)
    {
        $this->distributionModel = $distributionModel;
    }

    /**
     * This function assign gift to the employees based on the employee id
     *
     * @return  string
     */
    public function assignEmployeeGift(): string
    {
        if ($this->validateInput()) {
            $this->employeeId = htmlspecialchars(strip_tags($_POST['emp_id']));
            $this->queryResponse = $this->distributionModel->assignGiftToEmployee($this->employeeId);
            $this->httpCode = $this->queryResponse['code'];
        } else {
            $this->httpCode = 400;
        }
        http_response_code($this->httpCode);
        return json_encode([
            'status' => $this->httpCode == 200,
            'data' => $this->queryResponse['data'] ?? new stdClass(),
            'message' => $this->queryResponse['message'] ?? "Valid Employee Id is required"
        ]);
    }

    /**
     * This function validates the input and returns the boolean value
     * @return  bool
     */
    public function validateInput(): bool
    {
        return isset($_POST['emp_id']) && !empty($_POST['emp_id']) && is_numeric($_POST['emp_id']);
    }
}