//
//  PlayingCard.h
//  Matchismo
//
//  Created by Kefi Labs on 11/24/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank; //no pointer because of primitive type

+ (NSArray *)validSuits;
+(NSUInteger) maxRank;

@end
