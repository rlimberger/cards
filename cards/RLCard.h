//
//  RLCard.h
//  cards
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class RLDeck
 @discussion This class implements the base card class of the model. It effectively
 implements a singly linked list due to it's next property.
 */

@interface RLCard : NSObject

/*! 
 @property next
 Holds a pointer to the next card in the deck.
 
 @discussion This property allows us to define an initial order of the deck and
 check it during the application of the algorithm. The reference is weak because
 in context of this model, each card is already referenced by the deck is is part 
 of (NSArray). This property is just used for comparing the order of the list.
 */

@property (readwrite, weak) RLCard* next;

@end
