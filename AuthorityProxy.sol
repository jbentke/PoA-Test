pragma solidity ^0.4.13;

import "./AuthorityDB.sol";

contract AuthorityProxy {

    // STATE

    AuthorityDB public databaseContract;
    address[] public validatorsList;
    address[] public pendingList;

    address public authorityContract;

    // FUNCTIONS

    function() public {
        require(authorityContract.delegatecall(msg.data));
    }

    constructor() public {
        // initial authority contract
        authorityContract = 0x1000000000000000000000000000000000000006;
        databaseContract = AuthorityDB(0x1000000000000000000000000000000000000008);
        validatorsList.push(0x00Bd138aBD70e2F00903268F3Db08f2D25677C9e);
        pendingList.push(0x00Bd138aBD70e2F00903268F3Db08f2D25677C9e);
    }

    function getValidators() view public returns (address[] _validators) {
        return validatorsList;
    }

    function getValidatorsLength() view public returns(uint _length) {
        return validatorsList.length;
    }

    function getPending() view public returns (address[] _pending) {
        return pendingList;
    }

    function getPendingLength() view public returns (uint _length) {
        return pendingList.length;
    }

    function getAuthorityContract() public constant returns(address) {
        return authorityContract;
    }

    function getDatabaseContract() public constant returns(address) {
        return databaseContract;
    }
}
