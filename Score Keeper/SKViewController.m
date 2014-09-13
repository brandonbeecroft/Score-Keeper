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
@property (nonatomic, strong) NSMutableArray *scoreLabels;

@end

@implementation SKViewController

// reusable paramenters
CGFloat scoreViewTopPos = 60;
CGFloat scoreViewHeight = 80;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Score Keeper";

    // allocate the array!! but don't do it in your loop :) otherwise you overwrite it again and again.
    self.scoreLabels = [[NSMutableArray alloc] init];

    // add 4 views to the view
    for (int x = 0; x < 4; x++) {
        [self addScoreView:x];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) addScoreView:(int)index {

    // main score view
    UIView *scoreView = [[UIView alloc] initWithFrame:CGRectMake(0, scoreViewTopPos, self.view.frame.size.width, scoreViewHeight)];

    // UITextField - create fields! NOT UITextViews
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, 100, 40)];
    name.placeholder = @"Name";
    name.delegate = self;

    self.scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 30, 200, 40)];
    self.scoreLabel.text = @"0";

    // UISTepper
    UIStepper *scoreStepper = [[UIStepper alloc] initWithFrame:CGRectMake(216, 34, 50, 40)];
    [scoreStepper addTarget:self action:@selector(changeScore:) forControlEvents:UIControlEventValueChanged];
    scoreStepper.maximumValue = 1000;
    scoreStepper.minimumValue = -1000;
    scoreStepper.tag = index;

    // add all to the scoreView and add the scoreView to the main view.
    [scoreView addSubview:name];
    [scoreView addSubview:self.scoreLabel];
    [scoreView addSubview:scoreStepper];

    [self.view addSubview:scoreView];

    // increment height of scoreview
    scoreViewTopPos += scoreViewHeight;
    
    // add the scoreLabel to the scoreLabels array
    [self.scoreLabels addObject:self.scoreLabel];

    // number of objects in array:
    NSLog(@"Objects in array: %lu",(unsigned long)self.scoreLabels.count);

}

- (void)changeScore:(id)sender {

    UIStepper *myStepper = sender;
    NSInteger index = myStepper.tag;

    // check to see if i can get a value from the UIStepper
    NSLog(@"%f",myStepper.value);

    //check to see if I get the tag from the stepper.
    NSLog(@"Stepper tag is: %li", (long)index);

    // get scoreLabel from the array created
    UILabel *updatedScoreLabel = [self.scoreLabels objectAtIndex:index];

    //check value of newlabel - STUCK HERE
    NSLog(@"%@",updatedScoreLabel.text);

    // can't assign a double value to a string. convert a char?
    // I cheated here and looked at the solution. Was not sure how to look up in the docs my question of conversion. Realized
    // text is associated with NSString and that I could have looked there to find the 'stringWithFormat' parameter
    //newLabel.text = myStepper.value;
    updatedScoreLabel.text = [NSString stringWithFormat:@"%d",(int)myStepper.value];

    //print updatedScoreText
    NSLog(@"%@",updatedScoreLabel.text);

}

// First attempt at making the keyboard resign. Cheated and looked at solution
//-(void)textFieldDidEndEditing:(UITextField *)textField {
//    textField.resignFirstResponder = YES;
//}


// NOTE: still couldn't get the keyboard to remove after pressing done in the simulator. :(
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
