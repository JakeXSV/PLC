(*
Jacob Prather
Programming Languages Concepts
CS-431
*)

(*
1 - takes integer n and returns number of digits in n
*)
fun num_digits(x:int) =
        if x>9 then
                1+num_digits(Int.div(x,10))
        else 1;

(*
2 - takes a list of integers and returns the maximum number of digits of the integers in L
*)
fun max_digits nil = 0
	| max_digits(x::xs) = 
		if num_digits(x) > max_digits(xs) then
			num_digits(x)
		else
			max_digits(xs);

(*
3 - Returns nth digit of the integer x
*)
fun nth_digit(x:int, n:int) =
	if n = 1 then
		x-((x div 10)*10)
	else 
		nth_digit(x div 10, n-1);

(*
4 - Return a list of integers that have d digit at nth digit in list L
*)
fun bucket(d:int,n:int,L:int list) = 
	List.filter (fn x => nth_digit(x, n) = d) L


(*
5 - sorts integer list L based on nth digit of each int
*)
fun sort_nth_digit(n:int, []:int list) = []
	| sort_nth_digit(n:int, L:int list) =
	let fun sorter(count:int, n:int, L:int list, results:int list) =
		if count < 10 then
			sorter(count+1, n, L, (results@bucket(count,n,L)))
		else
			results
	in sorter(0,n, L, [])
	end;

(*
6 - sorts an integer list based on radix sort algo, given a maximum
*)
fun radix_sort_max(max, nil) = nil
        | radix_sort_max(max, L) =
        let fun sorter(count, max, L) =
                if count = max+1 then
			L
                else	
                        sorter(count+1, max, sort_nth_digit(count, L))
        in sorter(1, max, L)
        end;

(*
7 - radix_sort(L) - sorts an integer list L using radix sort
*)
fun radix_sort(L:int list) = 
	radix_sort_max(max_digits(L),L);
