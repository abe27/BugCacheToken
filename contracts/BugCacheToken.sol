//SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

import "hardhat/console.sol";

contract BugCacheToken {
    string public name = "Bug Cache Token";
    string public symbol = "BCT";
    uint256 public decimal = 10;
    uint256 public totalSupply = (100000000 * decimal);
    address public owner;
    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {
        console.log("Sender balance is %s tokens", balances[msg.sender]);
        console.log("Trying to send %s tokens to %s", amount, to);

        require(balances[msg.sender] >= amount, "Not enough tokens!");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
