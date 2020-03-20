
type Coins = Int

calculateNextMove :: Coins -> Coins
calculateNextMove currentCoins | distanceToControlSequence == 0 = 1
                               | otherwise = distanceToControlSequence
    where distanceToControlSequence = (currentCoins - 1) `mod` 4

-- Maybe - make monad f. Either a b -- if its losing, mod 4 will be 0