//
//  PropertyTemplate.h
//  SampleiOS
//
//  Created by test on 10/17/13./Volumes/D/SVN/Temp/SWT_Sample/src/Behavior/Properties.java
//
//

#import <Foundation/Foundation.h>

@interface PropertyTemplate : NSObject
@property NSString *propertyName;
@property id propertyValue;
@property NSString *propertyType;
@property NSNumber *isEdited;
@property NSNumber *isEnum;
@property NSDictionary *dictDetailsProperty;
@end
