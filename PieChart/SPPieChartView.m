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

//- (void)drawRect:(CGRect)rect
//{
//    CGPoint center = CGPointMake(rect.size.width / 2.0f, rect.size.height / 2.0f);
//    CGFloat minSize = MIN(rect.size.width, rect.size.height);
//    
//    CGFloat sizePercents = minSize / PIE_CHART_STANDART_SIZE;
//    
//    CGFloat lineWidth = sizePercents * PIE_CHART_STANDART_LINE_WIDTH;
//    CGFloat radius = (minSize - lineWidth) / 2.0f;
//    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(ctx);
//    CGContextTranslateCTM(ctx, center.x, center.y);
//    CGContextRotateCTM(ctx, -M_PI * 0.5);
//    
//    CGContextSetLineWidth(ctx, lineWidth);
//    
//    CGFloat endAngle = M_PI * 2.0f;
//    
//    CGContextBeginPath(ctx);
//    
//    CGContextAddArc(ctx, 0.0f, 0.0f, radius, 0.0f, endAngle, 0);
//    
//    CGContextSetStrokeColorWithColor(ctx, self.pieChartBackgroundColor.CGColor);
//    CGContextStrokePath(ctx);
//    
//    CGContextRestoreGState(ctx);
//}

- (void)setPieChartValues:(NSArray *)pieChartValues
{
    _pieChartValues = pieChartValues;
    
    self.normalizedPieValues = [NSMutableArray array];
    
    if (self.pieChartValues)
    {
        for (SPPieChartValue *pieChartValue in self.pieChartValues)
        {
            [self.normalizedPieValues addObject:@(pieChartValue.pieValue)];
        }
    }
    
    [self updatePieViews];
}

#pragma mark - Private Methods

- (void)doInitialContainerLayerSetup
{
    self.containerLayer = [CALayer layer];
    [self.layer addSublayer:self.containerLayer];
}

- (void)updatePieViews
{
    self.containerLayer.frame = self.bounds;
    
	if (self.normalizedPieValues.count > _containerLayer.sublayers.count)
    {
		NSInteger count = self.normalizedPieValues.count - self.containerLayer.sublayers.count;
		
        for (int i = 0; i < count; i++)
        {
			SPPieLayer *pieLayer = [SPPieLayer layer];
			pieLayer.frame = self.bounds;
			
			[self.containerLayer addSublayer:pieLayer];
		}
	}
	else if (self.normalizedPieValues.count < self.containerLayer.sublayers.count)
    {
		NSInteger count = _containerLayer.sublayers.count - self.normalizedPieValues.count;
        
		for (int i = 0; i < count; i++)
        {
			[[self.containerLayer.sublayers objectAtIndex:0] removeFromSuperlayer];
		}
	}

	CGFloat startAngle = 0.0;
	NSInteger index = 0;
	
    for (NSNumber *num in self.normalizedPieValues)
    {
		CGFloat angle = num.floatValue * 2 * M_PI;
		
		SPPieLayer *pieLayer = self.containerLayer.sublayers[index];
        SPPieChartValue *pieValue = self.pieChartValues[index];
		pieLayer.pieBackgroundColor = pieValue.pieColor;
		pieLayer.startAngle = startAngle;
		pieLayer.endAngle = startAngle + angle;
		
		startAngle += angle;
		index++;
	}
}

@end
