//
//  ListControls.h
//  SampleiOS
//
//  Created by hai dang on 10/14/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListControls : NSObject
@property NSMutableArray *arrControls;
- (NSMutableArray *) createListControls:(NSString *) sdkVersion;
@end
