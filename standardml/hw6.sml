(*
Jacob Prather
CS431 PLC
HW6
*)

(*
1.1
*)
datatype grade = A | B | C | D | F;

(*
1.2
*)
fun percent2grade x =
  if x >= 90.0 then
    A
  else if x >= 80.0 then
    B
  else if x >= 70.0 then
    C
  else if x >= 60.0 then
    D
  else
    F

(*
1.3
*)
fun grade2point x =
  if x = A then
    4.0
  else if x = B then
    3.0
  else if x = C then
    2.0
  else if x = D then
    1.0
  else if x = F then
    0.0
  else	
    0.0

(*
1.4
*)
fun gpa [] = 0.0
	| gpa L = 
	let fun accumulate L = 
		foldr (fn (i,t)=>(t+(grade2point i))) 0.0 L
	in
		(accumulate L) / (Real.fromInt (List.length L))
	end;

(*
1.5
*)
fun gpaFromPercent L = gpa (map percent2grade L);

(*
2
*)
datatype 'data tree =
	Empty |
	Node of 'data tree * 'data * 'data tree;

(*
2.1
*)
fun isComplete Empty = true
	| isComplete (Node(x,y,z)) = 
		if (x = Empty andalso (not(z = Empty))) orelse ((not(x = Empty)) andalso z = Empty) then
			false
		else
			(isComplete x andalso isComplete z)

(*
2.2
insert is a helper function for makeBST
*)
fun insert(e,Empty,fp) = 
	Node(Empty, e, Empty)
	| insert(e,Node(x,y,z),fp) =
		if fp(e,y) then
			Node(insert(e,x,fp),y,z)
		else
			Node(x,y,insert(e,z,fp));

fun makeBST [] fp = Empty
	| makeBST L fp =
	foldr (fn (i,res)=> insert(i,res,fp)) Empty L;

(*
2.3
*)
fun searchBST Empty fp e = false
	| searchBST (Node(x,y,z)) fp e =
		if (e = y) then
			true
		else if fp(e,y) then
			searchBST x fp e
		else
			searchBST z fp e;


(* Sample data used for testing*)
val treeEmpty = Empty;
val tree2 = Node(Empty,2,Empty);
val tree123 = Node(Node(Empty,1,Empty),2,Node(Empty,3,Empty));
val tree12 = Node(Node(Empty,1,Empty),2,Empty);
val tree21 = Node(Empty, 2, Node(Empty,1,Empty));
val tree234 = Node(Empty, 2, Node(Empty, 3, Node(Empty, 4, Empty)));
val tree432 = Node(Node(Node(Empty,2,Empty),3,Empty),4,Empty);
val treeBig = Node(Node(Node(Empty,0,Empty),1,Node(Empty,4,Empty)),2,Node(Empty,3,Node(Empty,6,Empty)));
val treeBigC = Node(Node(Node(Empty,0,Empty),1,Node(Empty,3,Empty)),2,Node(Node(Empty,4,Empty),5,Node(Empty,6,Empty)));
val myBST = makeBST [1,2,3,4,5] (op <);
