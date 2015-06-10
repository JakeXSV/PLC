-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk3.pdf

insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys) =
    if x < y then
        x:(y:ys)
    else
        y:insert x ys

sortHelper :: [Int] -> [Int] -> [Int]
sortHelper [] y = y
sortHelper (x:xs) y = sortHelper xs (insert x y)

sort :: [Int] -> [Int]
sort x = sortHelper x []

sqsumHelper :: Int -> Int -> Int
sqsumHelper 0 sum = sum
sqsumHelper cur sum = sqsumHelper (cur-1) (sum+cur*cur)

sqsum :: Int -> Int
sqsum x = sqsumHelper x 0

lessHelper :: Int -> [Int] -> [Int] -> [Int]
lessHelper someNum [] lessThanList = lessThanList
lessHelper someNum (x:xs) lessThanList =
    if someNum < x then
        lessHelper someNum xs (x:lessThanList)
    else
        lessHelper someNum xs lessThanList

less :: (Int, [Int]) -> [Int]
less (x, y:ys) = lessHelper x (y:ys) []
