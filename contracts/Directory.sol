pragma solidity 0.4.15;

import "./IGovernance.sol";

contract Directory {

    address owner;

    struct Governance {
        IMerit voteMeritContract;
        IVoteProposal voteProposalContract;

        IMerit createProposalMeritContract;
        ICreateProposal createProposalContract;

        ProposalStorage proposalStorageContract;
        
        address owner;
    }

    mapping (bytes32=>Governance) records;


    function Directory(address _contractAddress)
    {
    }

    function addGovernance(
        IMerit _voteMeritContract,
        IVoteProposal _voteProposalContract,
        IMerit _createProposalMeritContract,
        ICreateProposal _createProposalContract,
        ProposalStorage _proposalStorageContract,
        address _owner)
    {

    }
}
