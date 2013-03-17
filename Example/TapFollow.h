//
//  TapFollow.h
//  Follow
//
//  Created by Ash Bhat on 3/16/13.
//  Copyright (c) 2013 Ash Bhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface TapFollow : UIViewController{
NSString *twitterhandle;
NSString *SuccessAlertTitle;
NSString *SuccessAlert;
NSString *ErrorAlert;
NSString *AlertButton;
}

//-(IBAction)pushButton1:(id)sender;
-(void)method:(NSString *)handle:(NSString *)title:(NSString *)success:(NSString *)button;
-(void)method:(NSString *)handle;

@end