pragma solidity ^0.4.2;

interface IMerit
{
    function GetTotalSupply(bytes32 projectId) constant returns (uint256);
    function GetMerit(address entity) constant returns (uint256);
}
