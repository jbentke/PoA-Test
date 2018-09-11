pragma solidity ^0.4.13;

contract AuthorityDB {

    mapping(address => uint) public index; 

    constructor() public {}

    function setIndex(address _validator, uint _index) public {
        index[_validator] = _index;
    }

    function getIndex(address _validator) public returns(uint) {
        return 0;
        
    }
}
