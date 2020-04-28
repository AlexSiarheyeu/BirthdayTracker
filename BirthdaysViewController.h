//
//  BirthdaysViewController.h
//  BirthdayTracker
//
//  Created by Alexey Sergeev on 4/26/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BirthdaysInformation.h"
#import "AddingBirthdaysViewController.h"


NS_ASSUME_NONNULL_BEGIN



@interface BirthdaysViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AddingBirthdaysViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
