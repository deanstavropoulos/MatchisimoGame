//
//  Card.h
//  Matchismo
//
//  Created by Kefi Labs on 11/27/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;
@property (nonatomic,getter= isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

-(int)match:(NSArray *) otherCards;

@end