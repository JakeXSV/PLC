-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk3.pdf

insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys) =
    if x < y then
        x:(y:ys)
    else
        y:insert x ys

sort :: [Int] -> [Int]
sort (x:xs)
    | null xs = [x]
    | not (null (x:xs)) = insert x (sort xs)

sqsum :: Int -> Int
sqsum x
    | x == 0 = 0
    | otherwise = x*x + sqsum (x-1)

less :: (Int, [Int]) -> [Int]
less (x, []) = []
less (x, y:ys) =
    if y < x then
        y:less (x, ys)
    else
        less (x, ys)
