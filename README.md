# Modified-Spoof-Game
As per College assignment I had to create an AI that would beat a human if given a chance in modified game of Spoof.

The game is that you have random number of coins and 2 players. Players take turns taking from 1 to 3 coins until someone is eventually forced to take the last one. Whoever does that loses.

While this was supposed to be a pseudocode, I thought that this is easy enough project to try out some of the things I read on Haskell. The code is not stellar by any means, however given this is my 1st Haskell program, so I'm happy it simply compiles. :D

Now, this is not a fair game. The goal is to end your turn with a certain number of coins remaining that follows certain sequence on a number line. It pretty much means that once 1 player gets going, it doesn't matter what the other does. As a result you'll have 75% chance to win as the 1st player, and 25% chance to win as 2nd player (given both players make perfect moves).

If the player knows what he's doing, the game outcome will be decided when number of coins and playorder (of human vs ai) is decided. So I'll go as far as to say that this is an "extended biased coin flip". :D
