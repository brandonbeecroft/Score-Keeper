//
//  SKViewController.m
//  Score Keeper
//
//  Created by Brandon Beecroft on 9/10/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@property (strong, nonatomic) UILabel *scoreLabel;
@property (nonatomic) double stepValue;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Score Keeper";

    [self addScoreView:1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) addScoreView:(int)index {

    UIView *scoreView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    scoreView.backgroundColor = [UIColor lightGrayColor];

    // UITextView
    UITextView *name = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 100, 40)];
//    name.backgroundColor = [UIColor lightGrayColor];



    self.scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 28, 200, 50)];
    self.scoreLabel.text = @"0";

    // UISTepper
    UIStepper *scoreStepper = [[UIStepper alloc] initWithFrame:CGRectMake(200, 38, 50, 50)];
    [scoreStepper addTarget:self action:@selector(changeLabelText) forControlEvents:UIControlEventValueChanged];

    [scoreView addSubview:name];
    [scoreView addSubview:self.scoreLabel];
    [scoreView addSubview:scoreStepper];

    [self.view addSubview:scoreView];

}

- (void)changeLabelText {
//    self.label.text = self.stepValue;

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
