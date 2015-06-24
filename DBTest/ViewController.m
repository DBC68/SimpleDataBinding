//
//  ViewController.m
//  DBTest
//
//  Created by David Colvin on 6/24/15.
//  Copyright (c) 2015 David Colvin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic) Person *per1;
@property (nonatomic) Person *per2;

@end

@implementation ViewController

//-------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerForDataBindingNotification];
}

//-------------------------------------------------------------------------
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.per1 = [Person new];
    self.per2 = [Person new];
    
    self.per1.name = @"David";
    self.per2.age = 42;

}

//-------------------------------------------------------------------------
- (void)propertyChanged:(NSNotification *)notification
{
    NSDictionary *dict = notification.userInfo;
    
    if([dict[kDataBindingObjectKey] isEqual:self.per2]) {
        
        NSLog(@"%@'s %@ was changed to %@.", dict[kDataBindingObjectKey], dict[kDataBindingPropertyKey], dict[kDataBindingValueKey]);
    }
}

@end
