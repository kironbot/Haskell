import Control.Monad.Trans.State
import Data.List

type Card = Int -- card
type Score = Int -- score
type Hand = [Card] -- hands
type Stock = [Card] -- stock
type Player = String -- player

-- 山札から指定した枚数のカードを引く
drawCards
  ::Int -> State Stock Hand -- 状態は山札，返り値は手札
drawCards n = do
  -- 状態である山札を取得する
  deck <- get
  -- 引いた残りを新たに山札に設定
  put $ drop n deck
  -- 引いたカードを返す
  return $ take n deck

gameWithState
  -- 状態は山札，返り値は（得点，手札，プレイヤー名）のリスト
  ::State Stock [(Score, Hand, Player)]
gameWithState = do
  -- 4人分のカードを配る
  taroHand <- drawCards 5
  hanakoHand <- drawCards 5
  takashiHand <- drawCards 5
  yumiHand <- drawCards 5

  -- 逆順にソートすれば合計得点が高い順に並ぶ
  return . reverse . sort $
    [(sum taroHand, taroHand, "Taro")
    , (sum hanakoHand, hanakoHand, "Hanako")
    , (sum takashiHand, takashiHand, "Takashi")
    , (sum yumiHand, yumiHand, "Yumi")
    ]