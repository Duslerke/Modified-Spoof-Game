import           System.Random
import           Data.Char

type Coins = Int

calculateNextMove :: Coins -> Coins
calculateNextMove currentCoins | distanceToControlSequence == 0 = 1
                               | otherwise = distanceToControlSequence
    where distanceToControlSequence = (currentCoins - 1) `mod` 4


data Player = PunyHuman | GloriousAI deriving (Eq, Show)


turnAction :: Coins -> Player -> IO Coins
turnAction coins player
    | player == PunyHuman = do
        putStrLn
            $  "\nThere're currently  "
            ++ show coins
            ++ " coins on the table. Pick from 1-3: "
        playerChoice <- read <$> getLine
        let leftOverCoins = coins - playerChoice
        if leftOverCoins >= 0 && playerChoice > 0 && playerChoice < 4
            then do
                putStrLn
                    $  "\nThe player took "
                    ++ show playerChoice
                    ++ " coins, "
                    ++ show leftOverCoins
                    ++ " remaining."
                return leftOverCoins
            else do
                putStrLn "\nCan't do that! Learn to count!"
                turnAction coins player
    | player == GloriousAI = do
        let aiChoice      = calculateNextMove coins
        let leftOverCoins = coins - aiChoice
        putStrLn
            $  "AI has taken "
            ++ show aiChoice
            ++ " coins, "
            ++ show leftOverCoins
            ++ " remaining"
        return leftOverCoins


switchPlayer :: Player -> Player
switchPlayer player | player == PunyHuman  = GloriousAI
                    | player == GloriousAI = PunyHuman


turn :: Coins -> Player -> IO ()
turn coins player = do
    remainingCoins <- turnAction coins player
    if remainingCoins == 0
        then
            putStrLn
            $  "The "
            ++ show (switchPlayer player)
            ++ " player won the match!"
        else turn remainingCoins $ switchPlayer player


lowerString :: String -> String
lowerString str = [ toLower loweredString | loweredString <- str ]


startTheGame :: StdGen -> IO ()
startTheGame gen = do
    let (randCoins, _) = randomR (1, 33) gen :: (Int, StdGen)
    putStrLn $ "There are " ++ show randCoins ++ " of coins on the table."
    putStrLn "Do you want to be a first player (Y)? "
    isFirstAnswer <- lowerString <$> getLine
    if isFirstAnswer == "y"
        then turn randCoins PunyHuman
        else turn randCoins GloriousAI
    putStrLn "The game is over!"
    getLine
    return ()


main = do
    gen <- getStdGen
    startTheGame gen
