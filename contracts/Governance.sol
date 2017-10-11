pragma solidity 0.4.15;

import "./Directory.sol";

contract ICreateProposal{
    //'referenceHash' assumes sha-256 encoded in hex
    // https://ethereum.stackexchange.com/questions/17094/how-to-store-ipfs-hash-using-bytes
    function createProposal(string title, bytes32 referenceHash);
}

contract IVoteProposal{
    function voteProposal(uint256 proposalId, bool vote);
    function resolveProposal(uint256 proposalId);
}

contract IMerit{
    function getTotalSupply(bytes32 projectId) constant returns (uint256);
    function getMerit(address entity) constant returns (uint256);
}


contract Governance is IVoteProposal, ICreateProposal{
    Directory directory;

    function Governance(Directory _directory)
    {
        directory = _directory;
    }

    function createProposal(string title, bytes32 referenceHash)
    {
        directory.createProposalContract().createProposal(title, referenceHash);
    }

    function voteProposal(uint256 proposalId, bool vote)
    {
        directory.voteProposalContract().voteProposal(proposalId, vote);
    }

    function resolveProposal(uint256 proposalId)
    {
        directory.voteProposalContract().resolveProposal(proposalId);
    }

}