pragma solidity 0.4.15;

contract ICreateProposal
{
    //'referenceHash' assumes sha-256 encoded in hex
    // https://ethereum.stackexchange.com/questions/17094/how-to-store-ipfs-hash-using-bytes
    function CreateProposal(string title, bytes32 referenceHash);
}

contract IVoteProposal
{
    function VoteProposal(uint256 proposalId, bool vote);
    function ResolveProposal(uint256 proposalId);
}

contract IMerit
{
    function GetTotalSupply(bytes32 projectId) constant returns (uint256);
    function GetMerit(address entity) constant returns (uint256);
}

