pragma solidity ^0.4.2;

contract ProposalStorage
{
    enum proposalState{
        ongoing, //ongoing proposal, users can still vote
        approved, //succesfully resolved proposal, can't be change
        denied, //denied proposal, can't be changed
        expired //no minimum participation was reached and deadline expired
    }
    
    struct proposalData{
        uint256 id; 
        address author;
        string title;
        bytes32 referenceHash;
        proposalState state;
        mapping (address=>int256) votes; //votes can be negative or positive. So we can track who has voted and its weight
        uint256 positiveVotes; //Necessary so we don't have to iterate over all the votes to know the final count.
        uint256 negativeVotes;
        uint creationTimestamp;
        uint256 totalSupply; //This is so we can easly calculate the percentage of positive and negative votes even after resolution
    }

    proposalData [] proposals;

    function getProposalsLength(bytes32 projectId) constant returns (uint256){
        return projects[projectId].proposals.length;
    }

    function addProposal(proposalData proposal){
        proposals.push(proposal);
    }
}


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
