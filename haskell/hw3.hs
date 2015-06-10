test (x:xs) =
    if null xs then
        x
    else
        test xs

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
