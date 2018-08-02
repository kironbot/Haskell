import System.IO


main = do
    todoitem <- getLine
    appendFile "todo.txt" (todoitem ++ "\n")
