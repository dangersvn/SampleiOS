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
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void) CreateControl
{
   // UITextField *text = [[UITextField alloc] init];
    UIButton *btnTest = [[UIButton alloc] init];
//    UIButton *btnTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [btnTest setFont:[UIFont fontWithName:@"American Typewriter" size:18]];
    [btnTest setBackgroundColor:[UIColor redColor]];
    [btnTest setTitle:@"Button Test" forState:UIControlStateNormal];
    btnTest.frame = CGRectMake(0, 0, 100, 50);
    [btnTest addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchDown];
    [btnTest setTintColor:[UIColor blueColor]];
        
    [self.view addSubview:btnTest];    
    self.oControl = btnTest;
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([oControl class], &outCount);
    for (int i =0; i < outCount; i++) {
        objc_property_t property = properties[i];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.controlName;
    [self CreateControl];
    [tabbar setDelegate:self];
    [tableview_ListProperties setDelegate:self];
    [tableview_ListProperties setDataSource:self];
}

- (void) viewWillAppear:(BOOL)animated
{   
    self.oProperty = [[PropertyModel alloc]initWithControl:self.oControl];    
    self.arrProperty = [self.oProperty getStandardProperties];
}

- (void) LoadCommnent: (NSString *)comment
{
    [lblComment setText:comment];
}

- (IBAction) tapButtonUpdate:(id)sender
{
    selectedPropName = @"isEnable"; //Example property name
    selectedPropValue = @"1";
    
    
}

- (IBAction) tapButton:(id)sender
{
    [lblComment setText:@"Button Clicked!"];
    
}

-(void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
   // NSLog(@"Tab selected");
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
    int indexRow = indexPath.row;
    int indexSection = indexPath.section;
    
    PropertyTemplate *oTemplate = [arrProperty objectAtIndex:indexSection];
    NSString *sProName = oTemplate.propertyName;
    NSString *sProValue = @"";
    
    
    if ([oTemplate.dictDetailsProperty count] > 0)
    {
        //NSLog(@"DictDetailsProperty Count > 0");
        NSLog(@"Number of Row in Section-%d is: %d",indexSection,indexRow);
        NSArray *keys = [oTemplate.dictDetailsProperty allKeys];
        id aKey = [keys objectAtIndex:indexRow];
        id anObject = [oTemplate.dictDetailsProperty objectForKey:aKey];        
        
        [cell.lbl_PropertyName setText:[aKey isKindOfClass:[NSString class]] ? (NSString* )aKey : @"Pro Name is not NSString"];
        [cell.txt_PropertyValue setText:[anObject isKindOfClass:[NSString class]] ? (NSString* )anObject : @"ProValue not NSString"];
    }
    else
    {
        cell.lbl_PropertyName.text = sProName;
        [cell.lbl_PropertyName setTextColor:[UIColor lightTextColor]];
        
        if (![oTemplate.propertyValue isKindOfClass:[NSString class]]) {
            cell.txt_PropertyValue.text = @"It's not NSString";
        }
        else
        {
            //NSLog(@"%@", oTemplate.propertyValue);
            cell.txt_PropertyValue.text = (NSString *)oTemplate.propertyValue;
        }
        if ([oTemplate.isEdited intValue] == 0)
            [cell.btn_Update setHidden:TRUE];
        
    }    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end