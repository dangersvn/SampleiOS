//
//  PropertiesViewController.h
//  SampleiOS
//
//  Created by test on 10/17/13.
//
//

#import <UIKit/UIKit.h>

@interface PropertiesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableview_ListProperties;

@end
