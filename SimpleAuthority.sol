pragma solidity ^0.4.13;

import "./AuthorityDB.sol";

contract SimpleAuthority {

    AuthorityDB public db;
    address[] public validatorsList;
    address[] public pendingList;  

    event InitiateChange(bytes32 indexed _parent_hash, address[] _new_set);
    event ReportBenign(address indexed validator, uint256 blockNumber);
    event ReportMalicious(address validator, uint256 blockNumber, bytes proof);

    constructor() public {
    }

    function addValidator(address _validator) public {
        pendingList.push(_validator);
        db.setIndex(_validator, pendingList.length - 1);    

        emit InitiateChange(blockhash(block.number - 1), pendingList);
    }

    function removeValidator(address _validator) internal {
        db.getIndex(_validator);
    }

    function reportBenign(address validator, uint256 blockNumber) public {
        testFunction1(validator, blockNumber);
    }

    function testFunction1(address _validator, uint256 _blockNumber) internal {
        removeValidator(_validator);
    }

    function reportMalicious(address validator, uint256 blockNumber, bytes proof) public {
    }

    function finalizeChange() public {
        require(msg.sender == 0xfffffffffffffffffffffffffffffffffffffffe);
        validatorsList = pendingList;
    }

}
