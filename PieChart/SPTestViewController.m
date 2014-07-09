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
    
    self.pieChartView.pieChartBackgroundColor = self.view.backgroundColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)randomizeAction:(id)sender
{
    /*SPPieChartValue *v1 = [[SPPieChartValue alloc] initWithValue:arc4random_uniform(10) / 50.0f color:[UIColor redColor]];
    SPPieChartValue *v2 = [[SPPieChartValue alloc] initWithValue:arc4random_uniform(10) / 50.0f color:[UIColor greenColor]];
    SPPieChartValue *v3 = [[SPPieChartValue alloc] initWithValue:arc4random_uniform(10) / 50.0f color:[UIColor magentaColor]];
    SPPieChartValue *v4 = [[SPPieChartValue alloc] initWithValue:arc4random_uniform(10) / 50.0f color:[UIColor yellowColor]];
    SPPieChartValue *v5 = [[SPPieChartValue alloc] initWithValue:arc4random_uniform(10) / 50.0f color:[UIColor blackColor]];*/
    
    SPPieChartValue *v1 = [[SPPieChartValue alloc] initWithValue:0.1f color:[UIColor redColor]];
    SPPieChartValue *v2 = [[SPPieChartValue alloc] initWithValue:0.2f color:[UIColor greenColor]];
    SPPieChartValue *v3 = [[SPPieChartValue alloc] initWithValue:0.15f color:[UIColor magentaColor]];
    SPPieChartValue *v4 = [[SPPieChartValue alloc] initWithValue:0.3f color:[UIColor yellowColor]];
    SPPieChartValue *v5 = [[SPPieChartValue alloc] initWithValue:0.23f color:[UIColor blackColor]];
    
    self.pieChartView.pieChartValues = @[v1, v2, v3, v4, v5];
    
    /*NSMutableArray *randomPieValues = [NSMutableArray array];
	int count = 1 + rand() % 10;
	
    for (int i = 0; i < count; i++)
    {
        NSInteger aRedValue = arc4random()%255;
        NSInteger aGreenValue = arc4random()%255;
        NSInteger aBlueValue = arc4random()%255;
        
        UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
        SPPieChartValue *v = [[SPPieChartValue alloc] initWithValue:rand() % 10 color:randColor];
		//[randomNumbers addObject:[NSNumber numberWithInt:rand() % 100]];
        [randomPieValues addObject:v];
	}
	
	self.pieChartView.pieChartValues = randomPieValues;*/
}

@end
