# COIN-FLIP
Created a Blockchain project for WEB3 
We first built a normal random function generator function (using odd-even concept).
The Coinflip function checks whether the bet placed is equal to random value or not. 
If Player wins, then amount is added to his/her account and else deducted and added to owner's account.
Player wallet is a map that maps address of the player to the player struct which has 2 fields balance and player address.
Testing was done on REMIX online IDE, where I started with 10000 units of money for the owner and 9000 for the player. After the 1000 bet was placed, it was observed that the Player emerged victorious and 1000 units was added to his wallet.

NOTE - This code was implemented in almost 2 hours including testing on REMIX IDE on my local server. Some edge cases like minimum starting amount etc. can still be implemented and deployment can be done in future times if more time is provided.
