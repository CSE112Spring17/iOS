//
//  FormViewController.h
//  Emissary
//
//  Created by Aryaman Sharda on 6/15/17.
//  Copyright © 2017 Aryaman Sharda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormViewController.h"

@interface FormViewController : XLFormViewController

@property (nonatomic,retain) NSArray *listOfTemplates;
@property int indexPath;

@end
