//
//  ViewController.m
//  myTimerObjC
//
//  Created by Abdul-Wasai Wasim on 1/27/16.
//  Copyright © 2016 Laylapp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(UIButton *)sender {
    if ([[_startButton currentTitle]  isEqual: @"START"]) {
        totalSeconds = [_secondsPickerView selectedRowInComponent:0];
        [self startTimer];
        [_startButton setTitle:@"Cancel" forState:UIControlStateNormal];
    }else {
        [timer invalidate];
        [_timerLabel setText:@"00:00"];
        [_startButton setTitle:@"START" forState:UIControlStateNormal];
        
    }
}

- (IBAction)pauseButton:(UIButton *)sender {
    if ([[_pauseButton currentTitle]  isEqual: @"PAUSE"]) {
        [timer invalidate];
        [_pauseButton setTitle:@"Resume" forState:UIControlStateNormal];
    }else{
        [self startTimer];
        [_pauseButton setTitle:@"PAUSE" forState:UIControlStateNormal];
    }
    
}

- (void)startTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
}

- (void)countDown:(NSTimer *)timr{
    totalSeconds--;
    NSString *valueOfTimer = @"00:";
    _timerLabel.text = [NSString stringWithFormat:@"%@" "%02d", valueOfTimer, totalSeconds];
    
    if (totalSeconds <= 0) {
        [timer invalidate];
        [self pushAlert];
        [self popAlert];
        _timerLabel.text = @"OVER";
        [_startButton setTitle:@"START" forState:UIControlStateNormal];
        
    }
}

- (void)pushAlert{
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.alertTitle = @"Timer";
    notification.alertBody = @"Timers up homie";
    notification.alertAction = @"OKAY G";
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    
}

- (void)popAlert{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"TIMES UP" message:@"" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OKAY" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    [self presentViewController:alertController animated:true completion:nil];
}


//MARK: - PICKERVIEWDELEGATE & DATATSOURCE

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView != _secondsPickerView) {
        return 1;
    }
    return 61;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {

    UILabel *myLabel = [[UILabel alloc]init];
    [myLabel setBackgroundColor:[UIColor whiteColor]];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 61; i++) {
        [array addObject:[NSNumber numberWithInt:i]];
    }
    NSString *labelText = [NSString stringWithFormat:@"%@", array[row]];
    [myLabel setText:labelText];
    return myLabel;
}







@end
