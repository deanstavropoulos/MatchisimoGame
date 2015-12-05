//
//  PlayingCard.m
//  Matchismo
//
//  Created by Kefi Labs on 11/27/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *) otherCards
{
    int score = 0;
    
    if ([otherCards count] ==1)
    {
        //firstObject returns firstObject in an array
        id card = [otherCards firstObject];
        
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) card;
        
            if ([self.suit isEqualToString:otherCard.suit])
                {
                    score = 1;
                }
            else if (self.rank == otherCard.rank)
            {
                score = 4;
            }
        }
    }
    if ([otherCards count] ==2)
    {
        //firstObject returns firstObject in an array
        id card = [otherCards firstObject];
        id card2 = [otherCards lastObject];
        
        if ([card isKindOfClass:[PlayingCard class]] && [card2 isKindOfClass:[PlayingCard class]] )
        {
            PlayingCard *firstCard = (PlayingCard *) card;
            PlayingCard *secondCard = (PlayingCard *) card2;
            
            if ([self.suit isEqualToString:firstCard.suit] && [self.suit isEqualToString:firstCard.suit] )
            {
                score = 3;
            }
            else if ([self.suit isEqualToString:firstCard.suit])
            {
                
                if (self.rank == secondCard.rank)
                {
                    score = 4;
                }
                else if (firstCard.rank == secondCard.rank)
                {
                    score = 4;
                }
                else
                {
                    score = 1;
                }
                
            }
            else if ([self.suit isEqualToString:secondCard.suit])
            {
                if (self.rank == firstCard.rank)
                {
                    score = 4;
                }
                else if (firstCard.rank == secondCard.rank)
                {
                    score = 4;
                }
                else
                {
                    score = 1;
                }
            }
            else if ([secondCard.suit isEqualToString:firstCard.suit])
            {
                if (self.rank == firstCard.rank)
                {
                    score = 4;
                }
                else if (self.rank == secondCard.rank)
                {
                    score = 4;
                }
                else
                {
                    score = 1;
                }
            }
            else if (self.rank == firstCard.rank && self.rank == secondCard.rank )
            {
                score = 9;
            }
            else if (self.rank == firstCard.rank)
            {
                score = 3;
            }
            else if (self.rank == secondCard.rank)
            {
                score = 3;
            }
            else if (firstCard.rank == secondCard.rank)
            {
                score = 3;
            }

        }
    }
    return score;
}

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; //because we provide setter and getter

+(NSArray *)validSuits
{
    return @[@"♣︎",@"♠︎",@"♥︎",@"♦︎"];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank { return [[self rankStrings] count]-1;}


-(void)setRank:(NSUInteger)rank
{
    if (rank<= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

@end
