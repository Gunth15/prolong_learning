/*
 Comments within prolog files are slash star

 Lecture: Intro to Prolog
  swipl-opens terminal
  halt.-closes terminal

Programming in prolog consists of:
  - Declare FACTS
  -Define rules
  - Ask questions

we will write a small AI program so that we can sk it who are Ben Solo's grandparents
*/

/*Step 1: Declare facts*/
parent(anakin,luke).
parent(anakin,leia).
parent(padame,luke).
parent(padame,leia).
parent(leia,ben).
parent(han,ben).


/*Step 2: Define rules*/ 
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

/*Step 3: Ask questions..... done in compiler */

 /* INtro to Prolog Syntax and Words

 *every statement in prolog ends with period
 
* The command (predicate) to quit the prolog file into the interpreter are
 ['<filename>'].
 consult('<filename>').

 PROLOG TERMS/CLASSIFICATION OF WORDS
In prolog, Terms are the fundamental building blocks for constructing prolog programs. The types of prolog terms are
  
  NUMBERS

  CONSTANTS/ATOMS/LITERALS
  *Sequence of letters numbers, or underscores beginning with a lowercase letter. For ex. 
    anakin is a constant

  *Any sequence of characters surrounded by single quotes. For example, 'apr12.pl' is an 
  atom.

  *Sequence of special characters like =,_,etc. NOTE: note normally used by user.  
  
  We will ususally start literals with lowercase letters when we program.

  VARIABLES 
  *Sequence of letters, numbers, or underscore beginning with a capital letter.

  COMPOUND TERMS
  *A compound ter has the form
    <atom>(<sequence of prolog terms seperated by commas>)
    Ex. parent(anakin,luke) is a compund terms. For exampl, student(name,(winkelmann),id(12345),age(16),evil) is another compound term.

  Vocab: The atom of at the beginning if a compound term is called its functor. The number fo arguments/terms within the parenthesis of a functor is called its arrity. In normal text, we can refer to compond terms as <functo/<aritty>. Ex.
  the parent in our compund term in our code file can be referred to as parent/2

*reserved words in prolog: true, false, fail

 */
