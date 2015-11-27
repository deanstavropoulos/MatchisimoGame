//
//  ViewController.m
//  Matchisimo
//
//  Created by Kefi Labs on 11/27/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Card.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *myDeck;
@property (strong, nonatomic) NSString *theContent;
@end

@implementation ViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    /*UIImage *cardImage = [UIImage imageNamed:@"150px-Card_back-Pandaria.png"];*/
    Card *cardDrawn = nil;
    
    if ([sender.currentTitle length])
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"blueBack.jpg"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"imgres.png"]
                          forState: UIControlStateNormal];
        
        if (_myDeck && [_myDeck drawRandomCard]!=nil)
        {
            //draw a random card from myDeck and set it to variable
            cardDrawn = [_myDeck drawRandomCard];
            
            
        }
        else
        {
            [self myDeck];
            cardDrawn = [_myDeck drawRandomCard];
        }
        
        _theContent = [cardDrawn contents];
        //print the string of that variable
        [sender setTitle:_theContent forState:UIControlStateNormal];
    }
    
    self.flipCount++;
}

-(Deck *)myDeck
{
    _myDeck = [[ PlayingCardDeck alloc ] init];
    return _myDeck;
}


-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    
    NSLog(@"flipCount = %d", self.flipCount);
}


/*- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}*/

@end
