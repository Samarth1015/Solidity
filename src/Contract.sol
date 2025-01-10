// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/access/Ownable.sol";
import "forge-std/console.sol";
contract Counter is ERC20, Ownable
 {
    
   constructor() ERC20("SamarthCoin","SAM") Ownable(msg.sender){
    
    
   }

function mint(address _add,uint val) public onlyOwner {
    console.logString("hello from mint");
    _mint(_add, val);

}
function trans(address to,uint val) public{
    transfer(to, val);
}


   
   

   
  

}
