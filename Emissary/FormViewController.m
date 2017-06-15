//
//  FormViewController.m
//  Emissary
//
//  Created by Aryaman Sharda on 6/15/17.
//  Copyright © 2017 Aryaman Sharda. All rights reserved.
//

#import "FormViewController.h"
#import "XLForm.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {    
        [self initializeForm];
    }
    return self;
}

- (void)initializeForm {
    

    
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Omni Form"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Title
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"title" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Title" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // Location
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"location" rowType:XLFormRowDescriptorTypeText];
    [row.cellConfigAtConfigure setObject:@"Location" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // Second Section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // All-day
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"all-day" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"All-day"];
    [section addFormRow:row];
    
    // Starts
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"starts" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Starts"];
    row.value = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
    [section addFormRow:row];
    
    XLFormRowDescriptor * buttonRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"button" rowType:XLFormRowDescriptorTypeButton title:@"Save"];
    buttonRow.action.formSelector = @selector(savePressed:);
    [section addFormRow:buttonRow];
    
    self.form = form;
    
    //NSLog(@"Loading form from template %d", _indexPath);
}


-(IBAction)savePressed:(id)sender
{
    NSLog(@"Saved pressed.");
}

@end
