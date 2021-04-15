// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import "./WebThreeCohortFor.sol";

contract WebThreeYearTwo is WebThreeCohortFour{
    uint256 public participantCount;

    struct YearMate{ 
        uint256 year;
        uint256 numberOfParticipants;
        address participantAddress;
    }
    
    mapping(address => YearMate) public yearmates;

    // //modifier
    // modifier onlyAdmin {
    //     require( msg.sender==admin, "Only admin can call this function, go away");
    //     _;
    // }
    
    constructor(){
        admin = msg.sender;
        participantCount = 0;
    } 

    function addYearMate (
        uint256 _year, 
        address _participantAddress, 
        string memory _firstName, 
        string memory _lastName, 
        string memory _stack
        ) public returns (bool){

        participantCount = participantCount+1;
        yearmates[_participantAddress] = YearMate(_year, participantCount, _participantAddress);
        return super.addParticipant(_participantAddress, _firstName, _lastName, _stack);
    }
}