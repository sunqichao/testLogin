//
//  ViewController.h
//  TestLogin
//
//  Created by sunqichao on 14-1-13.
//  Copyright (c) 2014年 sunqichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *inputText;

@property (weak, nonatomic) IBOutlet UITextView *outputText;

- (IBAction)dismissKeyBoard:(id)sender;

- (IBAction)shareAction:(id)sender;

- (IBAction)login:(id)sender;
@end
