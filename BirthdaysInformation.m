//
//  BirthdaysInformation.m
//  BirthdayTracker
//
//  Created by Alexey Sergeev on 4/26/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "BirthdaysInformation.h"

@implementation BirthdaysInformation

- (instancetype)initWithName:(NSString *)name Surname:(NSString *)surname andBirthdate:(NSDate *)birthdate {
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        self.birthdate = birthdate;
    }
    return  self;
}

@end
