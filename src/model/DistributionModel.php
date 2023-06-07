<?php

include_once './vendor/Log.php';

/**
 * This class helps to assign the gifts to the employees based on their employee id and interests
 */
class DistributionModel
{

    private $databaseConn;
    private $employeeInfo;
    private $response;
    private $empId;

    public function __construct(DatabaseConnector $databaseConn)
    {
        $this->databaseConn = $databaseConn->getConnection();
    }

    /**
     * This function assign the gift to the employee based on their interests if it is not assigned else returns the
     * assigned gift
     *
     * @param  $emp_id int
     *
     * @return  array
     */
    public function assignGiftToEmployee($emp_id): array
    {
        $this->empId = $emp_id;
        if ($this->employeeInfo = $this->isEmployeeAvailable($this->empId)) {
            if ($this->employeeInfo['gift_id'] > 0) {
                $this->setResponse(200, "Gift is already assigned");
            } else {
                $giftAvailable = $this->isGiftAvailable();
                if ($giftAvailable) {
                    $this->databaseConn->beginTransaction();
                    try {
                        $this->updateEmployeeTable($giftAvailable);
                        $this->updateGiftCategoryTable($giftAvailable);
                        $this->databaseConn->commit();
                        $this->employeeInfo = $this->isEmployeeAvailable();
                        $this->setResponse(200, "Gift is assigned");
                    } catch (exception $e) {
                        $this->databaseConn->rollBack();
                        \Log::critical(__METHOD__, $e->getMessage(), $e);
                        $this->setResponse(500, "Something went wrong");
                    }
                } else {
                    $this->setResponse(404, "Gift is unavailable");
                }
            }
        } else {
            $this->setResponse(404, "Employee id is not found");
        }
        return $this->response;
    }

    /**
     * This function update the employee table gift_id column if the gift is assigned to the employee
     *
     * @param $giftAvailable array
     *
     * @return  bool
     */
    public function updateEmployeeTable($giftAvailable): bool
    {
        $data = [
            'gift_id' => $giftAvailable[0]['gift_id'],
            'emp_id' => $this->empId,
            'updated_at' => date('Y-m-d h:i:s')
        ];
        $updateStmt = $this->databaseConn->prepare(
            "UPDATE employees SET gift_id=:gift_id, updated_at=:updated_at WHERE emp_id=:emp_id"
        );
        return $updateStmt->execute($data);
    }

    /**
     * This function update the gift category table with respect to the category mapping
     *
     * @param $giftAvailable array
     *
     * @return  bool
     */
    public function updateGiftCategoryTable($giftAvailable): bool
    {
        $data = [
            'id' => $giftAvailable[0]['id'],
            'is_assigned' => 1,
            'updated_at' => date('Y-m-d h:i:s')
        ];
        $updateStmt = $this->databaseConn->prepare(
            "UPDATE gift_category_map SET is_assigned=:is_assigned, updated_at=:updated_at WHERE id=:id"
        );
        return $updateStmt->execute($data);
    }

    /**
     * This function checks the employee info is exists in the system
     *
     * @return array
     */
    public function isEmployeeAvailable()
    {
        $employeeStmt = $this->databaseConn->prepare(
            "SELECT employees.emp_id, employees.name, employees.gift_id, gift_name FROM employees left join gifts on gifts.gift_id = employees.gift_id WHERE emp_id = ?"
        );
        $employeeStmt->execute([$this->empId]);
        return $employeeStmt->fetch();
    }

    /**
     * This function checks if the gift is available and returns the array response
     *
     * @return  array
     */
    public function isGiftAvailable(): array
    {
        $employeeInterests = $this->getEmployeeInterest();
        if ($employeeInterests) {
            $categoryIds = array_column($employeeInterests, 'category_id');
            $idPlaceholder = str_repeat('?,', count($categoryIds) - 1) . '?';
            $giftStmt = $this->databaseConn->prepare(
                "SELECT * FROM gift_category_map WHERE is_assigned = 0 AND category_id IN ($idPlaceholder)"
            );
            $giftStmt->execute($categoryIds);
            return $giftStmt->fetchAll(PDO::FETCH_ASSOC);
        }
        return [];
    }

    /**
     * This function return the interests of particular employee
     *
     * @return  array
     */
    public function getEmployeeInterest(): array
    {
        $interestStmt = $this->databaseConn->prepare(
            "SELECT * FROM employee_interest_map WHERE emp_id = ?"
        );
        $interestStmt->execute([$this->empId]);
        return $interestStmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * This function returns the response code and message
     *
     * @param  $code    int
     * @param  $message string
     *
     * @return  array
     */
    public function setResponse($code, $message): array
    {
        return $this->response = ["code" => $code, "message" => $message, "data" => !empty($this->employeeInfo) ? $this->employeeInfo : new stdClass()];
    }

}