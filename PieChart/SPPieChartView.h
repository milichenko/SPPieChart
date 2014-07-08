//
//  SPPieChartView.h
//  PieChart
//
//  Created by Vladimir Milichenko on 7/7/14.
//  Copyright (c) 2014 Vladimir Milichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPPieChartValue.h"

@interface SPPieChartView : UIView

@property (strong, nonatomic) UIColor *pieChartBackgroundColor;
@property (strong, nonatomic) NSArray *pieChartValues;

@end
