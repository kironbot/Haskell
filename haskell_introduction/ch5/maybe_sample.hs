-- 型に別名を付けておく
type Category = String -- 商品のカテゴリ
type Name = String -- 商品名
type Price = Integer -- 金額
type Menu = [(Category, [(Name, Price)])] -- メニュー
type Item = (Category, Name, Price) -- 商品

-- メニューデータの例
menu :: Menu
menu =
    [
        ("Foods",
        [("Hamburger", 120),
        ("FrenchFries", 100)
        ]),
        ("Drinks",
        [("Cola", 80),
        ("Tea", 100)
        ])
    ]

getItemWithMonad :: Menu -> Category -> Name -> Maybe Item
getItemWithMonad menu category name = do
    subMenu <- lookup category menu
    price <- lookup name subMenu
    return (category, name, price)