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
    
    self.pieChartView.pieChartBackgroundColor = [UIColor grayColor];
    
    SPPieChartValue *v1 = [[SPPieChartValue alloc] initWithValue:0.5f color:[UIColor redColor]];
    SPPieChartValue *v2 = [[SPPieChartValue alloc] initWithValue:0.3f color:[UIColor greenColor]];
    
    self.pieChartView.pieChartValues = @[v1, v2].mutableCopy;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
