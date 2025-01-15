// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Lock {
    uint private balance;
    address tokenaddress;
    mapping (address => uint) balances;
    constructor (address _tokenaddress){
        tokenaddress=_tokenaddress;

    }
   
    function deposit(uint value) public{
        
         IERC20(tokenaddress).approve(msg.sender,value);
         require(IERC20(tokenaddress).allowance(msg.sender, address(this))>=value);
         require(IERC20(tokenaddress).balanceOf(msg.sender)>=value);
         IERC20(tokenaddress).transferFrom(msg.sender, address(this), value);
         balances[msg.sender]+=value;
        

    }
    function withdraw(uint value) public  {
        require(IERC20(tokenaddress).balanceOf(address(this))>=value);
        IERC20(tokenaddress).transfer(msg.sender, value);

    }
        
}