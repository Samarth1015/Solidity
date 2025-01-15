// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import"@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract BridgeEth is Ownable {
    address  private  tokenaddress;

mapping (address => uint) private   pendingbal;
    constructor(address _tokenaddress) Ownable(msg.sender) {
tokenaddress=_tokenaddress;


    }
    event DepositHappen(address to, uint value);

    function Lock (IERC20 _tokenAddress,uint value) public {
      require(address(_tokenAddress)==tokenaddress);
      require(_tokenAddress.allowance( msg.sender, address(this) )>=value ) ;
      require(_tokenAddress.transferFrom(msg.sender, address(this), value));

      emit DepositHappen(address(this), value);


       

        

emit  DepositHappen(msg.sender, value);
    }
    function withdraw(IERC20 _tokeaddress ,uint value) public {
        require(address(_tokeaddress)==tokenaddress);
        require(pendingbal[msg.sender]>=value);
        pendingbal[msg.sender]-=value;
        _tokeaddress.transfer(msg.sender, value);


    
    }
    function burnOnOtherSide(address ad,uint val)public onlyOwner {
        pendingbal[ad]+=val;

    }


    
}