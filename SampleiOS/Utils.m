//
//  Utils.m
//  SampleiOS
//
//  Created by test on 10/24/13.
//
//

#import "Utils.h"
#include <objc/runtime.h> @encode(int)
@implementation Utils



- (NSDictionary *) convertIDtoNSDictionary:(id)oID
{
    NSLog(@"Properties Value: %@ ", oID);
    NSMutableDictionary *propertyDetails = [NSMutableDictionary dictionaryWithCapacity:0];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([oID class], &outCount);
    for(i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:[NSString defaultCStringEncoding]];
        id propertyValue = [oID valueForKey:propertyName];
        [propertyDetails setValue:propertyValue forKey:propertyName];
    }
    
    return propertyDetails;
}

/*
- (NSString *) convertIDtoNSString:(id)oID
{
    int a = 4;
    
    //oID = a;
    
    
    NSMutableString *sResult = [NSMutableString stringWithCapacity:0];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([oID class], &outCount);
    if (outCount > 0) {
        NSLog(@"have details");
    }
    for(i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:[NSString defaultCStringEncoding]];
        NSString *propertyType = [NSString stringWithCString:getPropertyType(property) encoding:[NSString defaultCStringEncoding]];
        
        if ([propertyType isEqualToString:@"float"]) {
            float fVar;
            id propertyValue = [oID valueForKey:propertyName];
            fVar = [propertyValue floatValue];
            [sResult appendFormat:@"%@: %1.2f ",propertyName, fVar];
        }        
        else if ([propertyType isEqualToString:@"char"]) {
            id propertyValue = [oID valueForKey:propertyName];
            char *cVar = [propertyValue charValue];
            [sResult appendFormat:@"%@: %s ",propertyName, cVar];
        }
        else if ([propertyType isEqualToString:@"int"]) {
            id propertyValue = [oID valueForKey:propertyName];
            int iVar = [propertyValue charValue];
            [sResult appendFormat:@"%@: %d ",propertyName, iVar];
        }
        else if ([propertyType isEqualToString:@"unsigned int"]) {
            id propertyValue = [oID valueForKey:propertyName];
            unsigned int uiVar = [propertyValue unsignedIntValue];
            [sResult appendFormat:@"%@: %u ",propertyName, uiVar];
        }
        else if ([propertyType isEqualToString:@"double"]) {
            id propertyValue = [oID valueForKey:propertyName];
            double dVar = [propertyValue doubleValue];
            [sResult appendFormat:@"%@: %f ",propertyName, dVar];
        }
        else if ([propertyType isEqualToString:@"short"]) {
            id propertyValue = [oID valueForKey:propertyName];
            short shVar = [propertyValue shortValue];
            [sResult appendFormat:@"%@: %hd ",propertyName, shVar];
        }
        else if ([propertyType isEqualToString:@"long"]) {
            id propertyValue = [oID valueForKey:propertyName];
            long lVar = [propertyValue longValue];
            [sResult appendFormat:@"%@: %ld ",propertyName, lVar];
        }
        else if ([propertyType isEqualToString:@"long long"]) {
            id propertyValue = [oID valueForKey:propertyName];
            long long llVar = [propertyValue longValue];
            [sResult appendFormat:@"%@: %lld ",propertyName, llVar];
        }
        else if ([propertyType isEqualToString:@"id"]) {
            id propertyValue = [oID valueForKey:propertyName];
            [sResult appendFormat:@"%@: %@ ",propertyName, propertyValue];
        }
        else if ([propertyType isEqualToString:@"unsigned long long"]) {
            id propertyValue = [oID valueForKey:propertyName];
            unsigned long long ullVar = [propertyValue unsignedLongLongValue];
            [sResult appendFormat:@"%@: %llu ",propertyName, ullVar];
        }
        else
        {
            id propertyValue = [oID valueForKey:propertyName];
            [sResult appendFormat:@"%@: %@ ",propertyName, propertyValue];
        }
        
    }    
    return sResult;
}
*/
@end
