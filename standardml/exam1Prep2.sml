(*
merge two sorted lists
e.g.
merge([1,3,5],[2,4,6]) = [1,2,3,4,5,6]
*)
fun merge([],[]) = []
	| merge(x::xs, []) = x::xs
	| merge([], x::xs) = x::xs
	| merge(x::xs, y::ys) =
		if x < y then
			merge(xs, x::y::ys)
		else
			y::merge(x::xs, ys);

