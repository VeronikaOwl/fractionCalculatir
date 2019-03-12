//
//  ViewController.h
//  VFCalculatorFromBook
//
//  Created by Филиппов Алексей on 11/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

- (void) processDigit: (int) digit;
- (void) processOp: (char) theOp;
- (void) storeFracPart;

// Chislovie klavishi

- (IBAction) clickDigit:(UIButton *) sender;

// klavishi arifmeticheskih operazij

- (IBAction) clickPlus;
- (IBAction) clickMinus;
- (IBAction) clickMultiply;
- (IBAction) clickDivide;

// rasnie klavishi

- (IBAction) clickOver;
- (IBAction) clickEquals;
- (IBAction) clickClear;

@end

