//
//  ViewManageControls.h
//  SampleiOS
//
//  Created by hai dang on 10/14/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListControls.h"
@interface ViewManageControls : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    ListControls *oListControl;
    NSMutableArray *arrListControl;
    NSString *selectedControlName;
}
@property(weak, nonatomic) IBOutlet UITableView *tableview_ListControls;
@end
