//
//  Card.m
//  Matchismo
//
//  Created by Kefi Labs on 11/27/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import "Card.h"

@implementation Card


-(int)match:(NSArray *) otherCards;
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    return score;
}

@end
