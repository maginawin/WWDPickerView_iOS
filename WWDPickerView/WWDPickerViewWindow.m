//
//  WWDPickerViewWindow.m
//  WWDPickerView
//
//  Created by maginawin on 15-2-3.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "WWDPickerViewWindow.h"

@interface WWDPickerViewWindow()

@property (nonatomic, strong) UIPickerView* wwdPickerView;
@property (nonatomic, strong) NSArray* test1;
@property (nonatomic, strong) NSArray* test2;

@end

@implementation WWDPickerViewWindow

+ (WWDPickerViewWindow*)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return sharedInstance;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.windowLevel = 1000.000000;
    _wwdPickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
    _wwdPickerView.delegate = self;
    _wwdPickerView.dataSource = self;
    _wwdPickerView.tintColor = [UIColor whiteColor];
    _test1 = @[@"1", @"2", @"3"];
    _test2 = @[@"4", @"5", @"6"];
    self.layer.backgroundColor = [UIColor blackColor].CGColor;
//    self.layer.opacity = 0.5;
    [self addSubview:_wwdPickerView];
}

- (void)show {

}

#pragma mark - Delegate, datasource

// Number of components
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// Number of rows
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _test1.count;
    } else if (component == 1) {
        return _test2.count;
    }
    return 0;
}

// Title
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [_test1 objectAtIndex:row];
    } else if (component == 1) {
        return [_test2 objectAtIndex:row];
    }
    return nil;
}

// Did select row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

// Width
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        
    } else if (component == 1) {
    
    }
    return 90;
}

// Height
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 60;
}

@end
