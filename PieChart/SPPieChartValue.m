//
//  SPPieChartValue.m
//  PieChart
//
//  Created by Vladimir Milichenko on 7/7/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import "SPPieChartValue.h"

@implementation SPPieChartValue

- (id)initWithValue:(CGFloat)value color:(UIColor *)color
{
    self = [super init];
    
    if (self)
    {
        self.pieValue = value;
        self.pieColor = color;
    }

    return self;
}

@end
