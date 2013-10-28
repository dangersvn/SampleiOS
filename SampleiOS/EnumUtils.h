//
//  EnumUtils.h
//  SampleiOS
//
//  Created by test on 10/18/13.
//
//

#import <Foundation/Foundation.h>
typedef enum
{
    NONE,
    BOOLEAN,
    NSSTRING,
    CHAR,
    INT,
    FLOAT,
    DOUBLE,
    LONG,
    UNSIGNEDINT,
    
} enumEditedPropertiesType;

@interface EnumUtils : NSObject
-(enumEditedPropertiesType) propertyTypeStringToEnum:(NSString*)strVal;

@end



