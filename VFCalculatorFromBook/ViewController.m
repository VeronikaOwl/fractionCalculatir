//
//  ViewController.m
//  VFCalculatorFromBook
//
//  Created by Филиппов Алексей on 11/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import "ViewController.h"
#import "VFCalculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
  char op;
  NSInteger currentNumber;
  BOOL firstOperand, isNumerator;
  VFCalculator *myCalculator;
  NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad
{
  firstOperand = YES;
  isNumerator = YES;
  displayString = [NSMutableString stringWithCapacity: 40];
  myCalculator = [[VFCalculator alloc] init];
  
  //[super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void) processDigit:(NSInteger)digit
{
  currentNumber = currentNumber * 10 + digit;
  
  [displayString appendString: [NSString stringWithFormat: @"%li", digit]];
  display.text = displayString;
}

- (IBAction) clickDigit:(UIButton *)sender
{
  NSInteger digit = sender.tag;
  
  [self processDigit: digit];
}

- (void) processOp:(char)theOp
{
  NSString *opStr;
  op = theOp;
  
  switch (theOp)
  {
    case '+':
      opStr = @"+";
      break;
    case '-':
      opStr = @"-";
      break;
    case '*':
      opStr = @"*";
      break;
    case '/':
      opStr = @"/";
      break;
  }
  
  [self storeFracPart];
  firstOperand = NO;
  isNumerator = YES;
  
  [displayString appendString: opStr];
  display.text = displayString;
}

- (void) storeFracPart
{
  if (firstOperand)
  {
    if (isNumerator)
    {
      myCalculator.operand1.numerator = currentNumber;
      myCalculator.operand1.denominator = 1; //for excample 3 * 4/5 =
    }
    else
      myCalculator.operand1.denominator = currentNumber;
  }
  else if (isNumerator)
  {
    myCalculator.operand2.numerator = currentNumber;
    myCalculator.operand2.denominator = 1; //for excample 3/2 * 4 =
  }
  else
  {
    myCalculator.operand2.denominator = currentNumber;
    firstOperand = YES;
  }
  
  currentNumber = 0;
}

- (IBAction) clickOver
{
  [self storeFracPart];
  isNumerator = NO;
  [displayString appendString: @"/"];
  display.text = displayString;
}

#pragma mark - arithmetic keys

- (IBAction) clickPlus
{
  [self processOp: '+'];
}

- (IBAction) clickMinus
{
  [self processOp: '-'];
}

- (IBAction) clickMultiply
{
  [self processOp: '*'];
}

- (IBAction) clickDivide
{
  [self processOp: '-'];
}

#pragma mark - other keys

- (IBAction) clickEquals
{
  if (firstOperand == NO)
  {
    [self storeFracPart];
    [myCalculator performOperator: op];
    
    [displayString appendString: @"="];
    [displayString appendString: [myCalculator.accumulator convertToString]];
    display.text = displayString;
    
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [displayString setString: @""];
  }
}

- (IBAction) clickClear
{
  isNumerator = YES;
  firstOperand = YES;
  currentNumber = 0;
  [myCalculator clear];
  
  [displayString setString: @""];
  display.text = displayString;
}

@end
