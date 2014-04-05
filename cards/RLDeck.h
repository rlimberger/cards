//
//  RLDeck.h
//  cards
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLCard.h"

/*!
 @class RLDeck
 @discussion This class implements the model of a deck of cards.
 To match the convention of the coding exersize spec, we assume this deck to
 be a <vertical> stack of cards. The top is the beginning (0) of the array/list
 and the bottom is the end (n).
 */

@interface RLDeck : NSObject

/*!
 Initializes the deck of cards.
 
 @param numCards
 Number of cards expected in the deck.
 
 @param build
 Optionally fill the deck of cards with cards.
 */

- (id)initWithSize:(NSInteger)numCards build:(BOOL)build;

/*!
 Remove the top card off the deck.
 
 @result
 Top card that has been removed from the deck.
 */

- (RLCard*)popTop;

/*!
 Add a card to the top of the deck.
 
 @param card
 The card to be added.
 */

- (void)pushTop:(RLCard*)card;

/*!
 Add a card to the bottom of the deck.
 
 @param card
 The card to be added.
 */

- (void)pushBottom:(RLCard*)card;

/*!
 Query the number of cards in the deck.
 
 @result
 Number of cards in the deck.
 */

- (NSInteger)count;

/*!
 Retrieve the card at a certain index within the deck.
 
 @param card
 The index of the card to be retrieved.
 
 @result
 The card at the specified index. Will return nil if index is out of bounds.
 */

- (RLCard*)cardAtIndex:(NSInteger)index;

@end
