pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    //  address[] <- is dynamic array address[10] is limited to 10
    address[] public players;
    
    // Sets manager to the contract invocator
    function Lottery() public {
        manager = msg.sender;
    }
    
    function enter() public payable {
        // Used for validation
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }
    
    function random() private view returns(uint) {
        return uint(keccak256(block.difficulty, now, players));
    }
    
    function pickWinner() public restricted {
        // require(msg.sender == manager);
        uint index = random() % players.length;
        players[index].transfer(this.balance); // picks a player address in the array. this.balance references all money in current contract
        players = new address[](0);
    }
    
    // function returnEntries() {
    //     require(msg.sender == manager);
    // }
    
    // Modifier function, reduces code (omly manager can call) repetative logic
    // Add restricted name to any function and adds this code to _; area to write one modifier and use in many places!
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function getPlayers() public view returns (address[]) {
    return players;
    }
    
}