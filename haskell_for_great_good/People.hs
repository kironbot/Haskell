data Person = Person {
    firstName :: String
    , lastName :: String
    , age :: Int
} deriving (Show, Eq, Read)


mikeD = Person {firstName="Michael", lastName="Diamond", age=43}
adRock = Person {firstName="Adam", lastName="Horovitz", age=41}
mca = Person {firstName="Adam", lastName="Yauch", age=44}
