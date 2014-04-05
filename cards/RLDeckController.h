//
//  RLDeckManager.h
//  cards
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class RLDeckController
 @discussion This class implements a controller to interact with a deck of cards.
 */

@interface RLDeckController : NSObject

/*!
 Applies the coding exercise algorithm impemented in this controller to a deck 
 of cards of a given size.
 
 @param numCards
 Number of cards in the deck.

 @result
 Number of rounds reqired to until the deck is back in original order.
 */

- (NSInteger)roundsForDeckWithSize:(NSInteger)numCards;

@end
