//
//  EnumUtils.m
//  SampleiOS
//
//  Created by test on 10/18/13.
//
//

#import "EnumUtils.h"

#define arrEditedPropertiesType [NSArray arrayWithObjects: @"NONE",@"BOOLEAN",@"NSSTRING",@"CHAR",@"INT",@"FLOAT",@"DOUBLE",@"LONG", @"UNSIGNEDINT", nil]

#define arrPropertiesType [NSArray arrayWithObjects: @"NONE",@"BOOLEAN",@"NSSTRING",@"CHAR",@"INT",@"FLOAT",@"DOUBLE",@"LONG", @"UNSIGNEDINT", nil]

@implementation EnumUtils
-(enumPropertiesType) propertyTypeStringToEnum:(NSString*)strVal
{
    int retVal = 0;
    for(int i=0; i < [arrEditedPropertiesType count] -1; i++)
    {
        if([(NSString*)arrEditedPropertiesType[i] isEqualToString:[strVal uppercaseString]])
        {
            retVal = i;
            return (enumPropertiesType)retVal;
            break;
        }
    }
    return (enumPropertiesType)NONE;
}
@end

