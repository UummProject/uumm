pragma solidity ^0.4.2;

contract Proxy {
  address  public contractAddress;

  function Proxy(address _contractAddress)
  {
   contractAddress = _contractAddress;
  }

  function getContractAddress()
    returns (address)
  {
   return contractAddress;
  }
}
