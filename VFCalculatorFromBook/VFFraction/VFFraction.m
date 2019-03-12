//
//  VFFraction.m
//  VFCalculatorFromBook
//
//  Created by Филиппов Алексей on 12/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import "VFFraction.h"

@implementation VFFraction

@synthesize numerator, denominator;

- (void) setTo:(NSInteger)n over:(NSInteger)d
{
  numerator = n;
  denominator = d;
}

- (void) print
{
  NSLog(@"%li/%li", numerator, denominator);
}

- (double) convertToNum
{
  if (denominator != 0)
    return (double) numerator / denominator;
  else
    return NAN;
}

- (NSString *) convertToString
{
  if (numerator == denominator)
  {
    if (numerator == 0)
      return @"0";
    else
      return @"1";
  }
  else if (denominator == 1)
    return [NSString stringWithFormat: @"%li", numerator];
  else
    return [NSString stringWithFormat: @"%li/%li", numerator, denominator];
}

#pragma mark - calculation methods

- (VFFraction *) add: (VFFraction *) f
{
  VFFraction * result = [[VFFraction alloc] init];
  result.numerator = numerator * f.denominator + denominator * f.numerator;
  result.denominator = denominator * f.denominator;
  
  [result reduce];
  return result;
}

- (VFFraction *) subtract:(VFFraction *)f
{
  VFFraction *result = [[VFFraction alloc] init];
  
  result.numerator = numerator * f.denominator - denominator * f.numerator;
  result.denominator = denominator * f.denominator;
  
  [result reduce];
  return result;
}

- (VFFraction *) multiply:(VFFraction *)f
{
  VFFraction *result = [[VFFraction alloc] init];
  
  result.numerator = numerator * f.numerator;
  result.denominator = denominator * f.denominator;
  
  [result reduce];
  return result;
}

- (VFFraction *) divide:(VFFraction *)f
{
  VFFraction *result = [[VFFraction alloc] init];
  
  result.numerator = numerator * f.denominator;
  result.denominator = denominator * f.numerator;
  
  [result reduce];
  return result;
}

- (void) reduce
{
  NSInteger u = numerator;
  NSInteger v = denominator;
  NSInteger temp;
  
  if (u == 0)
    return;
  else if (u < 0)
    u = -u;
  
  while (v != 0)
  {
    temp = u % v;
    u = v;
    v = temp;
  }
  
  numerator /= u;
  denominator /= u;
}

@end
