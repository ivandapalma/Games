//
//  Game.m
//  Floating Pig
//
//  Created by Ivan Da Palma on 24/7/15.
//  Copyright (c) 2015 Ivan Da Palma. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

- (void)viewDidLoad {
    [super viewDidLoad];
    tunnelTop.hidden=YES;
    tunnelBottom.hidden=YES;
    top.hidden = YES;
    bottom.hidden = YES;
    btnExit.hidden = YES;
    score = 0;
    lbScore.hidden = YES;
    pig.hidden = YES;
    
    highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(IBAction)startGame:(id)sender{
    
    pig.hidden = NO;
    tunnelTop.hidden = NO;
    tunnelBottom.hidden = NO;
    top.hidden = NO;
    bottom.hidden = NO;
    btnStart.hidden = YES;
    btnExit.hidden = YES;
    score = 0;
    lbScore.hidden = NO;
    lbScore.text = @"0";
    
    pigMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(pigMovement) userInfo:nil repeats:YES];
    
    [self placeTunnels];
    
    tunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tunnelMoving) userInfo:nil repeats:YES];
    
}


-(void)pigMovement{
    
    pig.center = CGPointMake(pig.center.x, pig.center.y - pigFlight);
    pigFlight -= 5;
    
    if(pigFlight < -15){
        pigFlight = - 15;
    
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    pigFlight = 20;
    [pig setImage:[UIImage imageNamed:@"pig2"]];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [pig setImage:[UIImage imageNamed:@"pig"]];
}

-(void)tunnelMoving{
    
    //float speed = (float) _iAdrenalina;
    float speed = 1; // Modo adrenalina sería speed = 2
    tunnelTop.center = CGPointMake(tunnelTop.center.x - speed, tunnelTop.center.y);
    tunnelBottom.center = CGPointMake(tunnelBottom.center.x - speed, tunnelBottom.center.y);

    
    if(tunnelTop.center.x < -28){
        [self placeTunnels];
    }
    
    if(tunnelTop.center.x  == 30){
        [self score];
    }
    
    if(CGRectIntersectsRect(pig.frame, tunnelTop.frame)){ // Tunel arriba
        [self gameOver];
    }
    
    if(CGRectIntersectsRect(pig.frame, tunnelBottom.frame)){ // Tunel abajo
        [self gameOver];
    }
    
    if(CGRectIntersectsRect(pig.frame, top.frame)){ // Pared arriba
        [self gameOver];
    }
    
    if(CGRectIntersectsRect(pig.frame, bottom.frame)){
        [self gameOver];
    }
    
}

-(void)placeTunnels{
    
    randomTopTunnelPosition = arc4random() % 350; // Posicion de los tuneles aleatorias
    randomTopTunnelPosition -= 228;
    randomBottomTunnelPosition = randomTopTunnelPosition + 680;
    tunnelTop.center = CGPointMake(340,randomTopTunnelPosition);
    tunnelBottom.center = CGPointMake(340,randomBottomTunnelPosition);
    
}

-(void)score{
    
    score = score + 1;
    lbScore.text = [NSString stringWithFormat:@"%i",score];
    
}

-(void)gameOver{
    
    if(score > highScore){
        
        [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"highScore"];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡Genial!" message:@"Mejor Puntuación" delegate:nil cancelButtonTitle:@"Salir" otherButtonTitles:nil];
        [alert show];
    }
    
    [pigMovement invalidate];
    [tunnelMovement invalidate];
    tunnelTop.hidden=YES;
    tunnelBottom.hidden=YES;
    top.hidden = YES;
    bottom.hidden = YES;
    pig.hidden = YES;
    btnStart.hidden = NO;
    btnExit.hidden = NO;
    
    
}


@end
