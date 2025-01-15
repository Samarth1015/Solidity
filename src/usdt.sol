// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract usdt is ERC20, Ownable{
    constructor() ERC20("TETHER","USDT") Ownable(msg.sender) {

    }

function minting(address account,uint value) public onlyOwner {
    _mint(account, value);
    
}
function deposit(uint value) public{
    transfer(msg.sender, value);
}






    



}