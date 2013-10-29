//
//  ButtonViewController.m
//  SampleiOS
//
//  Created by test on 10/29/13.
//
//

#import "ButtonViewController.h"
#import "LibControl.h"
@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
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
    super.commnent = @"User can edit...";
    [super viewDidLoad];
}

- (void) CreateControl
{
    LibControl *oLib = [[LibControl alloc]init];
    UIButton *btnTest = [oLib createButton];
    [self.view addSubview:btnTest];
    self.oControl = btnTest;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
