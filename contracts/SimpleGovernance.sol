pragma solidity 0.4.15;

import "./IGovernance.sol";

contract SimpleGoverance
{
    //'referenceHash' assumes sha-256 encoded in hex
    // https://ethereum.stackexchange.com/questions/17094/how-to-store-ipfs-hash-using-bytes
    function CreateProposal(string title, bytes32 referenceHash)
    {
        
    }
    function VoteProposal(uint256 proposalId, bool vote)
    {

    }
    function ResolveProposal(uint256 proposalId)
    {

    }
}
