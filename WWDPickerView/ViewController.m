//
//  ViewController.m
//  WWDPickerView
//
//  Created by maginawin on 15-2-3.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) WWDPickerView* mPickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* test = [NSArray arrayWithObjects:@[@"1", @"2", @"3"], @[@"1"], @[@"7", @"6", @"5", @"4"], @[@"7", @"6", @"5", @"4"], nil];
    _mPickerView = [[WWDPickerView alloc] initPickerViewWithFrame:CGRectMake(0, 0, 320, 480) data:test backgroundColor:[UIColor whiteColor] withShadow:YES];
    _mPickerView.tag = 1;
    _mPickerView.delegate = self;
    [self.view addSubview:_mPickerView];
    
}

- (void)viewDidAppear:(BOOL)animated {

}

- (IBAction)show:(id)sender {
    [UIView animateWithDuration:1.0 animations:^ {
        _mPickerView.hidden = NO;
    } completion:^ (BOOL finished) {
        _mPickerView.hidden = NO;
    }];
}

- (IBAction)hide:(id)sender {
    _mPickerView.hidden = YES;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"test pick delegate, %d", pickerView.tag);
}

- (void)cancelClick {
    _mPickerView.hidden = YES;
}

- (void)confirmClick {
    _mPickerView.hidden = YES;
}

@end
