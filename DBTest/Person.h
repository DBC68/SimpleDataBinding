//
//  Person.h
//  DBTest
//
//  Created by David Colvin on 6/24/15.
//  Copyright (c) 2015 David Colvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+DataBinding.h"

@interface Person : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger age;

@end
