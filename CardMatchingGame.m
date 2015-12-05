//
//  CardMatchingGame.m
//  Matchisimo
//
//  Created by Kefi Labs on 11/27/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame() //private interface
@property (nonatomic, readwrite) NSInteger score; //readwrite because of the readonly
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i<count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (card)
            {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

//pass in the card index chosen
-(void)chooseCardAtIndex:(NSUInteger)index forOption:(int)gameType
{
    Card *card = [self cardAtIndex:index]; //instantiate the card to be the one chosen
    
    if (!card.isMatched) //if the card hasn't been matched
    {
        if (card.isChosen) //if the same card been chosen, flip it back
        {
            card.chosen = NO;
        }
        else if (gameType == 0)
        {
            //if there cards in the cards array
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchScore = [card match:@[otherCard]]; //create array on fly
                    if (matchScore)
                    {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }
                    else
                    {
                        otherCard.chosen = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
        else if (gameType == 1)//if we are playing the 3-card game
        {
            int count = 0;
            NSMutableArray *cardsToTest = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) //go through the 12 cards
            {
                
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    [cardsToTest addObject:otherCard];
                    count++;
                    
                }
                if (count == 2)
                {
                    int matchScore = [card match:cardsToTest]; //create array on fly
                    if (matchScore)
                    {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        
                        for (Card *theCards in cardsToTest )
                            theCards.matched = YES;
                    }
                    else
                    {
                        for (Card *theCards in cardsToTest )
                            theCards.chosen = NO;
                        //card.chosen = NO;
                        
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }
    }
}

-(instancetype)init
{
    return nil;
}

@end
