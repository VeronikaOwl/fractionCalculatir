//
//  VFCalculator.m
//  VFCalculatorFromBook
//
//  Created by Филиппов Алексей on 12/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import "VFCalculator.h"

@implementation VFCalculator

@synthesize operand1, operand2, accumulator;

- (id) init
{
  self = [super init];
  
  if (self)
  {
    operand1 = [[VFFraction alloc] init];
    operand2 = [[VFFraction alloc] init];
    accumulator = [[VFFraction alloc] init];
  }
  return self;
}

- (void) clear
{
  accumulator.numerator = 0;
  accumulator.denominator = 0;
}

- (VFFraction *) performOperator:(char)op
{
  VFFraction *result;
  switch (op)
  {
    case '+':
      result = [operand1 add: operand2];
      break;
    case '-':
      result = [operand1 subtract: operand2];
      break;
    case '*':
      result = [operand1 multiply: operand2];
      break;
    case '/':
      result = [operand1 divide: operand2];
      break;
  }
  
  accumulator.numerator = result.numerator;
  accumulator.denominator = result.denominator;
  
  return accumulator;
}


@end
