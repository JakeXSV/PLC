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

right_digit :: Int -> Int
right_digit x
    | num_digits x == 1 = x
    | otherwise = right_digit (x - (10 ^ (num_digits x - 1)))

nth_digit :: (Int, Int) -> Int
nth_digit (x, n)
    | (n-1) <= 0 = right_digit x
    | otherwise = nth_digit (x `div` 10, n-1)

bucket :: (Int, Int, [Int]) -> [Int]
bucket (d, n, l)
    | null l = []
    | nth_digit(head l, n) == d = head l : bucket(d, n, tail l)
    | otherwise = bucket(d, n, tail l)
