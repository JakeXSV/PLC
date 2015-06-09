insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x y =
    if x < head y then
        x:y
    else
        head y:insert x (tail y)

sortHelper :: [Int] -> [Int] -> [Int]
sortHelper x y =
    if null x then
        y
    else
        sortHelper (tail x) (insert (head x) y)

sort :: [Int] -> [Int]
sort x = sortHelper x []
