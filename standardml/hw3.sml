(*
Jacob Prather
Programming Languages Concepts
Homework 3
*)

val myList = [5,0,4,3,1];

(*
#1
insert()
second attempt
*)
fun insert (x:int, []) = [x]
	| insert (x:int, y::ys) =
        	if x<=y then x::y::ys
                else y::insert(x, ys)

(*
#1 
insertFirstAttempt() this was my first go at doing #1
partitions list into 2 chunks, one that is less than insert value, one that is greater.
The insert value is added to "greater list", then the two lists are concatenated back together.
*)
fun insertFirstAttempt(value:int, y:int list) =
	(#1(List.partition (fn x => if value > x then true else false) y))@(value::(#2(List.partition (fn x => if value > x then true else false) y)))

(*
#2
performs an insert-sort on an integer list.
*)
fun sort [] = []
	| sort (x::xs) =
	insertFirstAttempt(x, sort xs)

(*
#3
Returns the sum of all 'sub' squares. E.g. sqsum 3 = 1*1 + 2*2 + 3*3
*)
fun sqsum(x:int) =
	if x = 0 then 0
	else x*x + sqsum(x-1)

(*
#4
returns a list of elements, from L, that are less than e
*)
fun less(e:int, L:int list) = 
	#1(List.partition (fn x => if x < e then true else false) L)
