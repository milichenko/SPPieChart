//
//  SPPieChartViewLayer.m
//  PieChart
//
//  Created by Vladimir Milichenko on 7/7/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import "SPPieChartViewLayer.h"
#import "SPPieChartValue.h"

@implementation SPPieChartViewLayer

@dynamic pieChartValues;
@dynamic pieChartBackgroundcolor;
@dynamic pieChartValueColor;
@dynamic totalPercents;

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"totalPercents"])
    {
        return YES;
    }
    else
    {
        return [super needsDisplayForKey:key];
    }
}

- (id)actionForKey:(NSString *)aKey
{
    if ([aKey isEqualToString:@"totalPercents"])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:aKey];
        animation.fromValue = [self.presentationLayer valueForKey:aKey];
        
        return animation;
    }
    
	return [super actionForKey:aKey];
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGRect rect = self.frame;
    
    CGPoint center = CGPointMake(rect.size.width / 2.0f, rect.size.height / 2.0f);
    CGFloat minSize = MIN(rect.size.width, rect.size.height);
    
    CGFloat sizePercents = minSize / PIE_CHART_STANDART_SIZE;
    
    CGFloat lineWidth = sizePercents * PIE_CHART_STANDART_LINE_WIDTH;
    CGFloat radius = (minSize - lineWidth) / 2.0f;
    
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, center.x, center.y);
    CGContextRotateCTM(ctx, -M_PI * 0.5);
    
    CGContextSetLineWidth(ctx, lineWidth);
    
    CGFloat endAngle = M_PI * 2.0f;
    
    CGContextBeginPath(ctx);
    
    CGContextAddArc(ctx, 0.0f, 0.0f, radius, 0.0f, endAngle, 0);
    
    CGContextSetStrokeColorWithColor(ctx, self.pieChartBackgroundcolor.CGColor);
    CGContextStrokePath(ctx);
    
    CGFloat startAngle = 0.0f;
    
//    for (SPPieChartValue *pieChartValue in self.pieChartValues)
//    {
//        CGContextBeginPath(ctx);
//        
//        CGContextAddArc(ctx, 0.0f, 0.0f, radius, startAngle, startAngle + (endAngle * pieChartValue.pieValue), 0);
//        
//        CGContextSetStrokeColorWithColor(ctx, pieChartValue.pieColor.CGColor);
//        CGContextStrokePath(ctx);
//
//        startAngle += endAngle * pieChartValue.pieValue;
//    }
    CGContextBeginPath(ctx);
    
    CGContextAddArc(ctx, 0.0f, 0.0f, radius, 0.0f, endAngle * self.totalPercents, 0);
    NSLog(@"%@", self.pieChartValueColor);
    CGContextSetStrokeColorWithColor(ctx, self.pieChartValueColor.CGColor);
    CGContextStrokePath(ctx);

    CGContextBeginPath(ctx);
    
    CGContextAddArc(ctx, 0.0f, 0.0f, radius, 0.0f, endAngle * self.totalPercents, 0);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor clearColor].CGColor);
    CGContextStrokePath(ctx);

    
    CGContextRestoreGState(ctx);
    
    [super drawInContext:ctx];
}

@end
