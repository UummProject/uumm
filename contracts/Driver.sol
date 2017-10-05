pragma solidity ^0.4.2;

import './Proxy.sol';
import './Governance.sol';

contract Driver {
    uint public data;
    Proxy public proxyContract;
    Governance public governanceContract;
    Governance public otherGovernanceContract;

    function Driver() {
        
    }

    function test(uint _data) {
        governanceContract = new Governance();
        proxyContract = new Proxy(governanceContract);
        otherGovernanceContract  = Governance(proxyContract.getContractAddress());
    }
}
