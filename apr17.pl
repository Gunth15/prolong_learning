/*
Lecture 2-1: Prolog Unification

*Unification is the primary action that is performed by prolog when executing code

*The prolog infix operator for unification is =

The following is a description of how unification process works.
    -Two atoms unify iff they are literally the same
    -Two numbers iff they are the same.
    -Two compound terms unify iff they have the same functer, arity, and their corresponding areguments unify(left -> right)
    -An unbound variable and a term that is not a variable always unify, and the variable is bounded (instantiated) to that term. The scope ends at the period. The variable is treated as the term it is bound to.
    -Two variables always unify and are bounded to each other.
    -any other combinatiopn of terms fail to unify.


*The prolog operator of and is the comma.

There are three possible results for unification:
  -If unification is successful and there are no variable instantiatiations, then the response from prolog is:
      true
  -If unification is successful there are variable instantiatiations, then ther is an implied true and the response is:
    <var1> = <val1>, <var2> = <val2>, <etc>

  -If the unification is not successful, the response is false
    false
*Rember that the statements that we type into the prolog interpreter evaluate to T or F

Lecture 2.2: Prolog Goals and Predicates
Next we will trace through our star wars example from the first day of class to learn how it "exucutes" programs.
  1.Declare facts
  2.Define rules
  3.Ask questions... which means after we load a program into the interpreter, we then type GOALS to see if goals succeed, i.e. if the goals unify with the code in the file.
*/ 
parent(anakin,luke).
parent(anakin,leia).
parent(padame,luke).
parent(padame,leia).
parent(leia,ben).
parent(han,ben).
/* grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
*/

/* Lets look at diffrent goals that we type into the interpreter and trace how prolog
 responds.

?- parent(anakin,luke).
  First it successfully unified with line 35 and the response was true. then ; tells prolog to redo and unify again, there are no mor matches in the rest of the code so the response is false


?- grandparent(A,ben).
 Unifies with line 41 (before the :-). The X is bound to A and Y is bound to ben. 

 ****Prolog will now try to unify the goals after the :- (prolog as if) from left to right.
 If the if the right side succededs, then the left will succeed.

  The right side of the rule effectively has
    parent(A,Z),parent(Z,ben)

  Line35 is the next match: parent (anakain,luke), parent(luke,ben)
  Now prolog tries to match parent(luke,ben) but fails.

  *** Now BACKTRACKING: Prolog will now try to go back to the last successful goal and unify again for more possible matches.
  
Line 36 is the next match: parent(anakin,leia),parent(leia,ben) and succeeds on line 39. Now SUCCESS ON THE RIGH TSAIDE OF :- !! Now prolog outputs any instaniated variables that we  asked for int the original goal we typed into the interpreter, which is 
   A=anakin
At the prompt, we type ; which forces a fail and backtrack.

Line 37 is the next match: parent(padame,luke), parent(luke,ben)
The tries the next match: parent(padme,luke),parent(luke,ben)
Then tries to unify parent(luke,ben). Failure, then back track.

Line 38 parent(leia,ben) succeeds. Output A = padame., at the prompt, we type a semicolon which forces a fail and backtrack

Line 39 parent(leia,ben), parent(ben,ben). fails. then backtrack.

Line 40 if the next match: parent(han,ben), parent(ben,ben).
Then parent(ben,ben fails). Then backtrack.

NO MORE MATCHES. AS FAR AS PROLOG KNOWS, THE RIGHT SIDE OF THE :- HAS FAILED

Ex. suppose that prolog has read the following  file/database into the interpreter.

*/ 
boy(alex).
boy(brandon).
girl(claire).
girl(denise).

couple(P,Q) :- boy(P), girl(Q).

/*
Predict the response to the prolog interpreter to the following goals.


?- boy(aaron).
false

?-boy(alex).
true

?-girl(G)
G = claire;
G = denise

?-couple(alex,G)
G = claire
G = denise

?-couple(B,G)
B=alex,G=claire
<all possible Bor Girl matches>

PREDICATES (analog to funtions in ML)
Predicates are expressions in prolog that evaluate to true or false, aka, succeed if fail.
This type of evluation is the best basis for driving prolog programs. First, Let's look at some built-in predicate, then writing our own.

Built-in PREDICATES

halt/0
  Exits the compiler/interpreter

consult/1 
  Loads a file/database into the interpreter

write/1
  The aregument is a prolog term and the predicate will write the term to the current output stream.
  Always succeeeds except on backtracking.

nl/0
  Writes a new line to the current output stream. Always succededs except on back-tracking.

Note:you can use write/1 and nl/0 to debug prolog code by displaying intermediate variable bindings during execution. you can also use them to pretty-up displays.

Ex. Rewrite the grandparent rule in star wars example so that it will print the intermediate parent bindings between the grandparent and grandchild execution

*/

grandparent(X,Y) :- parent(X,Z), parent(Z,Y), write(Y), write(' is a child of '), write(Z), write(' who is a child of '),nl.

/*
LET'S practice writing our own prolog rules to accomplish tasks, starting with the star wars ex. whe writing prolog rules, :- <these goals must be satisfied>

Ex. Add predicates isParent/1 that succeeds when its argument is the parent of anyone in the database. For example,
*/
isParent(A) :- parent(A,_).

/*
Note: The wildcard symbol in proplog is the iunderscore. A var that appears once will cause a "singleton" warning b/c its not being used

Ex.write a predicate named isSiblings/2 that succeeds when the areguments have atleast one parent in common.
*/
areSiblings(A,B) :- parent(X,A), parent(X,B).

/*
Ex. (Abstract) Suppose that the following predicates are alrredy defined properly
  male(X) %x is a mmale
  female(X) %x is female
  parent(X,Y) %is parent
  diff(X,Y) %diffrenrt people

use redicates to write the following rules. Note that sex matters and one cannot be a mother, and/or a father of one's self

1.mother(X,Y) that succeeds when X is the mother of you
  mother(X,Y) :- female(x), parent(X,Y).

2.ismother/1
  ismother(X) :- mother(X,_)

3. sisters/2 that succeeds when the areguments are sisters are sisters with atleast one parent
  sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), female(Y), diff(X,Y) 
*/
