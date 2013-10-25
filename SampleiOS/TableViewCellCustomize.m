//
//  TableViewCellCustomize.m
//  SampleiOS
//
//  Created by test on 10/22/13.
//
//

#import "TableViewCellCustomize.h"

@implementation TableViewCellCustomize
@synthesize btn_Update=_btn_Update;
@synthesize txt_PropertyValue = _txt_PropertyValue;
@synthesize lbl_PropertyName = _lbl_PropertyName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
