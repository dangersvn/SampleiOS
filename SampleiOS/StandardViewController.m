//
//  StandardViewController.m
//  SampleiOS
//
//  Created by test on 10/15/13.
//
//

#import "StandardViewController.h"
#include <objc/runtime.h>
#import "TableViewCellCustomize.h"
#import "PropertyTemplate.h"
#import "Utils.h"
@interface StandardViewController ()

@end

@implementation StandardViewController
@synthesize lblComment,oProperty,arrProperty,oControl,controlName,selectedPropName,selectedPropValue,tableview_ListProperties, tabbar;
CGPoint *pointTableView;

- (id) loadController:(Class)classType {
    NSString *className = NSStringFromClass(classType);
    UIViewController *controller = [[classType alloc] initWithNibName:className bundle:nil];
    return controller;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.controlName;
    [self CreateControl];
    [self LoadCommnent:_commnent];
    [self LoadProperties];
    
    [tabbar setDelegate:self];
    [tableview_ListProperties setDelegate:self];
    [tableview_ListProperties setDataSource:self];
}

- (void) CreateControl
{
}

- (void) LoadProperties
{
    self.oProperty = [[PropertyModel alloc]initWithControl:self.oControl];
    self.arrProperty = [self.oProperty getStandardProperties];
}

- (void) LoadCommnent: (NSString *)comment
{
    [lblComment setText:comment];
}

- (IBAction) tapButton:(id)sender
{
    [lblComment setText:@"Button Clicked!"];
    
}

-(void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [tableview_ListProperties setHidden:FALSE];
    
    if([[item title] isEqualToString:@"Properties"])
        [tableview_ListProperties setHidden:FALSE];
    else if ([[item title] isEqualToString:@"Add Items"])
        [tableview_ListProperties setHidden:TRUE];
}


//---------------Populating TableView Properties-------------------

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 59;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arrProperty count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int numOfDetailsProperty = [((PropertyTemplate *) [arrProperty objectAtIndex:section]).dictDetailsProperty count];
    if (numOfDetailsProperty > 0) {
        return numOfDetailsProperty;
    }
    else return  1;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TableViewCellCustomize";
    
    TableViewCellCustomize *cell = (TableViewCellCustomize *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
        if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCellCustomize" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    [cell.btn_Update addTarget:self action:@selector(tapButtonUpdate: withEvent:) forControlEvents:UIControlEventTouchUpInside];
    cell.btn_Update.tag = indexPath.section;
    
    int indexRow = indexPath.row;
    int indexSection = indexPath.section;
    
    PropertyTemplate *oTemplate = [arrProperty objectAtIndex:indexSection];
    NSString *sProName = oTemplate.propertyName;
    
    
    if ([oTemplate.dictDetailsProperty count] > 0)
    {
        NSArray *keys = [oTemplate.dictDetailsProperty allKeys];
        id aKey = [keys objectAtIndex:indexRow];
        id anObject = [oTemplate.dictDetailsProperty objectForKey:aKey];        
        
        [cell.lbl_PropertyName setText:(NSString* )aKey];
        [cell.txt_PropertyValue setText:[anObject isKindOfClass:[NSString class]] ? (NSString* )anObject : [anObject description]];
        if ([oTemplate.isEdited intValue] == 0)
        {
            [cell.txt_PropertyValue setUserInteractionEnabled:FALSE];
            [cell.btn_Update setHidden:TRUE];         
        }
        else
        {
            [cell.txt_PropertyValue setUserInteractionEnabled:TRUE];
            [cell.btn_Update setHidden:FALSE];
        }
    }
    else
    {
        //[cell.lbl_PropertyName setTextColor:[UIColor lightTextColor]];
        
        if (![oTemplate.propertyValue isKindOfClass:[NSString class]]) {
            NSString *des = [oTemplate.propertyValue description];
            cell.txt_PropertyValue.text = des;
        }
        else
        {
            cell.txt_PropertyValue.text = (NSString *)oTemplate.propertyValue;
        }
        if ([oTemplate.isEdited intValue] == 0)
        {
            [cell.txt_PropertyValue setUserInteractionEnabled:FALSE];
            [cell.btn_Update setHidden:TRUE];
        }
        else
        {
            [cell.txt_PropertyValue setUserInteractionEnabled:TRUE];
            [cell.btn_Update setHidden:FALSE];
        }
        
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [((PropertyTemplate *) [arrProperty objectAtIndex:section]) propertyName];
}

- (IBAction) tapButtonUpdate:(id)sender withEvent: (UIEvent *) event
{
    UIButton *btn = (UIButton *)sender;
    UITouch * touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView: self.tableview_ListProperties];
    NSIndexPath * indexPath = [self.tableview_ListProperties indexPathForRowAtPoint: location];
    TableViewCellCustomize *currentCell = [self.tableview_ListProperties cellForRowAtIndexPath:indexPath];
    
    PropertyTemplate *oTemplate = [arrProperty objectAtIndex:indexPath.section];
    NSString *sProVar = currentCell.txt_PropertyValue.text;
    //[oProperty doUpdateProperty:oTemplate.propertyValue withValue:sVar];
    
    //oProperty updateProperty:currentCell.lbl_PropertyName.text withValue:
    
    BOOL isUpdated = [oProperty doUpdateProperty:oTemplate withValue:sProVar];
    if (!isUpdated) {
        NSLog(@"Update property failed!");
    }    
}



-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    NSLog(@"Hide keyboard");
}

- (void)keyboardDidShow:(NSNotification *)note
{
    self.tableview_ListProperties.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end