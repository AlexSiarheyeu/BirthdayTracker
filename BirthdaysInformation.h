//
//  BirthdaysInformation.h
//  BirthdayTracker
//
//  Created by Alexey Sergeev on 4/26/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BirthdaysInformation : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* surname;
@property(nonatomic, strong) NSDate* birthdate;

-(instancetype)initWithName: (NSString*)name Surname:(NSString*)surname andBirthdate:(NSDate*)birthdate;


@end

NS_ASSUME_NONNULL_END
