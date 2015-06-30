-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk5.pdf

is_member :: (Eq a) => [a] -> a -> Bool
is_member l x = foldl (\hasBeenFound e -> if not hasBeenFound then x == e else hasBeenFound) False l

split_string_list = [' ','.',';','?',':','!','\t', '\n']

removeFirstSymbols :: [Char] -> [Char]
removeFirstSymbols ([]) = []
removeFirstSymbols (x:xs)
    | null xs = []
    | is_member split_string_list x = removeFirstSymbols xs
    | otherwise = x:xs

removeFirstWord :: [Char] -> [Char] -> [Char]
removeFirstWord someWord someSentence = drop (length someWord + 1) someSentence

get_first_word :: [Char] -> [Char]
get_first_word (x:xs)
    | null xs = []
    | is_member split_string_list x = []
    | otherwise = x : get_first_word xs

splitter :: [Char] -> [[Char]]
splitter someSentence
        | null fixedSentence = []
        | otherwise = get_first_word fixedSentence : splitter (removeFirstWord (get_first_word fixedSentence) fixedSentence)
    where
        fixedSentence = removeFirstSymbols someSentence
