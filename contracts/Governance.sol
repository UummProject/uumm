pragma solidity 0.4.15;

import "./Directory.sol";

contract ICreateProposal{

    Directory public directory;

    function ICreateProposal(Directory _directory)
    {
        directory = _directory;
    }
    //'referenceHash' assumes sha-256 encoded in hex
    // https://ethereum.stackexchange.com/questions/17094/how-to-store-ipfs-hash-using-bytes
    function createProposal(address author, bytes32 referenceHash);
}


contract IVoteProposal{
    Directory public directory;

    function IVoteProposal(Directory _directory)
    {
        directory = _directory;
    }

    function voteProposal(uint256 proposalId, bool vote);
    function resolveProposal(uint256 proposalId);
}


contract IMerit{
    function getTotalSupply(bytes32 projectId) constant returns (uint256);
    function getMerit(address entity) constant returns (uint256);
}

contract CreateProposalImplementation is ICreateProposal
{
    /*
    function CreateProposalImplementation(Directory _directory)
    {
        super(_directory);      
    }*/

    function CreateProposal(address author, bytes32 referenceHash)
        returns (bool)
    {
        uint256 voteWeight = directory.createProposalMeritContract().getMerit(author);
        if(voteWeight<=0)
            return false;

        bool added =  directory.proposalStorageContract().addProposal(author, referenceHash);

        /*if(added)
            record contributor
        */
        return added;
    }

}



contract GovernanceBridge is IVoteProposal, ICreateProposal{
    Directory directory;

    function GovernanceBridge(Directory _directory)
    {
        directory = _directory;
    }

    function createProposal(address author, bytes32 referenceHash)
    {
        directory.createProposalContract().createProposal(author, referenceHash);
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