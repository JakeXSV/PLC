(*
2-2
pattern match a list of 2 or more elements
*)

fun twoMore([]) = false
	| twoMore([a]) = false
	| twoMore([b,_]) = true
	| twoMore(c::d::_) = true;


val list22a = [1,2,3,4];
val list22b = [1,2];
val list22c = [1];

(*
twoMore(list22a);
twoMore(list22b);
twoMore(list22c);
*)

(*
2-3
pattern match a list of exactly 2 elements
*)

fun  matchTwo([]) = false
	| matchTwo([x,_]) = true
	| matchTwo(L) = false;

val list23a = [1,2,3,4]; 
val list23b = [1,2];
val list23c = [1];

(*
matchTwo(list23a);
matchTwo(list23b);
matchTwo(list23c);
*)

(*
3-1
write a fun length, gets length of list
*)

fun length([]) = 0
	| length(x::xs) = 
		1+length(xs);

val list31a = [1,2,3,4];
val list31b = [1,2];
val list31c = [1];

(*
length(list31a);
length(list31b);
length(list31c);
*)

(*
3-2
*)
fun sort2(a,b) =
	if a < b then
		a::b::[]
	else
		b::a::[];

sort2(2,3);
sort2(3,2);

(*
3-3
sort 3 ints
*)
fun sort3(a,b,c) = 
	if a<b  andalso b<c then
		a::b::c::[]
	else
		if b<a andalso a<c then
			b::a::c::[]
		else
			if c<a andalso a<b then
				c::a::b::[]
			else
				if b<c andalso c<a then
					b::c::a::[]
				else
					if a<c andalso c<b then
						a::c::b::[]
					else
						if c<b andalso b<a then
							c::b::a::[]
						else
							[];


sort3(2,3,1);

(*
3-4
cycle1([list]);
[1,2,3] => [2,3,1]
*)

fun cycle1([]) = []
	| cycle1(x::xs) =
		xs@(x::[]);

cycle1([1,2,3,4]);

(*
3-5
cycle(list L, number of times n)
*)
fun cycle(L,n)=
	if n > 0 then
		cycle(cycle1(L),n-1)
	else
		L

val cycleData = [1,2,3,4,5,6];
cycle(cycleData, 2);


(*
Lists's filter function.
apply a function f to every element l in list L
*)
fun filter(f, []) = []
	| filter(f, L) =
	let
		fun subfilter(f, [], res) = res
		| subfilter(f, x::xs, res) = 
			if f(x) then
				subfilter(f, xs, res@(x::[]))
			else
				subfilter(f, xs, res)
	in
		subfilter(f,L,[])
	end;
