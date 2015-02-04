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
@property (nonatomic, strong) NSArray* test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _test = [NSArray arrayWithObjects:@[@"1", @"2", @"3"], @[@"1"], @[@"7", @"6", @"5", @"4"], @[@"7", @"6", @"5", @"4"], nil];
    _mPickerView = [[WWDPickerView alloc] initPickerViewWithFrame:CGRectMake(0, 0, 320, 480) data:_test backgroundColor:[UIColor whiteColor] withShadow:YES];
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

- (void)wwdPickerViewDidSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSArray* rows = [_test objectAtIndex:component];
    NSLog(@"%@ - - %d", [rows objectAtIndex:row], component);
}

- (void)wwdPickerViewCancel {

}

- (void)wwdPickerViewConfirm {

}

@end
