//
//  RLDeckManager.m
//  cards
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import "RLDeckController.h"
#import "RLDeck.h"
#import "RLCard.h"

@implementation RLDeckController

- (NSInteger)roundsForDeckWithSize:(NSInteger)numCards
{
    // If there are no cards, there is no round to do.
    if(numCards < 1)
        return 0;
    
    // If there is only one card, you could argue that
    // there should be one round, of transfering that
    // single card from hand to table and back.
    //
    // TODO: Verify that we understand the algorithm
    // correctly for this corner case.
    if(numCards == 1)
        return 1;
    
    // Create and build hand deck.
    RLDeck* deck = [[RLDeck alloc] initWithSize:numCards build:YES];
    
    // Apply round algorithm until the original order is restored.
    NSInteger numRounds = 0;
    while(true) {
        @autoreleasepool {
            
            [self applyRoundAlgorithm:&deck];
            numRounds++;
            
            if([self deckIsInOrder:deck])
                break;
        }
    }
    
    return numRounds;
}

- (void)applyRoundAlgorithm:(RLDeck**)deck
{
    // Get local pointer for code readability.
    RLDeck* handDeck = *deck;
    
    // Create an empty table deck.
    RLDeck* tableDeck = [[RLDeck alloc] initWithSize:handDeck.count build:NO];
    
    while(true) {
        
        // Move the top card of hand deck to the top of the table deck.
        [tableDeck pushTop:[handDeck popTop]];
        
        // Are there any cards left in hand deck?
        if(!handDeck.count) {
            // We are done with this round.
            break;
        }
        
        // Get new top card from the hand deck.
        RLCard* card = [handDeck popTop];
        
        if(handDeck.count) {
            // This is not the last card in the hand deck,
            // move the top card to the bottom of the hand deck.
            [handDeck pushBottom:card];
        }
        else {
            // This is the last card in the hand deck,
            // move it to top of the table deck.
            [tableDeck pushTop:card];
            
            // We are done with this round.
            break;
        }
    }
    
    // The original hand deck is emty now and we no longer need it
    // continue with the table deck. This avoids another copy.
    *deck = tableDeck;
}

- (BOOL)deckIsInOrder:(RLDeck*)deck
{
    // To check if the deck is back to original order,
    // we iterate over the singly linked list and check
    // it's integrity.
    for(NSInteger i = 0; i < deck.count-1; i++) {
        RLCard* card = [deck cardAtIndex:i];
        RLCard* nextCard = [deck cardAtIndex:i+1];
        if(card.next != nextCard) {
            // inconsistent linked list,
            // deck is not in order
            return NO;
        }
    }

    // Deck is in order if we made it here
    return YES;
}

@end
