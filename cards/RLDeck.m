//
//  RLDeck.m
//  cards
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import "RLDeck.h"
#import "RLCard.h"

@interface RLDeck ()
{
    NSMutableArray* cards;
}

@end

@implementation RLDeck

- (id)initWithSize:(NSInteger)numCards build:(BOOL)build
{
    if((self = [super init])) {
        cards = [NSMutableArray arrayWithCapacity:numCards];
        
        if(build)
            [self buildDeckWithSize:numCards];
    }
    
    return self;
}

- (void)buildDeckWithSize:(NSInteger)numCards
{
    // Add cards to the deck.
    for(NSInteger i = 0; i < numCards; i++)
        [cards addObject:[RLCard new]];
    
    // Link cards to establish original order, making it
    // essentially a singly linked list.
    for(NSInteger i = 0; i < numCards-1; i++)
        [cards[i] setNext:cards[i+1]];
}

- (RLCard*)popTop
{
    RLCard* card = cards.firstObject;
    [cards removeObject:card];
    return card;
}

- (void)pushTop:(RLCard*)card
{
    [cards insertObject:card atIndex:0];
}

- (void)pushBottom:(RLCard*)card
{
    [cards addObject:card];
}

- (NSInteger)count
{
    return cards.count;
}

- (RLCard*)cardAtIndex:(NSInteger)index
{
    // check bounds
    if(index >= cards.count)
        return nil;
    
    return cards[index];
}

- (NSString*)description
{
    NSString* str = @"Deck:\n";
    
    for(RLCard* card in cards)
        str = [str stringByAppendingFormat:@"index:%lu %@\n", (unsigned long)[cards indexOfObject:card], card];
    
    return str;
}

@end
