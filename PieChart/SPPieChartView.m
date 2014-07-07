//
//  SPPieChartView.m
//  PieChart
//
//  Created by Vladimir Milichenko on 7/7/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import "SPPieChartView.h"
#import "SPPieChartViewLayer.h"

@implementation SPPieChartView

+ (Class)layerClass
{
    return [SPPieChartViewLayer class];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame pieChartValues:nil];
    
    if (self)
    {
        // Initialization code
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame pieChartValues:(NSArray *)pieChartValues
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.pieChartValues = pieChartValues.mutableCopy;
    }
    
    return self;
}

@end
