//
//  main.m
//  cards
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLDeckController.h"

void usage();

int main(int argc, const char* argv[])
{
    @autoreleasepool {

        // Check that we got the argument we need.
        if(argc != 2) {
            usage();
            return -1;
        }
        
        // Get the argument.
        NSInteger numCards = atoi(argv[1]);
        
        // Instanciate a controller to apply the algorithm.
        RLDeckController* deckController = [RLDeckController new];
        
        // Let user know we are about to do work.
        printf("\nCalculating number of rounds...\n");
        
        // Mark time right before the start of the computation.
        NSDate* start = [NSDate date];
        
        // Apply the algorithm.
        NSInteger numRounds = [deckController roundsForDeckWithSize:numCards];
        
        // Calculate how long the algorithm took. Unit is in milliseconds.
        NSTimeInterval timeDelta = [[NSDate date] timeIntervalSinceDate:start]*1000.0f;
        
        // Print the result to standard output (console).
        printf("\nA deck of %ld cards takes %ld rounds [%.2fms] to be back in order.\n\n",
              (long)numCards, (long)numRounds, timeDelta);
    }
    
    return 0;
}

void usage()
{
    // print expected input argument pattern
    printf("\nCards computes the number of rounds needed to shuffle <n> cards \n");
    printf("back into the original order.\n\n");
    printf("usage: cards n\n");
    printf("example: compute 10\n\n");
}


