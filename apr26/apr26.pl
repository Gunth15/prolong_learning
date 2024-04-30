/*
Lecture 2-4: Prolog Data Structure/Lists

There are two main methods to construct lists in Prolog
  *Put prolog terms within brackets seperated by commas
    [jason,jace,likes(cam,cs)]
    
  *use the cons operator for a term or lists of terms
    [H|T]

*NOTE: Like in ML, the end of a lists has an empty lists

BUILT-IN predicates fr lists 

length/2
  first argument is a list, and the second argument is unified with its length

reverse/2
  first argument is a lists, an the second argument is unified with the reversal of the list 

append/3
  first two arguments are list and the third argument is unified with their concatenation

last/2
  First argument is a list, and the second argument is unified with its last element

select/3
  First argument is an element of a list, second argument is a lists and the third argument is unified with the list after the element has been removed one at a time (with blocking)

member/2
  First argument is one element of a list and second argument is a list. succeeds when elemnt is in list.

Rev. in ML, the map function looked like 
  map f [2,3,5,7]

maplist/3
  The first argument represents a function the second argument is a list, and the third argument is unified with the list after the list after the function has been applied to each element

*/
f(V,Y) :- Y is V*V.

/*
Rev. In ML, the reduce function foldl and foldfr looked like
  foldl g 0 [2,3,5,7]
where g was a two-variable funtion 

foldl/4
  The first argument represents the accumulation function, the second argument is a lists, the third argument is the initial value, and the forth argument is the intitial value, and the forth argument is unified with the result
*/
g(CV,ACC,R) :- R is CV+ACC.

/*
Lecture 2-5: Prolog Recursion

Rev. the recursive factorial function in ML caqn be written
  
  fun fact 0 = 1
    | fact n = n*fact(n-1)

Ex.wrote  a recursive prolog predicate named fact/2 , where thew first argument is a non-negative integer and the second argument is unified with the factorial value. For example,
  ?- fact(0,A)
  A = n-1
  ?- fact(4,R)
  R = 24
*/
% Base case
fact(0,1).

% recursive case
fact(N,R) :- N>0, N1 is N-1, fact(N1,T), R is N*T.

/*
NOTE: We customarily place the recursive case before the base to help prevent unnecessary
backtracking.
*/
