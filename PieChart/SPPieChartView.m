//
//  SPPieChartView.m
//  PieChart
//
//  Created by Vladimir Milichenko on 7/7/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import "SPPieChartView.h"
#import "SPPieLayer.h"

@interface SPPieChartView ()

@property (strong, nonatomic) CALayer *containerLayer;
@property (strong, nonatomic) NSMutableArray *normalizedPieValues;

@end

@implementation SPPieChartView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self doInitialContainerLayerSetup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame backgroundColor:nil pieChartValues:nil];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor pieChartValues:(NSArray *)pieChartValues
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.pieChartBackgroundColor = backgroundColor;
        self.pieChartValues = pieChartValues.mutableCopy;
        
        [self doInitialContainerLayerSetup];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(rect.size.width / 2.0f, rect.size.height / 2.0f);
    CGFloat minSize = MIN(rect.size.width, rect.size.height);
    
    CGFloat sizePercents = minSize / PIE_CHART_STANDART_SIZE;
    
    CGFloat lineWidth = sizePercents * PIE_CHART_STANDART_LINE_WIDTH;
    CGFloat radius = (minSize - lineWidth) / 2.0f;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, center.x, center.y);
    CGContextRotateCTM(ctx, -M_PI * 0.5);
    
    CGContextSetLineWidth(ctx, lineWidth);
    
    CGFloat endAngle = M_PI * 2.0f;
    
    CGContextBeginPath(ctx);
    
    CGContextAddArc(ctx, 0.0f, 0.0f, radius, 0.0f, endAngle, 0);
    
    CGContextSetStrokeColorWithColor(ctx, self.pieChartBackgroundColor.CGColor);
    CGContextStrokePath(ctx);
    
    CGFloat startAngle = 0.0f;
    
    for (SPPieChartValue *pieChartValue in self.pieChartValues)
    {
        CGContextBeginPath(ctx);
        
        CGContextAddArc(ctx, 0.0f, 0.0f, radius, startAngle, startAngle + (endAngle * pieChartValue.pieValue), 0);
        
        CGContextSetStrokeColorWithColor(ctx, pieChartValue.pieColor.CGColor);
        CGContextStrokePath(ctx);
        
        startAngle += endAngle * pieChartValue.pieValue;;
    }
    
    CGContextRestoreGState(ctx);
}

- (void)setPieChartValues:(NSArray *)pieChartValues
{
    _pieChartValues = pieChartValues;
    
    for (CALayer *subLayer in self.containerLayer.sublayers)
    {
        [subLayer removeFromSuperlayer];
    }
    
    SPPieLayer *pieLayer = [SPPieLayer layer];
    pieLayer.frame = self.bounds;
    
    [self.containerLayer addSublayer:pieLayer];
    
    pieLayer = self.containerLayer.sublayers[0];
    pieLayer.pieBackgroundColor = self.superview.backgroundColor;
    pieLayer.startAngle = 2 * M_PI;
    pieLayer.endAngle = 0.0f;
}

- (void)showWithAnimation
{
    [self setNeedsDisplay];
    
    SPPieLayer *pieLayer = self.containerLayer.sublayers[0];
    pieLayer.endAngle = 2 * M_PI;
}

#pragma mark - Private Methods

- (void)doInitialContainerLayerSetup
{
    self.containerLayer = [CALayer layer];
    [self.layer addSublayer:self.containerLayer];
}
@end
