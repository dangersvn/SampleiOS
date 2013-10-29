//
//  LibControl.m
//  SampleiOS
//
//  Created by test on 10/29/13.
//
//

#import "LibControl.h"

@implementation LibControl

-(UIButton *)createButton
{
    UIButton *btnTest = [[UIButton alloc] init];
    UIFont *oFont = [UIFont fontWithName:@"Helvetica" size:21];
    [btnTest setFont:oFont];
    [btnTest setBackgroundColor:[UIColor redColor]];
    [btnTest setTitle:@"Button Test" forState:UIControlStateNormal];
    btnTest.frame = CGRectMake(0, 0, 100, 50);
    [btnTest addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnTest setTintColor:[UIColor blueColor]];
    btnTest.showsTouchWhenHighlighted = YES;
    return btnTest;
}
@end
