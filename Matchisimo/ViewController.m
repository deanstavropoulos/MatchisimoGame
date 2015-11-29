//
//  ViewController.m
//  Matchisimo
//
//  Created by Kefi Labs on 11/27/15.
//  Copyright © 2015 Perkle Labs LLC. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *myDeck;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) NSString *theContent;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController

- (CardMatchingGame *)game
{
    if (!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self myDeck]];
    
    return _game;
}


- (IBAction)touchResetButton:(UIButton *)sender {

   _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self myDeck]];
    
    //if cards are flipped to front, flip them back
    
    self.scoreLabel.text= [NSString stringWithFormat:@"Score: 0"];
    
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    
    [self updateUI];
    /*UIImage *cardImage = [UIImage imageNamed:@"150px-Card_back-Pandaria.png"];*/
    /*
    if ([sender.currentTitle length])
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"blueBack.jpg"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        
    }
    else
    {
        Card *cardDrawn = [self.myDeck drawRandomCard];
        if (cardDrawn) {
            [sender setBackgroundImage:[UIImage imageNamed:@"imgres.png"]
                          forState: UIControlStateNormal];

            [sender setTitle:cardDrawn.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }*/
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
         cardButton.enabled = !card.isMatched;
        
    }
    self.scoreLabel.text= [NSString stringWithFormat:@"Score: %d", self.game.score];
}
         
-(NSString *) titleForCard:(Card *) card
{
    return card.isChosen ? card.contents: @"";
}
         
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"imgres.png" : @"blueBack.jpg"];
}

-(Deck *)myDeck
{
    if (!_myDeck)
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
