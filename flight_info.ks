// This file is distributed under the terms of the MIT license

run lib_navball.

clearscreen.

print " +--------------------+".
print " | Compass =          |".
print " +--------------------+".
print " |   Pitch =          |".
print " +--------------------+".
print " |    Roll =          |".
print " +--------------------+".
print " ".
print " +--------------------+".
print " |Pressure =          |".
print " +--------------------+".
print " ".
print "You are in " + ship:name.
print "Action group 9 for menu".


set myVessel to ship.
set done to false.
on AG9 set done to true.

until done {
  print round(compass_for(ship), 1) + "     " at (13,1).
  print round(pitch_for(ship), 1)   + "     " at (13,3).
  print round(roll_for(ship), 1)    + "     " at (13,5).
  print round(ship:dynamicpressure * 1000 ,4) + "     " at (13,9).
  wait 0.
}.

run menu.
