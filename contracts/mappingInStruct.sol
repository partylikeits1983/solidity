// SPDX-License-Identifier: MIT
pragma solidity =0.8.15;

contract Test {

    struct Params1 {
        uint a;
        mapping(address => Params2) parameters;
    }

    struct Params2 {
        uint b;
        uint c;
    }

    mapping(address => Params1) public map;

    function createRequest(uint value) public {
        Params1 storage newParams = map[msg.sender];
        newParams.a = value;
        newParams.parameters[msg.sender].b = 1;
        newParams.parameters[msg.sender].c = 2;
        
    }

    function getVals() public view returns(uint,uint) {
        Params2 memory vals = map[msg.sender].parameters[msg.sender];
        return (vals.b,vals.c);
    } 
}


