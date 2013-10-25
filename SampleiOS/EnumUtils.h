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
    UILABEL,
    NSLINEBREAKMODE,
    
} enumPropertiesType;

@interface EnumUtils : NSObject
-(enumPropertiesType) propertyTypeStringToEnum:(NSString*)strVal;

@end



