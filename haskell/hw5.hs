-- See https://github.com/Jakehp/PLC/blob/master/pdfs/hwk5.pdf

is_member :: (Eq a) => a -> [a] -> Bool
is_member x l =
    foldl
        (\
            hasBeenFound e ->
            if not hasBeenFound then
                x == e
            else
                hasBeenFound
        )
        False l

split_string_list = [' ',',', '.',';','?',':','!','\t', '\n']

removeFirstSymbols :: [Char] -> [Char]
removeFirstSymbols l = dropWhile (\e -> is_member e split_string_list) l

removeFirstWord :: [Char] -> [Char]
removeFirstWord l = dropWhile (\e -> not $ is_member e split_string_list) l

get_first_word :: [Char] -> [Char]
get_first_word l = takeWhile (\e -> not $ is_member e split_string_list) l

splitter :: [Char] -> [[Char]]
splitter someSentence
        | null fixedSentence = []
        | otherwise = get_first_word fixedSentence : splitter (removeFirstWord fixedSentence)
    where
        fixedSentence = removeFirstSymbols someSentence

stop_words = "a,able,about,across,after,all,almost,also,am,among,an,and,any,are,as,at,be,\
    \because,been,but,by,can,cannot,could,dear,did,do,does,either,else,ever,every,\
    \for,from,get,got,had,has,have,he,her,hers,him,his,how,however,i,if,in,into,is,\
    \it,its,just,least,let,like,likely,may,me,might,most,must,my,neither,no,nor,not,\
    \of,off,often,on,only,or,other,our,own,rather,said,say,says,she,should,since,so,\
    \some,than,that,the,their,them,then,there,these,they,this,tis,to,too,twas,us,\
    \wants,was,we,were,what,when,where,which,while,who,whom,why,will,with,would,yet,\
    \you,your";

-- Not a very good func name for what it does...
-- are_stop_words is better.
is_stop_word :: [Char] -> [Bool]
is_stop_word sentence = map (\e-> is_member e $ splitter stop_words) $ splitter sentence

get_stop_words :: [Char] -> [[Char]]
get_stop_words sentence =
    foldl
        (\
            stopWords e ->
            if (is_member e $ splitter stop_words) && (not $ is_member e stopWords) then
                e:stopWords
            else
                stopWords
        )
        [] (splitter sentence)

remove_stop_words :: [Char] -> [[Char]]
remove_stop_words sentence =
    foldl
        (\
            regWords e ->
            if (not $ is_member e $ splitter stop_words) && (not $ is_member e regWords) then
                e:regWords
            else
                regWords
        )
        [] (splitter sentence)
