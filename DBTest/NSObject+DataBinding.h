//
//  NSObject+DataBinding.h
//  DBTest
//
//  Created by David Colvin on 6/24/15.
//  Copyright (c) 2015 David Colvin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDataBindingObjectKey @"DB_OBJECT"
#define kDataBindingPropertyKey @"DB_PROPERTY"
#define kDataBindingValueKey @"DB_VALUE"

@interface NSObject (DataBinding)

- (void)registerForDataBindingNotification;

- (void)newValue:(id)value forObject:(id)object;

- (void)propertyChanged:(NSNotification *)notification;


@end
