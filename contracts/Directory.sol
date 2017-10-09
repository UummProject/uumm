pragma solidity 0.4.15;

import "./IGovernance.sol";
import "./zeppelin/ownership/Ownable.sol";

contract Directory is Ownable{

    IMerit voteMeritContract;
    IVoteProposal voteProposalContract;
    IMerit createProposalMeritContract;
    ICreateProposal createProposalContract;
    ProposalStorage proposalStorageContract;

    function Directory(address _owner)
    {
        owner = _owner;
    }

    function replaceVoteMerit(IMerit newVoteMeritContract) onlyOwner {
        voteMeritContract = newVoteMeritContract;
    }

    function replaceVoteProposal(IVoteProposal newVoteProposalContract) onlyOwner {
        voteProposalContract = newVoteProposalContract;
    }

    function replaceCreateProposalMerit(IMerit newCreateProposalMeritContract) onlyOwner {
        createProposalMeritContract = newCreateProposalMeritContract;
    }

    function replaceCreateProposal(ICreateProposal newCreateProposalContract) onlyOwner {
        createProposalContract = newCreateProposalContract;
    }

    function replaceProposalStorage(ProposalStorage newProposalStorage) onlyOwner {
        proposalStorageContract = newProposalStorage;
    }

}
