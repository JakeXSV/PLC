-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk5.pdf

is_member :: [Int] -> Int -> Bool
is_member l x = foldl (\hasBeenFound e -> if not hasBeenFound then x == e else hasBeenFound) False l
