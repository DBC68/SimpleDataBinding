//
//  Person.m
//  DBTest
//
//  Created by David Colvin on 6/24/15.
//  Copyright (c) 2015 David Colvin. All rights reserved.
//

#import "Person.h"

#import <objc/objc-runtime.h>

@implementation Person

//-------------------------------------------------------------------------
- (void)setName:(NSString *)name
{
    [self newValue:name forObject:self];
        
    _name = name;
}

//-------------------------------------------------------------------------
- (void)setAge:(NSInteger)age
{
    
    [self newValue:[NSNumber numberWithInteger:age] forObject:self];
    
    _age = age;
}

@end
