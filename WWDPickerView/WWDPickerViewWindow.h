//
//  WWDPickerViewWindow.h
//  WWDPickerView
//
//  Created by maginawin on 15-2-3.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWDPickerViewWindow : UIWindow<UIPickerViewDataSource, UIPickerViewDelegate>

+ (WWDPickerViewWindow*)sharedInstance;

- (void)show;

@end
