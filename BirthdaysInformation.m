//
//  BirthdaysInformation.m
//  BirthdayTracker
//
//  Created by Alexey Sergeev on 4/29/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "BirthdaysInformation.h"

@implementation BirthdaysInformation

- (instancetype)initWithName:(NSString *)name Surname:(NSString *)surname andBirthdate:(NSDate *)birthdate {
    self = [super init];
    if (self) {
        _name = name;
        _surname = surname;
        _birthdate = birthdate;
    }
    return  self;
}



@end
