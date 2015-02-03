//
//  WWDPickerView.h
//  WWDPickerView
//
//  Created by maginawin on 15-2-3.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WWDPickerViewDelegate <NSObject>

@required

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end

@interface WWDPickerView : UIView<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) id<WWDPickerViewDelegate> delegate;

- (id)initPickerViewWithFrame:(CGRect)frame data:(NSArray*)dataArray backgroundColor:(UIColor*)backgroundColor withShadow:(BOOL)shadow;

@end
