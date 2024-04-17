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
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).


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
  
Line 36 is the next match: parent(anakin,leia),parent(leia,ben) and succeeds on line 39. Now SUCCESS ON THE RIGH TSAIDE OF :- !! Now prolog outputs any instaniated variables that we  asked for int he original goal we typed into the interpreter, which is 
   A=ANAKIN
*/
