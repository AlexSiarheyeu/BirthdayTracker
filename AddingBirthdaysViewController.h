//
//  AddingBirthdaysViewController.h
//  BirthdayTracker
//
//  Created by Alexey Sergeev on 4/26/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BirthdaysInformation.h"

NS_ASSUME_NONNULL_BEGIN


@protocol AddingBirthdaysViewControllerDelegate;


@interface AddingBirthdaysViewController : UIViewController <UIScrollViewDelegate>

@property(weak, nonatomic) id <AddingBirthdaysViewControllerDelegate> birthdayDelegate;

@end


@protocol AddingBirthdaysViewControllerDelegate
@required
-(void)addBirthdayViewController: (AddingBirthdaysViewController*) addingToViewController
                          didAdd: (BirthdaysInformation*)birthdayInfo;

@end

NS_ASSUME_NONNULL_END
