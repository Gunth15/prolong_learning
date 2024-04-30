/*
Continue Lecture 2-5

Ex.write mutually recursive predicates named isEven/1 and isOdd/1 where the argument is a non-negative integer and will succeed when the input is even/odd appropriately. For example,
  ?- isEven(4).
  true
  ?-isOdd(4).
  false
*/
%Recursive cases
isEven(N) :- N>0, N1 is N-1, isOdd(N1). 
isOdd(N) :- N>0, N1 is N-1, iseven(N1).
% Base cases
isEven(0). %And base case for isOdd is no code!

/*
Ex. write our own length predicate named mylength/2
*/

% Recursive case
mylength([_|T],R) :- mylength(T,R1), R is R1+1.
% Base case
mylength([],0).

/*
Ex. wrote write a recursive prolog predicate namesd listsum/2 where the first argument is a list of numbers abd the second argument withtheir sum. For example
  ?- listsum([2,3,5,7],R).
  R = 17
*/
%recursive
listsum([H|T],R) :- listsum(T,R1), R is H+R1.

%base case
listsum([],0).

/*
ex. wrote a recursive prolog predicate named sortedMerge/3 where the first two arguments are sorted list of numbers, and the third argument is amtched with their combine sorted list.
The ML ver. was: 
  fun sortedMerge(A,[]) = A 
  |sortedMerge([],B) = B 
  |sortedMerge(A as x::xs, B as y::ys) = 
    if x<y x::sortedMerge(xs,B) else y::sortedMerge(A,ys);
*/

%recursive case
sortedMerge([H1|T1],[H2|T2],R) :- H1<H2, sortedMerge(T1,[H2|T2],R1) , R = [H1|R1].
sortedMerge([H1|T1],[H2|T2],[H2|R1]) :- H2>=H1, sortedMerge([H1|T1],T2,R1). %This is the more simplified version

%base case
sortedMerge([],L,L).
sortedMerge(L,[],L).


/*
Ex. Write your own member predicate named mymember/2, where the first argument is an elemnt and the second argument is a list. It succeeds when the element is a member of the list. For example,
  ?- mymember(5,[2,3,4,5]).
  true
  ?- mymember(9,[2,3,4,5]).
  false
*/
%recursive
mymember(X,[H|T]) :- X \= H, mymember(X,T).
%base
mymember(X,[X|_]).


/*
Ex. (in-class) write your own append predicate named myappend/3 , where the first two arguments are lists, nd the third argument is matched with their concatenatin, For example,
 ?- myappend([a,b],[c,d,e],R).
 R = [a,b,c,d,e]

Ex. (in-class) Write your own reverse predicate name myrev/2, where the first argument is a list, and the second argument is matched with its reversal. you may use append or my ppend, for example.
*/

%Recursive
myappend([H1|T1],L, R) :- myappend(T1,L,R1), R = [H1|R1]. 

%Base case
myappend([],L, L).
myappend(L,[], L).


%Recursive case
myrev([H|T],R) :- myappend(T,[H],R1) , myrev(T,R1), R1 = R.
%Base case
myrev([],_).
