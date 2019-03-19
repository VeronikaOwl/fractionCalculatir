//
//  VFFraction.h
//  VFCalculatorFromBook
//
//  Created by Филиппов Алексей on 12/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFFraction : NSObject

@property NSInteger numerator, denominator;

- (void) print;
- (void) setTo: (NSInteger) n over: (NSInteger) d;
- (VFFraction *)      add: (VFFraction *) f;
- (VFFraction *) subtract: (VFFraction *) f;
- (VFFraction *) multiply: (VFFraction *) f;
- (VFFraction *)   divide: (VFFraction *) f;
- (void) reduce;
- (double) convertToNum;
- (NSString *) convertToString;

@end

NS_ASSUME_NONNULL_END
