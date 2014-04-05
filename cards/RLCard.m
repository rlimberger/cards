//
//  RLCard.m
//  cards
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import "RLCard.h"

@implementation RLCard

- (id)init
{
    if((self = [super init])) {
        self.next = nil;
    }
    
    return self;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"Card.next:%p", self.next];
}

@end
