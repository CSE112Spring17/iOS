//
//  LoginViewController.m
//  Slicerr
//
//  Created by Aryaman Sharda on 4/25/17.
//  Copyright © 2017 Aryaman Sharda. All rights reserved.
//

#import "LoginViewController.h"
#import "TemplateListTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    txtUsername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"    Username" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"    Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self login];
}

-(void)login {
    NSString *post = [NSString stringWithFormat:@"email=%@&password=%@",txtUsername.text , txtPassword.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://35.185.226.210/api/employees/login"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
     
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn) {
         NSLog(@"Connection Successful");
        
        NSError *error = nil;
         NSURLResponse *response = [[NSURLResponse alloc] init];
         NSData * data = [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:&response
                                                          error:&error];
        
        if (error == nil)
        {
            // Parse data here
            NSLog(@"Response: %@", response);
            NSLog(@"Data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if ((long)[httpResponse statusCode] == 200) {
                NSLog(@"User successfully signed in.");
                [self performSegueWithIdentifier:@"loginSuccessful" sender:nil]; 
            }
        } else {
            NSLog(@"ERROR: %@", [error description]);
            [self performSegueWithIdentifier:@"loginSuccessful" sender:nil];
        }
    } else {
         NSLog(@"Connection could not be made");
    }
}

-(IBAction)signIn:(id)sender {
    [self login]; 
}
     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"loginSuccessful"])
    {
        TemplateListTableViewController *vc = [segue destinationViewController];
        vc.companyName = @"5941497414a3f8bd1a4776f9";
    }

}

@end
