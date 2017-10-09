pragma solidity 0.4.15;

import "./IGovernance.sol";
//import "./zeppelin/ownership/Ownable.sol";

contract Directory {

    IMerit voteMeritContract;
    IVoteProposal voteProposalContract;
    IMerit createProposalMeritContract;
    ICreateProposal createProposalContract;
    ProposalStorage proposalStorageContract;
    address owner;


    function Directory(address _owner)
    {
    }

   /* function addGovernance(IMerit _voteMeritContract,
        IVoteProposal _voteProposalContract,
        IMerit _createProposalMeritContract,
        ICreateProposal _createProposalContract,
        ProposalStorage _proposalStorageContract)
    {
    }
*/
    function replaceVoteMeritContract(IMerit newVoteMeritContract)
    {
        voteMeritContract = newVoteMeritContract;
    }

}
