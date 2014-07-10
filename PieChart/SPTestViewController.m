//
//  SPTestViewController.m
//  PieChart
//
//  Created by Vladimir Milichenko on 7/8/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import "SPTestViewController.h"
#import "SPPieChartView.h"

@interface SPTestViewController ()

@property (weak, nonatomic) IBOutlet SPPieChartView *pieChartView;
@property (weak, nonatomic) IBOutlet SPPieChartView *pieChartView2;
@property (weak, nonatomic) IBOutlet SPPieChartView *pieChartView3;
@property (weak, nonatomic) IBOutlet SPPieChartView *pieChartView4;

@end

@implementation SPTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pieChartView.pieChartBackgroundColor = self.view.backgroundColor;
    self.pieChartView.spacesPercents = 0.05f;
    
    self.pieChartView2.pieChartBackgroundColor = self.view.backgroundColor;
    self.pieChartView2.animationDuration = 2.0f;
    
    self.pieChartView3.pieChartBackgroundColor = self.view.backgroundColor;
    self.pieChartView3.spacesPercents = 0.025f;
    
    self.pieChartView4.pieChartBackgroundColor = self.view.backgroundColor;
    
    [self initPieChartsValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)animateAction:(id)sender
{
    [self.pieChartView showWithAnimation];
    [self.pieChartView2 showWithAnimation];
    [self.pieChartView3 showWithAnimation];
    [self.pieChartView4 showWithAnimation];
}

- (IBAction)resetAction:(id)sender
{
    self.pieChartView.pieChartValues = nil;
    
    [self initPieChartsValues];
}

- (void)initPieChartsValues
{
    SPPieChartValue *v1 = [[SPPieChartValue alloc] initWithValue:0.2f color:[UIColor redColor]];
    SPPieChartValue *v2 = [[SPPieChartValue alloc] initWithValue:0.2f color:[UIColor greenColor]];
    SPPieChartValue *v3 = [[SPPieChartValue alloc] initWithValue:0.2f color:[UIColor magentaColor]];
    SPPieChartValue *v4 = [[SPPieChartValue alloc] initWithValue:0.2f color:[UIColor yellowColor]];
    SPPieChartValue *v5 = [[SPPieChartValue alloc] initWithValue:1.0f - (v1.pieValue + v2.pieValue + v3.pieValue + v4.pieValue) color:[UIColor blackColor]];
    
    self.pieChartView.pieChartValues = @[v1, v2, v3, v4, v5];
    
    v1 = [[SPPieChartValue alloc] initWithValue:drand48() / 3 color:[UIColor redColor]];
    v2 = [[SPPieChartValue alloc] initWithValue:drand48() / 3 color:[UIColor greenColor]];
    v3 = [[SPPieChartValue alloc] initWithValue:drand48() / 3 color:[UIColor magentaColor]];
    v4 = [[SPPieChartValue alloc] initWithValue:drand48() / 3 color:[UIColor yellowColor]];
    v5 = [[SPPieChartValue alloc] initWithValue:1.0f - (v1.pieValue + v2.pieValue + v3.pieValue + v4.pieValue) color:[UIColor blackColor]];
    
    self.pieChartView2.pieChartValues = @[v1, v2, v3, v4, v5];
    
    v1 = [[SPPieChartValue alloc] initWithValue:0.15f color:[UIColor redColor]];
    v2 = [[SPPieChartValue alloc] initWithValue:0.25f color:[UIColor greenColor]];
    v3 = [[SPPieChartValue alloc] initWithValue:0.1f color:[UIColor magentaColor]];
    v4 = [[SPPieChartValue alloc] initWithValue:0.3f color:[UIColor yellowColor]];
    v5 = [[SPPieChartValue alloc] initWithValue:0.2f color:[UIColor blackColor]];
    
    self.pieChartView3.pieChartValues = @[v1, v2, v3, v4, v5];
    
    v1 = [[SPPieChartValue alloc] initWithValue:drand48() / 5 color:[UIColor redColor]];
    v2 = [[SPPieChartValue alloc] initWithValue:drand48() / 5 color:[UIColor greenColor]];
    v3 = [[SPPieChartValue alloc] initWithValue:drand48() / 5 color:[UIColor magentaColor]];
    v4 = [[SPPieChartValue alloc] initWithValue:drand48() / 5 color:[UIColor yellowColor]];
    v5 = [[SPPieChartValue alloc] initWithValue:1.0f - (v1.pieValue + v2.pieValue + v3.pieValue + v4.pieValue) color:[UIColor blackColor]];
    
    self.pieChartView4.pieChartValues = @[v1, v2, v3, v4, v5];
}

@end
