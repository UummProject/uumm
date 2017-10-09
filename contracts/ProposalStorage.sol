pragma solidity 0.4.15;

//TODO create an interface out of it once its signature is clear
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
        bytes32 referenceHash; //it is a json file, includes proposal title
        proposalState state;
        mapping (address=>int256) votes; //votes can be negative or positive. So we can track who has voted and its weight
        uint256 positiveVotes; //Necessary so we don't have to iterate over all the votes to know the final count.
        uint256 negativeVotes;
        uint creationTimestamp;
        uint256 totalSupply; //This is so we can calculate the percentage of positive and negative votes even after resolution (totalSupply may increase after)
    }

    proposalData [] public proposals;

    //Necessary? 'proposals' is public
    function getProposalsLength(bytes32 projectId) constant returns (uint256){
        return proposals.length;
    }

    function addProposal()
    {
        //checks here
        uint256 proposalId = proposals.length;

        proposalData memory proposal;
        proposal.id = proposalId;
        proposal.author = msg.sender;
    }
}
