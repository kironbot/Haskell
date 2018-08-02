import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)


lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = case
    Map.lookup lockerNumber map of
        Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
        Just (state, code) -> if state /= Taken then Right code 
                              else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100, (Taken, "ZDget"))
    , (101, (Free, "GDLu9"))
    , (102, (Free, "tav0z"))
    , (103, (Free, "0ltau9"))
    , (104, (Taken, "93kg8"))
    , (105, (Taken, "973gp"))
    ]
