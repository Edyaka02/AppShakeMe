//
//  ViewController.m
//  AppShakeMe
//
//  Created by Guest User on 25/11/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timerInt = 10;
    scoreInt = 0;
    gameMode = 0;
    imageInt = 1;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%i", timerInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}

- (IBAction)startGame:(id)sender {
    if( timerInt == 10){
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        gameMode = 1;
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
    }
    
    if( timerInt == 0){
        timerInt = 10;
        scoreInt = 0;
        imageInt = 1;
        self.timerLabel.text = [NSString stringWithFormat:@"%i", timerInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        self.imageView.image = [UIImage imageNamed:@"Face1"];
        [self.startButton setTitle:@"Start Game" forState:UIControlStateNormal];
        //self.startButton.titleLabel.font = [UIFont fontWithName:@"Futura" size:35.0];
    }
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if( event.subtype == UIEventSubtypeMotionShake ){
        if( gameMode == 1 ){
            scoreInt += 1;
            self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
            imageInt += 1;
            
            if ( imageInt > 12 ) {
                imageInt = 1;
            }
            
            self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Face%i", imageInt]];
        }
    }
}

-(void)updateTimer{
    timerInt -= 1;
    self.timerLabel.text = [NSString stringWithFormat:@"%i", timerInt];
    
    if( timerInt == 0){
        [timer invalidate];
        gameMode = 0;
        self.startButton.enabled = YES;
        self.startButton.alpha = 1.0;
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
    }
}
@end
