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
