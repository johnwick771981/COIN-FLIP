// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CoinFlip{

    address public owner;
    address[] public players;
    
    struct Player
    {
        uint256 balance;
        address playerAddress; 
    }

    mapping (address => Player) public playerWallet;
    
    constructor()
    {
        owner = msg.sender;
        playerWallet[owner] = Player(0,owner);        
    }

    function genRandom() public view returns(uint) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)))%2;
    }

    function flipCoin(uint256 bet) public payable returns (uint256)
    {
        uint256 randomValue = uint256(genRandom());
        uint256 money = msg.value;
        if (uint256(bet) == randomValue)
        {
            payWinner(msg.sender,money*2);  
        }
        else
        {
            playerWallet[msg.sender].balance -= money;
            payWinner(owner,money);
        }

        return randomValue;
    }

    function depositMoney(address playerAddress) public payable returns (uint256) 
    {
        uint256 money =  msg.value;
        
        playerWallet[playerAddress].balance += money;
        playerWallet[playerAddress].playerAddress = playerAddress;
        
        return playerWallet[playerAddress].balance;
    }

    function payWinner(address winnerAddress, uint256 money) public
    { 
        payable(winnerAddress).transfer(money);
        playerWallet[winnerAddress].balance += money;       
    } 
}

