//
//  SPPieLayer.h
//  PieChart
//
//  Created by Vladimir Milichenko on 7/9/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#define PIE_CHART_STANDART_SIZE 56.0f
#define PIE_CHART_STANDART_LINE_WIDTH 7.5f
#define PIE_CHART_DEFAULT_ANIMATION_DURATION 0.5f

@interface SPPieLayer : CALayer

@property (strong, nonatomic) UIColor *pieBackgroundColor;

@property (assign, nonatomic) CGFloat animationDuration;

@property (assign, nonatomic) CGFloat startAngle;
@property (assign, nonatomic) CGFloat endAngle;

@end
