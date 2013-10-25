//
//  PropertyModel.m
//  SampleiOS
//
//  Created by test on 10/15/13.
//
//

#import "PropertyModel.h"
#include <objc/runtime.h>
#import "PropertyTemplate.h"
#include "EnumUtils.h"
#import "ListControls.h"
@implementation PropertyModel
@synthesize oControl,arrProperties,propertyTemplate;

- (id)initWithControl:(UIControl *)paramControl
{
    if(self = [super init])
        oControl = paramControl;
    return self;
}


- (NSMutableArray *) getStandardProperties
{
    NSMutableArray *arrProperties = [[NSMutableArray alloc]init];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([oControl class], &outCount);
    for(i = 0; i < outCount; i++) {
        propertyTemplate = [[PropertyTemplate alloc] init];
        objc_property_t property = properties[i];
        const char *attributes = property_getAttributes(property);
        
        const char *propName = property_getName(property);
        
        if(propName) {
            const char *propType = getPropertyType(property);
            NSString *propertyName = [NSString stringWithCString:propName
                                                        encoding:[NSString defaultCStringEncoding]];
            propertyTemplate.propertyName = propertyName;
            NSString *propertyType = [NSString stringWithCString:propType encoding:[NSString defaultCStringEncoding]];
            propertyTemplate.propertyType = propertyType;
            //Check if property isEdited or not
            if ([self isEditedField:propertyType])
            {
                char *readonly = property_copyAttributeValue(property, "R");
                if(readonly)
                    propertyTemplate.isEdited = [NSNumber numberWithInt:0];
                else
                    propertyTemplate.isEdited = [NSNumber numberWithInt:1];
            }
            else propertyTemplate.isEdited = [NSNumber numberWithInt:0];
            
            //propertyTemplate.isEnum = [NSNumber numberWithInt:1];
            
            /*
             if([self isEditedField:propertyType])
             {
             lst = getEnum(obj);
             if (lst != null) {
             if (lst.size() > 0) {
             oTmp._ProValue = lst;
             oTmp._IsEnum = true;
             } else {
             oTmp._ProValue = "";
             }
             } else {
             oTmp._ProValue = val;
             }
             
             
             propertyTemplate.isEdited = [NSNumber numberWithInt:1];
             
             id propValue = [oControl valueForKey:propertyName];
             propertyTemplate.propertyValue = propValue;
             }
             else
             {
             id propValue = [oControl valueForKey:propertyName];
             propertyTemplate.propertyValue = propValue;
             } */
            id propValue = [oControl valueForKey:propertyName];
            //get hierachical properties
            propertyTemplate.propertyValue = propValue;

            
            //NSLog(@"Value: %@", propValue);
            [arrProperties addObject:propertyTemplate];
        }
    }
    free(properties);
    
    return arrProperties;
}

- (NSMutableArray *) getEnum:(id) oVal withProperty: (NSString *) propertyType
{
    if (oVal == nil) {
        return nil;
    }
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    EnumUtils *oUtil = [[EnumUtils alloc]init];
    
    enumPropertiesType enu = [oUtil propertyTypeStringToEnum:propertyType];
    
    return nil;
}


const char* getPropertyType(objc_property_t property)
{
    const char *attributes = property_getAttributes(property);
    NSLog(@"%s", attributes);
    const char *propName = property_getName(property);
    
    //NSLog(@"attribute: %s Name: %s",attributes,propName);
    
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL)
    {
        if (attribute && strlen(attribute) > 3 && attribute[0] == 'T')
        {
            NSUInteger i = strlen(attribute) - 4;
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:i] bytes];
        }
        if(strlen(attribute) == 2)
        {
            //parse int, long, float, double
            if([@"Ti" isEqualToString: @(attribute) ]) return "int";
            else if ([@"TI" isEqualToString: @(attribute)]) return "unsigned int";
            else if ([@"Td" isEqualToString: @(attribute)]) return "double";
            else if ([@"Tf" isEqualToString: @(attribute)]) return "float";
            else if ([@"Tl" isEqualToString: @(attribute)]) return "long";
            else if ([@"Tq" isEqualToString: @(attribute)]) return "long long";
            else if ([@"TQ" isEqualToString: @(attribute)]) return "unsigned long long";
            else if ([@"Ts" isEqualToString: @(attribute)]) return "short";
            else if ([@"Tc" isEqualToString: @(attribute)]) return "char";
            else if ([@"T@" isEqualToString: @(attribute)]) return "id";
            
        }
    }
    return "@";
}

-(BOOL) isEditedField:(NSString *)propertyType
{
    BOOL isEdited = FALSE;
    if ([propertyType isEqualToString:@"@"] || [propertyType isEqualToString:@""] || propertyType==nil)
        return isEdited;
    EnumUtils *oUtil = [[EnumUtils alloc]init];
    
    enumPropertiesType enu = [oUtil propertyTypeStringToEnum:propertyType];
    switch (enu) {
        case INT:
            return TRUE;
        case BOOLEAN:
            return TRUE;
        case CHAR:
            return TRUE;
        case NSSTRING:
            return TRUE;
        case FLOAT:
            return TRUE;
        case DOUBLE:
            return TRUE;
        case LONG:
            return TRUE;
        case UNSIGNEDINT:
            return TRUE;
        case NSLINEBREAKMODE:
            return TRUE;
    }
    return FALSE;
}


- (BOOL)updateProperty:(NSString *)propertyName withValue:(id)propertyValue
{
    @try {
        if ([propertyName isEqualToString:@""] || propertyValue == nil) {
            NSLog(@"[SampleIOS] updateProperty return FALSE");
            return FALSE;
        }
        else{
            // check if property value is enum, struct, boolean,..... and cast propertyValue to..
            [oControl setValue:propertyValue forKey:propertyName];
        }
        return TRUE;
    }
    @catch (NSException *exception) {
        NSLog(@"[SampleIOS] Exception: %@", exception);
        return FALSE;
    }
    @finally {
        NSLog(@"finally");
        return FALSE;
    }
}
@end
