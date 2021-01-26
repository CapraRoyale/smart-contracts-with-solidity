pragma solidity ^0.5.0;

// Defining payable accounts
contract TieredProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

// Use constructore for dynamic addressability
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

// Check balance on contract, should ALWAYS be zero after distribution
    function balance() public view returns(uint) {
        return address(this).balance;
    }

// Percentage split between three employees and the remainder gets sent to employee_one (highest %). 
    function deposit() public payable {

// Divide incoming payment (msg.value) into 100 units for easy percentage calculation
        uint points = msg.value / 100;
        uint total;
        uint amount;
        
        amount = points * 60;
        total += amount;
        employee_one.transfer(amount);
        
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);

        employee_one.transfer(msg.value - total);
    }

// Make sure contract can receive funds from external accounts 
    function() external payable {
        deposit();
    }
}