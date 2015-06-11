-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk4.pdf

num_digits :: Int -> Int
num_digits x
    | x <= 9 = 1
    | x > 9 = 1 + num_digits (x `div` 10)
