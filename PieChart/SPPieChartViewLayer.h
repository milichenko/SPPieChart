//
//  SPPieChartViewLayer.h
//  PieChart
//
//  Created by Vladimir Milichenko on 7/7/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#define PIE_CHART_STANDART_SIZE 56.0f
#define PIE_CHART_STANDART_LINE_WIDTH 7.5f

@interface SPPieChartViewLayer : CALayer

@property (strong, nonatomic) NSMutableArray *pieChartValues;
@property (strong, nonatomic) UIColor *pieChartBackgroundcolor;
@property (strong, nonatomic) UIColor *pieChartValueColor;

@property (assign, nonatomic) CGFloat totalPercents;

@end
