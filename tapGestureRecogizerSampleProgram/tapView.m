//
//  tapView.m
//  tapGestureRecogizerSampleProgram
//
//  Created by KLabs on 11/21/17.
//  Copyright © 2017 KLabs. All rights reserved.
//

#import "tapView.h"

@implementation tapView{
UIColor *mainColor;
UIColor *progColor;
CGFloat currentProgress;
}
@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
        mainColor=[UIColor redColor];
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)rect{
    if(self = [super initWithFrame:rect]){
        [self initialize];
    }
    return self;
}

-(void)initialize{
    
    
  //Add the Layers that make up the progress button
    
    if (!_circleLayer) {
        
        _circleLayer = [CALayer layer];
        _circleLayer.backgroundColor = mainColor.CGColor;
        
        CGFloat size = self.frame.size.width/1.5;
        _circleLayer.bounds = CGRectMake(0, 0, size, size);
        _circleLayer.anchorPoint = CGPointMake(0.5, 0.5);
        _circleLayer.position = (CGPoint){CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)};
        
        _circleLayer.cornerRadius = size/2;
        
        [self.layer insertSublayer:_circleLayer atIndex:0];
    }
    
    if (!_progressLayer) {
        
        CGFloat startAngle = M_PI + M_PI_2;
        CGFloat endAngle = M_PI * 3 + M_PI_2;
        CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        _gradientMaskLayer = [self gradientMask];
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:self.frame.size.width/2-15 startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
        _progressLayer.backgroundColor = [UIColor clearColor].CGColor;
        _progressLayer.fillColor = nil;
        _progressLayer.strokeColor = [UIColor blackColor].CGColor;
        _progressLayer.lineWidth = 12.0;
        _progressLayer.strokeStart = 0.0;
        _progressLayer.strokeEnd = 0.0;
        
        _gradientMaskLayer.mask = _progressLayer;
        [self.layer insertSublayer:_gradientMaskLayer atIndex:0];
    }
    /*
    if (!_progressLayer) {
        
        CGFloat startAngle = M_PI + M_PI_2;
        CGFloat endAngle = M_PI * 3 + M_PI_2;
        CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        _gradientMaskLayer = [self gradientMask];
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:self.frame.size.width/2-15 startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
        _progressLayer.backgroundColor = [UIColor clearColor].CGColor;
        _progressLayer.fillColor = nil;
        _progressLayer.strokeColor = [UIColor blackColor].CGColor;
        _progressLayer.lineWidth = 12.0;
        _progressLayer.strokeStart = 0.0;
        _progressLayer.strokeEnd = 0.0;
        
        _gradientMaskLayer.mask = _progressLayer;
        [layer insertSublayer:_gradientMaskLayer atIndex:0];
    
    */
    
    //Add longpressgesturerecognizer
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]init];
    [longPress addTarget:self action:@selector(longTap:)];
    longPress.numberOfTapsRequired = 0;
    longPress.minimumPressDuration = .5;
    longPress.delegate=self;
    [self addGestureRecognizer:longPress];
    
    UITapGestureRecognizer *tapPress = [[UITapGestureRecognizer alloc]init];
    [tapPress addTarget:self action:@selector(tapPress)];
    tapPress.numberOfTapsRequired = 1;
    tapPress.numberOfTouchesRequired = 1;
    
    [self addGestureRecognizer:tapPress];
    _progressLayer.strokeEnd = .5;

}
-(void)longTap:(UITapGestureRecognizer *)recognizer{
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        //Add code here when the record button activates (user presses and holds the button for about half a second 0.5)
        
        NSLog(@"touch UIGestureRecognizerStateBegan");
        //fire the timer to start animating
        
        [self.delegate recordButtonDidPressToRecord];
    }
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"touch UIGestureRecognizerStateEnded");
        //NSLog(@"Position of touch: %.3f, %.3f", location.x, location.y);    // Position landscape
    }
}

-(void)tapPress{
    
    NSLog(@"tapPress!");
    [self.delegate recordButtonDidTakePhoto];
    
}
    - (CAGradientLayer *)gradientMask {
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        gradientLayer.locations = @[@0.0, @1.0];
        
        if (!progColor)
            progColor = [UIColor blueColor];
        
        UIColor *topColor = progColor;
        UIColor *bottomColor = progColor;
        
        gradientLayer.colors = @[(id)topColor.CGColor, (id)bottomColor.CGColor];
        
        return gradientLayer;
    }
@end
