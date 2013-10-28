//
//  PropertyModel.h
//  SampleiOS
//
//  Created by test on 10/15/13.
//
//

#import <Foundation/Foundation.h>
#import "PropertyTemplate.h"
#import "EnumUtils.h"
@interface PropertyModel : NSObject
@property PropertyTemplate *propertyTemplate;
@property UIControl *oControl;
@property NSMutableArray *arrProperties;
@property EnumUtils *oEnumUtils;

- (id)initWithControl:(UIControl *) paramControl;
- (NSMutableArray *) getStandardProperties;
- (NSMutableArray *) getExtendProperties;
- (BOOL) doUpdateProperty:(PropertyTemplate *)oTemplateProperty withValue:(NSString *)sProValue;
@end
