//
//  TemplateListTableViewController.m
//  Emissary
//
//  Created by Aryaman Sharda on 6/15/17.
//  Copyright © 2017 Aryaman Sharda. All rights reserved.
//

#import "TemplateListTableViewController.h"
#import "FormViewController.h"

@interface TemplateListTableViewController ()

@end

@implementation TemplateListTableViewController
{
    NSMutableArray *dataSet;
    NSArray *jsonArray;
    NSInteger index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSet = [[NSMutableArray alloc] init];
    self.companyName = @"5941497414a3f8bd1a4776f9";
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://35.185.226.210/api/form/template/company/%@", self.companyName]]];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
    
    NSError *err;
    NSURLResponse *response;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&response error:&err];
    
    //You need to check response.Once you get the response copy that and paste in ONLINE JSON VIEWER.If you do this clearly you can get the correct results.
    
    //After that it depends upon the json format whether it is DICTIONARY or ARRAY
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
    NSLog(@"Response: %@", jsonArray);
    
    for(NSDictionary *item in jsonArray) {
        NSLog(@"Item: %@", [item objectForKey:@"name"]);
        [dataSet addObject:[item objectForKey:@"name"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"templateSelected"])
    {
        FormViewController *vc = [segue destinationViewController];
        //[vc setListOfTemplates:     jsonArray];
        //vc.indexPath = (int)index;
    }
    
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    index = indexPath.row;
    [self performSegueWithIdentifier:@"templateSelected" sender:nil];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"FORMS"; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataSet count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if ([[dataSet objectAtIndex:indexPath.row] isEqualToString:@"hi"]) {
        cell.textLabel.text = @"UC San Diego Appointment";
    } else {
        cell.textLabel.text = [dataSet objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
