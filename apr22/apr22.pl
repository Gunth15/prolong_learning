/*
  Continue Section 2-2

  Next, we can write some simple database functions/predicates just by exploiting prologs unification process.

  Ex. (BOSS) suppose that prolog has read a file/database with the class and faculty info LATECH. The following is a sample of the entries in the database
*/
course(
  csc330,
  days(mwf),
  time(930,1045),
  instructor(terry,jason),
  room(iesb205),
  section(1),
  quarter(spring2024)
).

course(
  csc310,
  days(tr),
  time(1000,1150),
  instructor(oneal,mike),
  room(iesb216),
  section(1),
  quarter(spring2024)
).

course(
  math308,
  days(tr),
  time(1600,1750),
  instructor(terry,jason),
  room(iesb210),
  section(051),
  quarter(spring2024)
).

/*
write prolog rules for the following tasks
1. getRoomBYClass/2, where the first arg is a class and the second arg is matched with the room the class is located in. For example,
  ?- getRoomBYClass(csc330,A)
  A= iesb205
*/

getRoomBYClass(C,R) :- course(
C,
_,
_,
_,
room(R),
_,
_
). 


/*
Lecture 2-3: Prolog Operators and Arithmetic

NEW BUILT-IN predicates

Name: op/3 
SYNTAX: op(<precedence>,<types>,<Name>)
  used to define custom Operators. In the PL file, begin with ?-

  precedence: Integer value that defines the  priority of the operator. The lower number, the higher the priority.
  Type: An atom that describes the operator. Some choices are:
    yfx: infix, left associative
    fy:unary prefix, associative 
    yf: unary,postfix, associative
  
  Name: An atom for the name of the operator your defining.
*/
likes(jace,cs).

?- op(150,yfx,likes).

likes(jase,cs). 

/*
 Now that you've seen how to deifine your Operators, we can officially learn about built-in Operators

 BUILT-IN OPERATORS FOR TERMS

 Name: =
 Type: infix
 SYNTAX: <TERM1> = <TERM2>
  unifies the given terms.

 Name: ==
 Type: infix
 SYNTAX: <TERM1> == <TERM2>
   Succeeeds when the terms are literally equal 

 Name: \= 
 Type: infix
 SYNTAX: <TERM1> \= <TERM2>
   Succeeeds when the terms do not unify
  



  BUILT-IN OPERATORS FOR NUMBERS

  Let's first list the comparison Operators
    < less than 
    > greater than
    >= greater or equal
    =< less than or equal 
    =:= is arithmetically equal
    =\= is not arithmetically equal

    NOTE: operations are predicates!

    Next list list the common math operators
      + plus
      - minus
      * multiply
      / division
      // integer
      ^ exponenentiation
      ** exponenentiation
      abs/1 absolute values
      max/2 returns th emax of two numbers 
      min.2 returns min of two numbers 
      sqrt/1 square root of a number
      cos/1 cosine
      sin/1 sine
      pi values of pi
      rem/2 remainder
    NOTE: These are NOT prediacates !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
*/

