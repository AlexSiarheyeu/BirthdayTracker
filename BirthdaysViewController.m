//
//  BirthdaysViewController.m
//  BirthdayTracker
//
//  Created by Alexey Sergeev on 4/26/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "BirthdaysViewController.h"
#import "BirthdaysInformation.h"
#import "AddingBirthdaysViewController.h"

@interface BirthdaysViewController ()

@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong) NSMutableArray<BirthdaysInformation*>* dataSource;
@property(nonatomic, strong) BirthdaysInformation* birthdays;


@end

@implementation BirthdaysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    
}

-(void)setupViews {
    
    self.navigationItem.title = @"Birthdays list";
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Add"
                                            style:UIBarButtonItemStylePlain
                                            target:self
                                            action:@selector(addBirthdayButton)];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    // Setup Table View
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
    
    
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MMMM d, EEEE, YYYY"];
    
    cell.textLabel.text = [self.birthdays.name stringByAppendingString:self.birthdays.surname];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:self.birthdays.birthdate];
    
    return cell;
}

#pragma mark - Handlers

-(void)addBirthdayButton {
    [self performSegueWithIdentifier:@"add" sender:self];
}





@end