//
//  ViewController.m
//  tapGestureRecogizerSampleProgram
//
//  Created by KLabs on 11/21/17.
//  Copyright © 2017 KLabs. All rights reserved.
//

#import "ViewController.h"
#import "tapView.h"

@interface ViewController ()<tapViewDelegate>
@property (weak, nonatomic) IBOutlet tapView *myTapButton;
@property (weak, nonatomic) IBOutlet UITableView *myTabView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTapButton.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)recordButtonDidTakePhoto{
    NSLog(@"tapatio");
    
}
-(void)recordButtonDidPressToRecord{
    NSLog(@"Pagliaggo");
    
}
@end
