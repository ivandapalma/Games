//
//  Game.h
//  Floating Pig
//
//  Created by Ivan Da Palma on 24/7/15.
//  Copyright (c) 2015 Ivan Da Palma. All rights reserved.
//

#import <UIKit/UIKit.h>

int pigFlight;
int randomTopTunnelPosition;
int randomBottomTunnelPosition;
int score;
NSInteger highScore;

@interface Game : UIViewController{
    
    IBOutlet UILabel *lbScore;
    IBOutlet UIButton *btnStart;
    IBOutlet UIButton *btnExit;
    IBOutlet UIImageView *pig;
    NSTimer *pigMovement;
    NSTimer *tunnelMovement;
    IBOutlet UIImageView *tunnelTop;
    IBOutlet UIImageView *tunnelBottom;
    IBOutlet UIImageView *top;
    IBOutlet UIImageView *bottom;
}


//@property NSInteger iAdrenalina;
-(IBAction)startGame:(id)sender;
-(void)pigMovement;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)tunnelMoving;
-(void)placeTunnels;
-(void)score;
-(void)gameOver;

@end
