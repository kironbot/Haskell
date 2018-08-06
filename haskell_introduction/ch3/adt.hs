data Employee = NewEmployee Integer Bool String deriving (Show)

data CmdOption = COptInt Integer | COptBool Bool | COptStr String deriving (Show)

data TreeDict k v = TDEmpty | TDNode k v (TreeDict k v) (TreeDict k v) deriving (Show)

-- insert: k, v, TreeDict を引数にとり，TreeDictを返す
insert :: Ord k => k -> v -> TreeDict k v -> TreeDict k v
-- 第3引数のTreeDictの型でinsertの実装を分ける
-- TDEmptyコンストラクタの場合
insert k v TDEmpty = TDNode k v TDEmpty TDEmpty
-- TDNodeコンストラクタの場合
insert k v (TDNode k' v' l r) 
    | k < k'    = TDNode k' v' (insert k v l) r
    | k > k'    = TDNode k' v' l (insert k v r)
    | otherwise = TDNode k' v l r

-- lookup': k, TreeDict を引数にとり，Maybe v を返す
lookup' :: Ord k => k -> TreeDict k v -> Maybe v
lookup' _ TDEmpty = Nothing
lookup' k (TDNode k' v' l r)
    | k < k'    = lookup' k l
    | k > k'    = lookup' k r
    | otherwise = Just v'