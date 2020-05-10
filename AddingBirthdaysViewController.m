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
    self.scrollView.delegate = self;
    
    self.datePicker.maximumDate = [NSDate date];
    
    self.name.delegate = self;
    self.surname.delegate = self;
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
   CGRect keyboardRect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [self.scrollView setContentInset:UIEdgeInsetsMake(0, 0, keyboardRect.size.height + self.datePicker.safeAreaInsets.bottom + 370, 0)];
}

-(void)keyboardWilHide: (NSNotification*)notification {
    [self.scrollView setContentInset:UIEdgeInsetsZero];
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
    
}


#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *validationSet = [[NSCharacterSet letterCharacterSet] invertedSet];
    
       NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
       
             if (components.count > 1 ) {
                 return NO;
             }
    
    
    return YES;
}
@end
