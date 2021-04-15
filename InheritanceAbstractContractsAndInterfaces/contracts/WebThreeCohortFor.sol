// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import './SafeMath.sol';

contract WebThreeCohortFour{
    using SafeMath for uint8;
    
    //state variables
    uint8 public participantId;
    address admin;
    
    bool emergency;
    
    struct CohortFour{ 
        address participantAddress; 
        string firstName;
        string lastName;
        string stack;
        bool active;
        uint8 grade;
    }
    
    mapping(address => CohortFour) public participants;
    
    //events
    event participantAdded(
        address participantAddress, 
        string firstName, 
        string lastName
    );
    
    event gradeAdded(
        address participantAddress,
        uint8 grade
    );
    
    
    //modifier
    modifier onlyAdmin {
        require( msg.sender==admin, "Only admin can call this function, go away");
        _;
    }
    
    constructor(){
        admin = msg.sender;
    }
    
    function addParticipant(
        address _participantAddress, 
        string memory _firstName, 
        string memory _lastName, 
        string memory _stack
        ) public onlyAdmin returns(bool)
        {
            
            participants[_participantAddress] = CohortFour(_participantAddress, _firstName, _lastName, _stack, true, 0);
            emit participantAdded(_participantAddress, _firstName, _lastName);
            return true;
        }
        
    function gradeParticipant(uint8 _grade) public returns(bool)
    {
        participants[msg.sender].grade = _grade.add(participants[msg.sender].grade);
        emit gradeAdded(msg.sender, _grade);
        return true;
    }
    
    // function deactivateParticipant{}
    
    // function payQuizBounty{}
    
    // function updateStack{}
}
