//
//  StandardViewController.h
//  SampleiOS
//
//  Created by test on 10/15/13.
//
//

#import <UIKit/UIKit.h>
#import "PropertyModel.h"
@interface StandardViewController : UIViewController<UITabBarDelegate, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
{
   // UIButton * btnTest;
    //PropertyModel *oProperty;
   /// UIControl *_oControl;
}
@property(assign,nonatomic) NSString *controlName;
@property(assign,nonatomic) IBOutlet UILabel *lblComment;
@property(assign,nonatomic) UIControl *oControl;
@property(strong,nonatomic) PropertyModel *oProperty;
@property(strong, nonatomic) NSMutableArray *arrProperty;
@property NSString *selectedPropName;
@property NSString *selectedPropValue;
@property NSString *commnent;
@property(strong, nonatomic) IBOutlet UITableView *tableview_ListProperties;
@property (strong, nonatomic) IBOutlet UITabBar *tabbar;

- (id) loadController: (Class)classType;

- (void) CreateControl;
- (void) LoadCommnent:(NSString *)comment;
- (IBAction) tapButton:(id)sender;
- (IBAction) tapLabelButton:(id)sender;

- (IBAction) tapButtonUpdate:(id)sender withEvent: (UIEvent *) event; 
- (void)LoadProperties;
@end
