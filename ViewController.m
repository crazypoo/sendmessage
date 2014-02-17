//
//  ViewController.m
//  WritingAnimationMessageView
//
//  Created by Alok on 30/04/13.
//  Copyright (c) 2013 Konstant Info Private Limited. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()
@property (nonatomic, retain) UIImage* flakeImage;
@end

@implementation ViewController
@synthesize flakeImage;

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
    self.view.backgroundColor = [UIColor blueColor];
    flakeImage = [UIImage imageNamed:@"snow.png"];

    [NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];

//    UILabel *lol = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    lol.text = @"asdasd";
//    [self.view addSubview:lol];
    // Do any additional setup after loading the view from its nib.
}
-(void)onTimer
{
    UIImageView* flakeView = [[UIImageView alloc] initWithImage:flakeImage];
	
	// use the random() function to randomize up our flake attributes
	int startX = round(random() % 320);
	int endX = round(random() % 320);
	double scale = 1 / round(random() % 100) + 1.0;
	double speed = 1 / round(random() % 100) + 1.0;
	
	// set the flake start position
	flakeView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
	flakeView.alpha = 0.25;
	
	// put the flake in our main view
	[self.view addSubview:flakeView];
	
	[UIView beginAnimations:nil context:(__bridge void *)(flakeView)];
	// set up how fast the flake will fall
	[UIView setAnimationDuration:5 * speed];
	
	// set the postion where flake will move to
	flakeView.frame = CGRectMake(endX, 500.0, 25.0 * scale, 25.0 * scale);
	
	// set a stop callback so we can cleanup the flake when it reaches the
	// end of its animation
	[UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];

}
-(void)viewDidAppear:(BOOL)animated
{
    [((AppDelegate*)[[UIApplication sharedApplication]delegate]) aksInfoMessageFor:100 withMessage:@"1231231231231231231231231231231231231231231231231231231231312312312312312312312312312312312312312313123123123123123123123123123123123123123123123123123" withFontSize:15 ShowTextOnly:YES IsAnimationRequired:NO ClearPreviousMessages:YES ColorWithR:255 G:0 B:0 IsBlinking:NO IsWritingAnimation:YES Frame:CGRectMake(0, 20, self.view.bounds.size.width
                                                                                                                                                                                                                                                                            , self.view.bounds.size.height
)];

}
- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	
	UIImageView *flakeView = (__bridge UIImageView *)(context);
	[flakeView removeFromSuperview];
	// open the debug log and you will see that all flakes have a retain count
	// of 1 at this point so we know the release below will keep our memory
	// usage in check
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
