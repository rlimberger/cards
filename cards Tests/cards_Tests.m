//
//  cards_Tests.m
//  cards Tests
//
//  Created by rl on 4/4/14.
//  Copyright (c) 2014 Rene Limberger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RLDeckController.h"

@interface cards_Tests : XCTestCase

@end

@implementation cards_Tests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testRoundsForDeckWithSize
{
    // Instanciate a controller to apply the algorithm.
    RLDeckController* deckController = [RLDeckController new];
    
    // Some test data to test corner cases and some primes, which seem to have
    // rather large results.
    //
    // TODO: This test could easily be extended with larger number of test cases
    // read from a file, for example.
    NSDictionary* testData = @{@(-1) : @(0),
                               @(0)  : @(0),
                               @(1)  : @(1),
                               @(2)  : @(2),
                               @(4)  : @(2),
                               @(37) : @(110),
                               @(97) : @(6435)};
    
    [testData enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop) {
        NSNumber* numCards = key;
        NSNumber* expectedResult = obj;
        
        // Run the algorithm for this test case and compare it to the expected result.
        BOOL result = ([deckController roundsForDeckWithSize:numCards.integerValue] == expectedResult.integerValue);
        
        // Fail verbosely if we didn't get the expected result.
        XCTAssert(result, @"Failed with %ld cards.", (long)numCards.integerValue);
    }];
}


@end
