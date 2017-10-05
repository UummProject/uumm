pragma solidity ^0.4.2;

contract Governance {
  uint public data;

  function Governance() {
   data = 1;
  }

  function test(uint _data) {
   data = _data;
  }
}
