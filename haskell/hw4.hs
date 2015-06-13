-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk4.pdf

num_digits :: Int -> Int
num_digits x
    | x <= 9 = 1
    | otherwise = 1 + num_digits (x `div` 10)

max_digits :: [Int] -> Int
max_digits (x:xs)
    | null xs = num_digits x
    | num_digits x > max_digits xs = num_digits x
    | otherwise = max_digits xs
