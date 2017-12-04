//
//  tapView.h
//  tapGestureRecogizerSampleProgram
//
//  Created by KLabs on 11/21/17.
//  Copyright © 2017 KLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol tapViewDelegate<NSObject>
//put func here...
-(void)recordButtonDidTakePhoto;
-(void)recordButtonDidPressToRecord;
@end
@interface tapView : UIView<UIGestureRecognizerDelegate>
@property (nonatomic, strong) CALayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic) IBInspectable id<tapViewDelegate> delegate;
@property (weak,nonatomic) IBInspectable UIColor *backGroundColor;
@property (nonatomic, strong) CAGradientLayer *gradientMaskLayer;

@end
