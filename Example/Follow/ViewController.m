//
//  ViewController.m
//  Follow
//
//  Created by Ash Bhat on 3/16/13.
//  Copyright (c) 2013 Ash Bhat. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

-(IBAction)easy:(id)sender
{
    twitter = [[TapFollow alloc] init];
    [twitter method:@"theashbhat"];
}

//extra stuff again
-(IBAction)custom:(id)sender
{
    twitter = [[TapFollow alloc] init];
    [twitter method:@"theashbhat":@"Success!":@"Awesome! Thanks for following! It means a ton!" : @"Cool!"];
}

-(IBAction)FollowAsh:(id)sender
{
    twitter = [[TapFollow alloc] init];
    [twitter method:@"theashbhat"];
}


@end
