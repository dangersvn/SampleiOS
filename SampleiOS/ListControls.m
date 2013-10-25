//
//  ListControls.m
//  SampleiOS
//
//  Created by hai dang on 10/14/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ListControls.h"

@implementation ListControls
@synthesize arrControls;

- (NSMutableArray *) createListControls:(NSString *)sdkVersion
{
    if(arrControls == nil)
        arrControls = [[NSMutableArray alloc] init];
    if([sdkVersion isEqualToString:@"SDK 6.0"])
    {
        [arrControls addObject:@"UIButton"];
        [arrControls addObject:@"UIImage"];
        [arrControls addObject:@"UISwitch"];
        [arrControls addObject:@"UISegment"];
        [arrControls addObject:@"UIAlertView"];
        [arrControls addObject:@"UIDatePicker"];
    }
    else
    {
        [arrControls addObject:@"Null"];        
    }
    return arrControls;
}    

@end
