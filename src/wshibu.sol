// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract WShibu is ERC20 ,Ownable{

    constructor() ERC20("Bridge Shibu inu","wShib") Ownable(msg.sender){
    
    }
    function mint(address _to,uint value) public onlyOwner {
_mint(_to, value);
        
    }
    function burn(address _of,uint value) public onlyOwner{
        _burn(_of,value);

     

    }
    
} 