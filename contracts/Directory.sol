pragma solidity ^0.4.2;

import "./IGovernance.sol";
import "./IMerit.sol";

contract Directory {

    address owner;

    struct Record {
        IMerit meritContract;
        IGovernance governanceContract;
        address owner;
    }

    mapping (bytes32=>Record) records;


    function Directory(address _contractAddress)
    {
    }

    function getMeritContract(bytes32 recordId) returns (IMerit)
    {
        return records[recordId].meritContract;
    }

    function getGovernanceContract(bytes32 recordId) returns (IGovernance)
    {
        return records[recordId].governanceContract;
    }
}
