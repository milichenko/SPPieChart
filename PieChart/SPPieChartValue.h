//
//  SPPieChartValue.h
//  PieChart
//
//  Created by Vladimir Milichenko on 7/7/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPPieChartValue : NSObject

@property (strong, nonatomic) UIColor *pieColor;

@property (assign, nonatomic) CGFloat pieValue;

- (id)initWithValue:(CGFloat)value color:(UIColor *)color;

@end
