-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk4.pdf

num_digits :: Int -> Int
num_digits x
    | x <= 9 = 1
    | otherwise = 1 + num_digits (x `div` 10)

max_digits :: [Int] -> Int
max_digits [] = 0
max_digits (x:xs) =
    if num_digits x > max_digits xs then
        num_digits x
    else
        max_digits xs
