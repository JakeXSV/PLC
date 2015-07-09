-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk5.pdf

is_member :: (Eq a) => [a] -> a -> Bool
is_member l x = foldl (\hasBeenFound e -> if not hasBeenFound then x == e else hasBeenFound) False l

split_string_list = [' ',',', '.',';','?',':','!','\t', '\n']

removeFirstSymbols :: [Char] -> [Char]
removeFirstSymbols l = dropWhile (\e -> is_member split_string_list e) l

removeFirstWord :: [Char] -> [Char]
removeFirstWord l = dropWhile (\e -> not(is_member split_string_list e)) l

get_first_word :: [Char] -> [Char]
get_first_word l = takeWhile (\e -> not(is_member split_string_list e)) l

splitter :: [Char] -> [[Char]]
splitter someSentence
        | null fixedSentence = []
        | otherwise = get_first_word fixedSentence : splitter (removeFirstWord fixedSentence)
    where
        fixedSentence = removeFirstSymbols someSentence
