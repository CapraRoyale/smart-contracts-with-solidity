pragma solidity ^0.5.0;

contract DeferredEquityPlan {
    address human_resources;

    // Define variables for contract
    address payable employee;
    bool active = true;
    uint total_shares = 1000;
    uint annual_distribution = 250;

    // Start time for the contract is initialized when the contract hits the blockchain
    // The contract unlocks exactly 365 days after
    uint start_time = now;
    uint unlock_time = now + 365 days;

    // Variable for distributed shares, positive integer value only
    uint public distributed_shares;

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    // Define the distribution of shares
    function distribute() public {

        // Ensure all requirements are met before executing contract
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract inactive.");
        require(unlock_time <= now, "Account locked.");
        require(distributed_shares < total_shares, "Distributed shares can not exceed total shares.");
        
        unlock_time += 365 days;
        
        distributed_shares = (now - start_time) / 365 days * annual_distribution;

        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

    // Allow HR and employee ability to deactivate contract whenever
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    // Revert any Ether sent directly to the contract
    function() external payable {
        revert("This contract does not accept Ethere!");
    }
}