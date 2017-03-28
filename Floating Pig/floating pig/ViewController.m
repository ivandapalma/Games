//
//  ViewController.m
//  Floating Pig
//
//  Created by Ivan Da Palma on 24/7/15.
//  Copyright (c) 2015 Ivan Da Palma. All rights reserved.
//

#import "ViewController.h"
//#import "Game.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    intHighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
    lbHighScore.text = [NSString stringWithFormat:@"Puntuación más alta: %i",intHighScore];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if(swModoAdrenalina.on){
        intAdrenalina = 1;
    }
    else{
        intAdrenalina = 2;
    }
        
    Game *vcGame = [segue destinationViewController];
    vcGame.iAdrenalina = intAdrenalina;
    
}
*/

@end
