data Dog = Dog deriving Show
data Cat = Cat deriving Show
data Human = Human String deriving Show

class Greeting a where
    name :: a -> String
    hello :: a -> String
    hello _ = "..." -- hello関数のデフォルトの実装
    bye :: a -> String
    bye _ = "..." -- bye関数のデフォルトの実装

instance Greeting Human where
    name (Human n) = n
    hello h = "Hi, I'm " ++ name h ++ "."
    bye _ = "See you."

instance Greeting Dog where
    name _ = "a dog"
    hello _ = "Bark!"

instance Greeting Cat where
    name _ = "a cat"
    bye _ = "Meow..."

class Greeting a => Laughing a where
    laugh :: a -> String

instance Laughing Human where
    laugh _ = "Hahaha...!!"