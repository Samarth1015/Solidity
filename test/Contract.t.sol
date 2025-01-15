// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/Contract.sol";
import "forge-std/console.sol";



contract TestContract is Test {
   event Transfer(address indexed from, address indexed to, uint256 value);

    Counter c;

    function setUp() public {
       c = new Counter();
    }
function testminting() public{
   c.mint(address(this), 100);
   
   assertEq(c.balanceOf(address(this)),uint256(100),"ok" );


   assertEq(c.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD), 0,"ok");
}

function testTransfer() public{

   c.mint(address(this), 100);

   uint256 bal=c.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD);
   c.trans(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 10);
      assertTrue(bal+10 == (c.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD)));

         vm.prank(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD);
      c.trans(address(this), 10);
      assertEq(c.balanceOf(address(this)),100,"ok" );
      assertEq(c.balanceOf    (0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD), 0,"ok");



}
function testApproval () public {
   c.mint(address(this), 100);
   c.approve(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 10);
   vm.prank(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD);
   c.transferFrom(address(this), 0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 5);
   assertEq(c.balanceOf(address(this)),uint (95),"ok");
   assertEq(c.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD) , uint (5),"ok");

   


}
function testEmittrasfer()public{
   c.mint(address(this), 100);

   vm.expectEmit(true, true, false, true);
   emit Transfer(address(this), 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);
   c.trans(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10);


}
function testDeal() public {
   
   vm.deal(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 10 ether);
   
console.logInt(int (address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).balance));
   assertEq(address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).balance, 10 ether,"ok");

}

      

    }
