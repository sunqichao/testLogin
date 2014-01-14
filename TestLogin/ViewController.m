//
//  ViewController.m
//  TestLogin
//
//  Created by sunqichao on 14-1-13.
//  Copyright (c) 2014年 sunqichao. All rights reserved.
//

#import "ViewController.h"
#import "UMSocial.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyBoard:(id)sender {
    [_inputText resignFirstResponder];
}

- (IBAction)shareAction:(id)sender {
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
                                       delegate:nil];
    
}

- (IBAction)login:(id)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response)
                                  {
                                      NSLog(@"response is %@",response);
                                      //如果是授权到新浪微博，SSO之后如果想获取用户的昵称、头像等需要再次获取一次账户信息
                                      if ([snsPlatform.platformName isEqualToString:UMShareToSina]) {
                                          [[UMSocialDataService defaultDataService] requestSocialAccountWithCompletion:^(UMSocialResponseEntity *accountResponse){
                                              NSLog(@"SinaWeibo's user name is %@",[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToSina] objectForKey:@"username"]);
                                          }];
                                      }
                                  });
    
}
@end
