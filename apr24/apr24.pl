/*
Continue Section 2.3

When you wnat to do arithmetic/math in prolog, you need a special predicate to execute it
(so tht it knows you're not talking about atoms)

NAME: is
Type:infix
SYNTAX <TERM> is <arithmetic Expresion>
  The arithmetic expression is evaluated and unfied wth the <TERM>


  BUILT-IN OPERATORS FOR LOGIC
    
    ,   and
    not not
    ;   or 

  NOTE: When using prolog rules, we dont sually use ; because we can just write an additional rule on another line.
  
  Ex. If the following rules are already defined
    mother(X,Y).
    father(X,Y).

  And we want to write an isParent/2 parediacet, two opions are:
    isParent(X,Y) :- mother(X,Y).
    isParent(X,Y) :- father(X,Y). % This is preferred

  Let's now use all these operators we just learned to write more complicated prolog tasks

  Ex. Suppose that prolog has read the following database
*/
inOffice(biden,2021,2024).
inOffice(trump,2017,2020).
inOffice(obama,2009,2016).
inOffice(bush43,2001,2008).
inOffice(clinton,1993,2000).
inOffice(bush41,1989,1992).

prez(X,Y) :- inOffice(X,A,B), Y>=A, Y=<B.

/*
predict the output to the following prolog goals

inOffice(obama)
inOffice(obama,2016,2020)
inOffice(obama,M,N).
prez(obama,2010).
prez(P,2010).


Predicates WITH "OUTPUT"
In prolog when you want to write a "function" with "output", it is custom to write a predicate with an additional argument that is unified with the output you seek

Ex. Write a prolog predicate named myfun/2, where the first argument  is a number  X and the second argument is unified with 3X+1, Example,
  ?-myfun(7,R).
  R = 22
Rev: In ML, the code is
  fun myfun x = 3*x+1
*/
myfun(X,R) :- R is 3*X+1.

/*
Ex. Write a predicate named isEven/1 that succeeds when its argument is an even integer.
For example.
  ?- isEven(4).
  true
*/
isEven(N) :- 0 is rem(N,2).
/*
For error checking on integers, there is a built-in predicate named integer/1 that succeeds when its argument is an integer term.

*/
isEven2(N) :- integer(N), 0 is rem(N,2).

/*
BUILT-IN PREDICATES FOR ATOMS
NAME: char_code/2
SYNTAX: char_code(C,N)
  C is a single character atom , N is an integer. This succeeds when C corresponds to the integer value N

Ex. (in-class) Write a predicate named toUpper/2, where the first argument is a chracter (atom of length 1) and the second argument is matched with its uppercase version. Foor example,
  ?- toUpper(d,R).
  R = 'D'

REV: in ML, the code to do this example was
fun toUpper c = chr(ord(c)-32)
*/
toUpper(C,U) :- char_code(C,N), R is N-32, char_code(U,R).  


/*
Write a predicate named distance where the forst two arguments are coordinates, and the third arg is matched with the distance between them. For example,
  ?- distance((1,-2),(4,2),R).
  R = 5.0
*/
distance((X1,Y1),(X2,Y2),R) :- X is X2-X1, Y is Y2-Y1, DX is X^2, DY is Y^2, Z is DX+DY, R is sqrt(Z).

/*
Ex. write a predicate named past/2, where the first argument is an atom, an the second Argument is unified with the atom with 'ed' concatedneted on the end. For example,
  ?- past(lock,R).
  R = locked
*/
past(W,P) :- yf(W,) 
