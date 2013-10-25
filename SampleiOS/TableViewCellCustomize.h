//
//  TableViewCellCustomize.h
//  SampleiOS
//
//  Created by test on 10/22/13.
//
//

#import <UIKit/UIKit.h>

@interface TableViewCellCustomize : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_PropertyName;
@property (weak, nonatomic) IBOutlet UITextField *txt_PropertyValue;
@property (weak, nonatomic) IBOutlet UIButton *btn_Update;
@property UIView *temp;

@end
