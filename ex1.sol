// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.9.2/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts@4.9.2/access/Ownable.sol";

contract Vault is Ownable {
    IERC20 private _token;

    constructor(address tokenAddress) {
        _token = IERC20(tokenAddress);
    }

    function deposit(uint256 amount) external {
        _token.transferFrom(msg.sender, address(this), amount);
    }

    function withdraw(uint256 amount) external onlyOwner {
        _token.transfer(msg.sender, amount);
    }

    function getTokenAddress() public view returns (address) {
        return address(_token);
    }
}
