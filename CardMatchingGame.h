//
//  CardMatchingGame.h
//  Matchisimo
//
//  Created by Kefi Labs on 11/27/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger) count usingDeck: (Deck *) deck;

//setter is not public for score
@property (nonatomic, readonly) NSInteger score;

-(void)chooseCardAtIndex:(NSUInteger)index forOption:(int)gameType;
-(Card *) cardAtIndex:(NSUInteger)index;

@end
