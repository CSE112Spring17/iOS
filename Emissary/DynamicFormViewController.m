//
//  DynamicFormViewController.m
//  Emissary
//
//  Created by Aryaman Sharda on 6/5/17.
//  Copyright © 2017 Aryaman Sharda. All rights reserved.
//

#import "DynamicFormViewController.h"
#import "NSJSONSerialization+ANDYJSONFile.h"

#import "FORMTextField.h"
#import "FORMBackgroundView.h"
#import "FORMSeparatorView.h"
#import "FORMFieldValueLabel.h"
#import "FORMFieldValueCell.h"
#import "FORMGroupHeaderView.h"
#import "FORMFieldValuesTableViewHeader.h"
#import "FORMTextFieldCell.h"
#import "FORMButtonFieldCell.h"
#import "FORMBaseFieldCell.h"
#import "FORMTextField.h"

@interface DynamicFormViewController ()

@end

@implementation DynamicFormViewController
@synthesize dataSource = _dataSource;

- (FORMDataSource *)dataSource {
    if (_dataSource) return _dataSource;
    
    FORMLayout *layout = [FORMLayout new];
    [[FORMBaseFieldCell appearance] setHeadingLabelFont:[UIFont fontWithName:@"Futura-Medium" size:15.0]];
    //[[FORMBaseFieldCell appearance] setHeadingLabelTextColor:[[UIColor alloc] initWithHex:@"BBCEFF"]];
    
    [[FORMBackgroundView appearance] setBackgroundColor:[UIColor clearColor]];
    [[FORMBackgroundView appearance] setGroupBackgroundColor:[UIColor redColor]];
    
    [[FORMTextField appearance] setFont:[UIFont fontWithName:@"Futura-Medium" size:15.0]];
    //[[FORMTextField appearance] setTextColor:[[UIColor alloc] initWithHex:@"000000"]];
    [[FORMTextField appearance] setBorderWidth:2.0f];
    //[[FORMTextField appearance] setBorderColor:[[UIColor alloc] initWithHex:@"FFFFFF"]];
    [[FORMTextField appearance] setCornerRadius:20.0f];
    
    self.collectionView.collectionViewLayout = layout;
    
    NSArray *JSON = [NSJSONSerialization JSONObjectWithContentsOfFile:@"Form.json"];
    _dataSource = [[FORMDataSource alloc] initWithJSON:JSON
                                        collectionView:self.collectionView
                                                layout:layout
                                                values:nil
                                              disabled:NO];
    
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
    UIBarButtonItem *validateButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Validate"
                                                                           style:UIBarButtonItemStyleDone
                                                                          target:self
                                                                          action:@selector(validateButtonAction)];
}

@end
