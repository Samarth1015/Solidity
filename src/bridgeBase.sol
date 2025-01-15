// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import"@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/interfaces/IERC20.sol";

interface IWShibu is IERC20 {
    function mint(address to,uint value) external  ;
    function burn(address to,uint val) external ;


    
}
contract Bridgebase is Ownable {
mapping (address => uint) private  pendingbal;
   address  private  tokenaddress;

    constructor(address _tokenaddress) Ownable(msg.sender) {
tokenaddress=_tokenaddress;
    }
    
  
    function minting(IWShibu _tokenaddress,uint value) public {

require(address(_tokenaddress)==tokenaddress);

require(pendingbal[msg.sender]>=value);
pendingbal[msg.sender]-=value;
   _tokenaddress.mint(msg.sender,value);

    
    }
    event burned(address _add,uint value);
    function burn(IWShibu _tokenaddress, uint value )public {
        require(pendingbal[msg.sender]>=value);
        pendingbal[msg.sender]-=value;
_tokenaddress.burn(msg.sender, value);
emit burned(msg.sender, value);



    }
    function depositOnOtherSide(uint value)public onlyOwner {
pendingbal[msg.sender]+=value;
    }


    
}