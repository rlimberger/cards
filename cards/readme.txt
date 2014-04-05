Cards Shuffle Implementation Notes

This excersize was implemented as an object oriented model / controller design.
Since this is a command line application, there are no views implemented.

Model
The model is implemented as a base class that represents a "card" <RLCard>
and a "deck" that represents a stack of these cards. The model has basic functions
to allow for initialisation, modification and query of the stack and cards.

Controller
The controller is implemented in <RLDeckController> and exposes just one basic 
high level function that applies the algorithm to the deck.

Main
The main function of this command line application validates the input argument
and then initialises a controller. It then calls the function 
on the controller that computes the desired result by applying the algorithm. Once
the result is optained, the result is printed to the standard output and the 
program exits.



-----------------------------------------------------------------------------------

Cards Shuffle coding exersize description

Language: C++ or Objective-C with OOD in mind
Testing: take into consideration that we may want to run up to 50 test cases for this
Arguments: number of cards
Output: number of rounds

[GENERAL DESCRIPTION]

This module solves a coding problem that involves shuffling a deck of cards.  
The problem description is as follows:

You are given a deck containing n cards.  While holding the deck:

1. Take the top card off of the deck and create a new deck on the table, putting 
the cards on top of this new deck.
2. Take the next card off the top and put it on the bottom of the deck in your hand.
3. Continue steps 1 and 2 until all cards are on the table.  This is a round.
4. Pick up the deck from the table and repeat steps 1-3 until the deck is in the 
original order.

Write a program to determine how many rounds it will take to put a deck back into 
the original order.  This will involve creating a data structure to represent the 
order of the cards.  This program should be written in C, C++ or Objective-C, 
however C++ or Objective-C is preferred. Do not use STL. It should take a number 
of cards in the deck as a command line argument and write the result to stdout.

