//
//  TapFollow.m
//  Follow
//
//  Created by Ash Bhat on 3/16/13.
//  Copyright (c) 2013 Ash Bhat. All rights reserved.
//

#import "TapFollow.h"

@interface TapFollow ()

@end

@implementation TapFollow

-(void)method:(NSString *)handle
{
    twitterhandle = handle;
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        if(granted) {
            // Get the list of Twitter accounts.
            NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];
            if ([accountsArray count] > 0) {
                ACAccount *twitterAccount = [accountsArray objectAtIndex:0];
                NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
                [tempDict setValue:twitterhandle forKey:@"screen_name"];
                [tempDict setValue:@"true" forKey:@"follow"];
                NSLog(@"*******tempDict %@*******",tempDict);
                SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:[NSURL URLWithString:@"https://api.twitter.com/1/friendships/create.json"] parameters:tempDict];
                [postRequest setAccount:twitterAccount];
                [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    NSString *output = [NSString stringWithFormat:@"HTTP response status: %i Error %d", [urlResponse statusCode],error.code];
                    NSLog(@"%@error %@", output,error.description);
                    if (urlResponse.statusCode == 200)
                    {
                        UIAlertView *statusOK = [[UIAlertView alloc]
                                                 initWithTitle:@"Follow Success"
                                                 message:@"Follow was a success. Thank you."
                                                 delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [statusOK show];
                        });
                    }
                }];
            }
            
        }
    }];
}
-(void)method:(NSString *)handle:(NSString *)title:(NSString *)success:(NSString *)button
{
    twitterhandle = handle;
    SuccessAlertTitle = title;
    SuccessAlert = success;
    //ErrorAlert = fail;
    AlertButton = button;
    NSLog(@"follower");
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        if(granted) {
            // Get the list of Twitter accounts.
            NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];
            
            if ([accountsArray count] > 0) {
                ACAccount *twitterAccount = [accountsArray objectAtIndex:0];
                NSLog(twitterhandle);
                NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
                [tempDict setValue:twitterhandle forKey:@"screen_name"];
                [tempDict setValue:@"true" forKey:@"follow"];
                NSLog(@"*******tempDict %@*******",tempDict);
                
                
                SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:[NSURL URLWithString:@"https://api.twitter.com/1/friendships/create.json"] parameters:tempDict];
                [postRequest setAccount:twitterAccount];
                [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    NSString *output = [NSString stringWithFormat:@"HTTP response status: %i Error %d", [urlResponse statusCode],error.code];
                    NSLog(@"%@error %@", output,error.description);
                    if (urlResponse.statusCode == 200)
                    {
                        UIAlertView *statusOK = [[UIAlertView alloc]
                                                 initWithTitle:SuccessAlertTitle
                                                 message:SuccessAlert
                                                 delegate:self
                                                 cancelButtonTitle:AlertButton
                                                 otherButtonTitles:nil];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [statusOK show];
                        });
                    }
                }];
            }
            
        }
    }];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end