TapFollow
=========
Tap Follow Allows you to follow on twitter natively in an iOS application. The code has also been optimized to allow super easy implementation. 4 Lines of code is realistically all you need.

To implement, drag the TapFollow h and m files into your xcode project. Make sure to also add social.framework and accounts.framework

In the view that you are using it .h initialize it as follows

--
#import "TapFollow.h"

@interface YourViewController : UIViewController
{
    TapFollow *Twitter;
}

-(IBAction)SomeName:(id)sender;

@end

----------------------------------------
In the view that you are using it .m implement it as follows
----------------------------------------

@implementation YourViewController

-(IBAction)SomeName:(id)sender
{
    Twitter = [[TapFollow alloc]init];
    [Twitter method:@"yourtwitterhandle"];
}

@end

----------------------------------------
Once that's all done, just make a UIButton in StoryBoard or the appropriete XIB and link the action. That's really it!

If this helps please follow me on twitter @theashbhat and let me know! 

~Ash
