//
//  WWDPickerView.m
//  WWDPickerView
//
//  Created by maginawin on 15-2-3.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "WWDPickerView.h"

#define INTERVAL_LEFT_RIHGT 20.0

@interface WWDPickerView()

@property (nonatomic, strong) UIPickerView* mPickerView;
@property (nonatomic, strong) UIView* baseView;
@property (nonatomic ,strong) NSArray* dataArray;

@end


@implementation WWDPickerView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (id)initPickerViewWithFrame:(CGRect)frame data:(NSArray *)dataArray backgroundColor:(UIColor *)backgroundColor withShadow:(BOOL)shadow {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _dataArray = dataArray;
        
        // 添加半透明背景
        UIView* bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.alpha = 0.8f;
        [self addSubview:bgView];
        
        // 添加底层
        _baseView = [[UIView alloc] initWithFrame:CGRectMake(INTERVAL_LEFT_RIHGT, self.bounds.size.height / 4, self.bounds.size.width - 2 * INTERVAL_LEFT_RIHGT, self.bounds.size.height / 2 + 80.0)];
        _baseView.center = self.center;
        _baseView.backgroundColor = backgroundColor;
//        _baseView.layer.masksToBounds = YES; // 会把阴影切掉
        // 绘制阴影
        if (shadow) {
            [self strokeShadow];
        }
        [self addSubview:_baseView];
        
        // 添加选择器
        _mPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(_baseView.bounds.origin.x, _baseView.bounds.origin.y, _baseView.bounds.size.width, self.bounds.size.height / 2)];
        _mPickerView.delegate = self;
        _mPickerView.dataSource = self;
        _mPickerView.opaque = YES;
        _mPickerView.backgroundColor = [UIColor clearColor];
        [_baseView addSubview:_mPickerView];
        
        // 添加二个按钮 取消 和 确定
        
        
    }
    return self;
}

- (void)setup {
    UIView* bgView = [[UIView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.alpha = 0.2;
    [self addSubview:bgView];
    _mPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(20.0, self.bounds.size.height / 4, self.bounds.size.width - 40.0, self.bounds.size.height / 2)];
    _mPickerView.delegate = self;
    _mPickerView.dataSource = self;
    _mPickerView.tintColor = [UIColor whiteColor];
    _mPickerView.opaque = NO;
    _mPickerView.backgroundColor = [UIColor whiteColor];
    

    
    [self addSubview:_mPickerView];
    self.backgroundColor = [UIColor clearColor];
    self.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    _mPickerView.center = self.center;
}

#pragma mark - Tools

- (void)strokeShadow {
    // 添加边框
    _baseView.layer.borderWidth = 1.0f;
    _baseView.layer.cornerRadius = 8.0f;
    _baseView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    // 添加阴影
    _baseView.layer.shadowColor = [UIColor blackColor].CGColor;
    _baseView.layer.shadowOffset = CGSizeMake(2, 4);
    _baseView.layer.shadowOpacity = 0.8; // 不透明度
    _baseView.layer.shadowRadius = 4.0f;
}

#pragma mark - Delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [_delegate pickerView:pickerView didSelectRow:row inComponent:component];
}

#pragma mark - Datasource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (_dataArray.count > 0) {
        for (int i = 0; i < _dataArray.count; i++) {
            if (component == i) {
                return [[_dataArray objectAtIndex:i] count];
            }
        }
    }
    return 0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return _dataArray.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (_dataArray.count > 0) {
        for (int i = 0; i < _dataArray.count; i++) {
            if (component == i) {
                NSArray* temp = [NSArray arrayWithArray:[_dataArray objectAtIndex:i]];
                return [temp objectAtIndex:row];
            }
        }
    }
    return nil;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return _mPickerView.bounds.size.width / _dataArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return _mPickerView.bounds.size.height / 3;
}

@end
