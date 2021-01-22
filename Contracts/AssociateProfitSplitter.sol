pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    // Create three variables to assign as employees
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    // Construct addresses from variables for dynamic addressing
    constructor(
        address payable _one,
        address payable _two,
        address payable _three
    ) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Check the balance available, which should be 0 after transaction
    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    //
    function deposit() public payable {
        // Divide
        uint256 amount = msg.value / 3;

        //Transfer amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // Send remainder to msg.sender
        msg.sender.transfer(msg.value - (amount * 3));
    }

    function() external payable {
        // Ensure the contract can receive funds from external accounts
        deposit();
    }
}
