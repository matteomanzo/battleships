Battleships
===========
This project is the second pair programming project of the course, where, starting from scratch, we
have to implement a program to re-create the popular table game Battleships.

Pairing Programming Couple
--------------------------
- [Emily Sas](https://github.com/emilysas)
- [Matteo Manzo](https://github.com/matteomanzo)

Class Responsibility Collaborator
---------------------------------
Keeping in mind the S.O.L.I.D. principles we designed the CRC as:

#Ship

Responsabilities  |  Collaborators
------------------|----------------
  Floating        |	    Board
  Being hit       | Player - Board
  Sink            | Player - Board
-----------------------------------

#Board

Responsabilities      |  Collaborators
----------------------|----------------
  Contain cells       |	      -
  Contain ships       |      Ship
  Change cells status |     Player
---------------------------------------

#Player

Responsabilities   |  Collaborators
-------------------|----------------
  Hit the ship     |  Ship - Board
  Record his shots |     Board
-----------------------------------

#Game

Responsabilities  |  Collaborators
------------------|----------------
  Contain players |	    Player
  Contain ships   |      Ship
  Contain boards  |     Board
-----------------------------------

As shown in the CRC above, we didn't include the Cell class.
I would say we didn't do it for a particular reason, we decided to
implement our program in this way to understand the pros and cons,
and to see if the game could still work.

How to run it
-------------
At the moment we are still working on the graphical interface and
refactoring the code. We will complete it as soon as possible.