//
//  SPPieLayer.m
//  PieChart
//
//  Created by Vladimir Milichenko on 7/9/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import "SPPieLayer.h"

@implementation SPPieLayer

@dynamic startAngle;
@dynamic endAngle;
@synthesize pieBackgroundColor;

+ (BOOL)needsDisplayForKey:(NSString *)key
{
	if ([key isEqualToString:@"startAngle"] || [key isEqualToString:@"endAngle"])
    {
		return YES;
	}
	
	return [super needsDisplayForKey:key];
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.contentsScale = [[UIScreen mainScreen] scale];
		[self setNeedsDisplay];
    }
	
    return self;
}

- (id)initWithLayer:(id)layer
{
	if (self = [super initWithLayer:layer])
    {
		if ([layer isKindOfClass:[SPPieLayer class]])
        {
			SPPieLayer *other = (SPPieLayer *)layer;
			self.startAngle = other.startAngle;
			self.endAngle = other.endAngle;
			self.pieBackgroundColor = other.pieBackgroundColor;
		}
	}
	
	return self;
}

- (id<CAAction>)actionForKey:(NSString *)event
{
	if ([event isEqualToString:@"startAngle"] || [event isEqualToString:@"endAngle"])
    {
		return [self makeAnimationForKey:event];
	}
	
	return [super actionForKey:event];
}

- (CABasicAnimation *)makeAnimationForKey:(NSString *)key
{
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
	animation.fromValue = [[self presentationLayer] valueForKey:key];
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	animation.duration = 0.5;
    
	return animation;
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGRect rect = self.frame;
    
    CGPoint center = CGPointMake(rect.size.width / 2.0f, rect.size.height / 2.0f);
    CGFloat minSize = MIN(rect.size.width, rect.size.height);
    
    CGFloat sizePercents = minSize / PIE_CHART_STANDART_SIZE;
    
    CGFloat lineWidth = (sizePercents * PIE_CHART_STANDART_LINE_WIDTH) + 2;
    CGFloat radius = ((minSize - lineWidth) / 2.0f) + 1;
    
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, center.x, center.y);
    CGContextRotateCTM(ctx, -M_PI * 0.5);
    
    CGContextSetLineWidth(ctx, lineWidth);
    
    CGContextBeginPath(ctx);
    
    CGContextAddArc(ctx, 0.0f, 0.0f, radius, self.startAngle, self.endAngle, 1);
    
    CGContextSetStrokeColorWithColor(ctx, self.pieBackgroundColor.CGColor);
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    
    [super drawInContext:ctx];
}

@end
