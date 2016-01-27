//
//  ViewController.h
//  myTimerObjC
//
//  Created by Abdul-Wasai Wasim on 1/27/16.
//  Copyright © 2016 Laylapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>{
    NSTimer *timer;
    int totalSeconds;
}

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *secondsPickerView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;


- (IBAction)startButton:(UIButton *)sender;
- (IBAction)pauseButton:(UIButton *)sender;

- (void)startTimer;
- (void)countDown:(NSTimer *)timr;
- (void)pushAlert;
- (void)popAlert;

@end

