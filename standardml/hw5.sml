(*
Jacob Prather
CS431 PLC
HW5
*)

(*
Global Vars
*)
val stop_words = "a,able,about,across,after,all,almost,also,am,among,an,and,any,are,as,at,be,because,been,but,by,can,cannot,could,dear,did,do,does,either,else,ever,every,for,from,get,got,had,has,have,he,her,hers,him,his,how,however,i,if,in,into,is,it,its,just,least,let,like,likely,may,me,might,most,must,my,neither,no,nor,not,of,off,often,on,only,or,other,our,own,rather,said,say,says,she,should,since,so,some,than,that,the,their,them,then,there,these,they,this,tis,to,too,twas,us,wants,was,we,were,what,when,where,which,while,who,whom,why,will,with,would,yet,you,your";

(*
1 - is_member
checks if x is a member of the list L
*)
fun is_member L x = foldr (fn (i,c)=> if i=x then true else c) false L;

(*
2 - splitter: string -> string list
*)
fun splitter "" = []
	|splitter x =
	let fun predicate(x) =
		if x = #"," orelse x = #";" orelse x = #" " orelse x = #"." orelse x = #"?" orelse x = #":" orelse x = #"!" orelse x = #"\t" orelse x = #"\n" then
			true
		else
			false
	in
		String.tokens predicate x
	end;

(*
3 - is_stop_word: string bool list
basically takes in a sentence, and returns a list of same size with bools of whether word is a stop or not
*)
fun is_stop_word x = 
	let fun checkSentence([]) = []
	| checkSentence(x::xs) =
		if is_member (splitter(stop_words)) x then
			true::checkSentence(xs)
		else
			false::checkSentence(xs)
	in
		checkSentence((splitter x))
	end;

(*
4 - get_stop_words
takes a sentence and returns all words that are stop words using foldr/l
*)
fun get_stop_words sen = 
	foldr (fn (i,res)=> if (hd (is_stop_word i) andalso (not (is_member res i))) then i::res else res) [] (splitter(sen));

(*
5 - remove_stop_words
*)
fun remove_stop_words sen = 
	foldr (fn (i,res)=> if (not (is_member (get_stop_words(sen)) i)) then (res@(i::[])) else res) [] (splitter(sen));
