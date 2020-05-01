//
//  AddingBirthdaysViewController.m
//  BirthdayTracker
//
//  Created by Alexey Sergeev on 4/26/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "AddingBirthdaysViewController.h"
#import "BirthdaysInformation.h"


@interface AddingBirthdaysViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *surname;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)saveButton:(id)sender;
- (IBAction)cancelButton:(id)sender;

@end

@implementation AddingBirthdaysViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self subscribeToKeyboardNotifications];

    
    self.datePicker.maximumDate = [NSDate date];
}
#pragma mark - Keyboard notification center
-(void)subscribeToKeyboardNotifications {
    
    [NSNotificationCenter.defaultCenter addObserver:self
                                        selector:@selector(keyboardWillShow:)
                                        name:UIKeyboardWillShowNotification
                                        object:nil];
    
    [NSNotificationCenter.defaultCenter addObserver:self
                                        selector:@selector(keyboardWilHide:)
                                        name:UIKeyboardWillHideNotification
                                        object:nil];
    
    
}

-(void)keyboardWillShow:(NSNotification*)notification {
    NSLog(@"work");
   

    
}

-(void)keyboardWilHide: (NSNotification*)notification {
    [self.scrollView setLargeContentImageInsets:UIEdgeInsetsZero];
}


- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(id)sender {
    NSString *firstName = self.name.text;
    NSString *lastName = self.surname.text;
    NSDate *date = self.datePicker.date;
    
    BirthdaysInformation *birthdayInit = [[BirthdaysInformation alloc]initWithName:firstName Surname:lastName andBirthdate:date];
    [self.birthdayDelegate addBirthdayViewController:self didAdd:birthdayInit];
  
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog( @"My  name is %@ %@ %@", birthdayInit.name, birthdayInit.surname, birthdayInit.birthdate);
    

}
@end
