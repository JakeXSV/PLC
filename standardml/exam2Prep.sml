(* 1-1
type myTuple = int * real;
val myTupleData = (1, 3.4) : myTuple;
fun myTupleTester(x:myTuple) = true;
myTupleTester(myTupleData);
*)

(* 1-2
datatype intList = Empty | data of int * intList;
*)

(* 1-3
type takeIntRetBool = int -> bool;
*)

(* 1-4
datatype coins = Dime | Nickel | Quarter | Penny;
val test = Dime;
*)

(* 1-5
datatype IntAndReal = I of int | R of real;
*)

(* Polymorphism

Overloading
-multiple fn declarations with different params || pattern matching

Parameter Coercion
-implicit conversion

Parametric Polymorphism
-function that takes generics/any type

Subtype Polymorphism
-takes subtype/inheritance-esque

*)

(* 2-1
Parametric polymorphism
*)

(* 2-2
fun myOverloadedFunc(x:int) = true
	| myOverloadedFunc(x:real) = true
	| myOverloadedFunc(x:int * int) = true;
*)

(* 2-1 alternate
fun doubleIt nil = []
	| doubleIt L =
	let fun doubleHelper(nil, res) = res
	| doubleHelper(x::xs, res) =
		doubleHelper(xs, res@(x*2::[]))
	in
		doubleHelper(L, [])
	end;
*)

(* 2-1 
map - applies function to list/tuple and returns list/tuple

fun doubleItMap nil = []
	| doubleItMap L =
		map (fn e => e * 2) L;
*)

(* 2-2 get sum of list
fun sumItUp nil = 0
	| sumItUp L =
		foldr (fn(e,i) => e+i) 0 L;
*)

(* 2-3 custom list filter
fun myFilter f L =
	foldr (fn (i,c) => if f(i) then i::c else c) [] L;
*)

(* 2-4 dot product
datatype 'a option = None | Some of 'a;

fun dotProduct L nil = None
	| dotProduct nil R = None
	| dotProduct L R =
		if (length L = length R) then
			let fun helper(nil,nil,res) = Some(res)
				| helper(x::xs,y::ys,res) =
					helper(xs, ys, res+(x*y))
			in
				helper(L,R,0)
			end			
		else
			None

fun length x = foldr (fn(e,i) => e+1) 0 x;
*)
