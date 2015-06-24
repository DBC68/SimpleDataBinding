//
//  NSObject+DataBinding.m
//  DBTest
//
//  Created by David Colvin on 6/24/15.
//  Copyright (c) 2015 David Colvin. All rights reserved.
//

#import "NSObject+DataBinding.h"

#define kDataBindingNotification @"DB_NOTIFICATION"

@implementation NSObject (DataBinding)

//-------------------------------------------------------------------------
- (void)registerForDataBindingNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(propertyChanged:)
                                                 name:kDataBindingNotification
                                               object:nil];
}

//-------------------------------------------------------------------------
- (void)newValue:(id)value forObject:(id)object
{
    
    if(!value)
        [NSException raise:NSInternalInconsistencyException format:@"value is required"];
    
    if(!object)
        [NSException raise:NSInternalInconsistencyException format:@"object is required"];
    
    //Get name of setter that called this method
    NSString *sourceString = [[NSThread callStackSymbols] objectAtIndex:1];
    
    NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
    [array removeObject:@""];

    NSString *setter = [array objectAtIndex:4];
    
    if(![setter hasPrefix:@"set"])
        [NSException raise:NSInternalInconsistencyException format:@"%@ only works in a setter!.", NSStringFromSelector(_cmd)];
    else {
        
        NSString *method = [setter stringByReplacingOccurrencesOfString:@"set" withString:@""];
        NSString *first = [[method substringToIndex:1] lowercaseString];
        NSString *prop = [method stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:first];
        prop = [prop substringToIndex:[prop length] - 1];
        
        NSDictionary *userInfo = @{kDataBindingObjectKey:object, kDataBindingValueKey:value, kDataBindingPropertyKey:prop};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kDataBindingNotification object:nil userInfo:userInfo];
    }
}

//-------------------------------------------------------------------------
- (void)propertyChanged:(NSNotification *)notification {
    
    [NSException raise:NSInternalInconsistencyException format:@"Subclasses must override %@", NSStringFromSelector(_cmd)];
}

@end
