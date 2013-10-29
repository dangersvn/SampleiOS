//
//  ViewManageControls.m
//  SampleiOS
//
//  Created by hai dang on 10/14/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewManageControls.h"
#import "ListControls.h"
#import "StandardViewController.h"
#import "ButtonViewController.h"
@interface ViewManageControls ()
@end


@implementation ViewManageControls
@synthesize tableview_ListControls;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableview_ListControls setDelegate:self];
    [self.tableview_ListControls setDataSource:self];
    [self loadData];    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) loadData
{
    ListControls *oListControl = [[ListControls alloc]init];    
    arrListControl = [oListControl createListControls:@"SDK 6.0"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
        
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arrListControl count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    int row = [indexPath row];
    
    NSString *record = [arrListControl objectAtIndex:row];
    cell.text = record;
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toStandardControl"]) {
        //ButtonViewController *destination = [segue destinationViewController];
        //StandardViewController *destination = [segue destinationViewController];
        //ButtonViewController *buttonViewController = [destination loadController:[ButtonViewController class]];
        
        //destination.controlName = selectedControlName;
        //destination
        //ButtonViewController *des = [segue destinationViewController];
        //des.controlName = selectedControlName;
        
        //targetVC.string1 = string1;
        
    
               // UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        
        
        		
       /* ButtonViewController *red = (ButtonViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"StandardViewController"];*/
        
        //ButtonViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"StandardViewController"];
        
        
      //  [self presentViewController:vc animated:YES completion:nil];
        //[vc setValue:@"ButtonViewController" forKey:@"customClass"];
        
       // ButtonViewController *targetVC = (ButtonViewController*)vc
        //[targetVC CreateControl];
        
        
        
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    int row = [indexPath row];
    NSString *record = [arrListControl objectAtIndex:row];
    selectedControlName = record;
    [self performSegueWithIdentifier:@"toStandardControl" sender:self];
    
    
    
    
   /* UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    ButtonViewController *viewController = [[ButtonViewController alloc]init];
    viewController = (ButtonViewController *)[storyboard instantiateViewControllerWithIdentifier:@"StandardViewController"];
    [self presentViewController:viewController animated:YES completion:nil];
    */
   
    //ButtonViewController *buttonController = [[ButtonViewController alloc] init];
    //[self presentViewController:buttonController animated:YES completion:nil];    
}



@end
