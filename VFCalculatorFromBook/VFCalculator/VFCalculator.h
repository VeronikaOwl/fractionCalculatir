//
//  VFCalculator.h
//  VFCalculatorFromBook
//
//  Created by Филиппов Алексей on 12/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFFraction.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFCalculator : NSObject

@property (strong, nonatomic) VFFraction *operand1;
@property (strong, nonatomic) VFFraction *operand2;
@property (strong, nonatomic) VFFraction *accumulator;

- (VFFraction *) performOperator: (char) op;
- (void) clear;

@end

NS_ASSUME_NONNULL_END
