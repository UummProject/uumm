pragma solidity ^0.4.2;

import './Proxy.sol';


contract Driver {
    uint public data;
    Proxy public proxyContract;

    function Driver() {
        proxyContract = new Proxy(this);
    }

    function transfer(uint _data) {
        data = _data;
    }
}
