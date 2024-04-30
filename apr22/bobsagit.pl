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
  quarter(spring2024),
).

course(
  csc310,
  days(tr),
  time(1000,1150),
  instructor(oneal,mike),
  room(iesb216),
  section(1),
  quarter(spring2024),
).

course(
  math308,
  days(tr),
  time(1600,1750),
  instructor(terry,jason),
  room(iesb210),
  section(051),
  quarter(spring2024),
).
