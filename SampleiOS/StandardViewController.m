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
    UITextField *text = [[UITextField alloc] init];
    //UIButton *btnTest = [[UIButton alloc] init];
    UIButton *btnTest = [UIButton buttonWithType:UIButtonTypeRoundedRect]
    
    [btnTest setFont:[[UIFont alloc]init]];
    [btnTest setBackgroundColor:[UIColor redColor]];
    [btnTest setTitle:@"Button Test" forState:UIControlStateNormal];
    btnTest.frame = CGRectMake(0, 0, 100, 50);
    [btnTest addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchDown];
    [btnTest setTintColor:[UIColor blueColor]];
        
    [self.view addSubview:btnTest];    
    self.oControl = btnTest;
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
    NSLog(@"Tab selected");
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (arrProperty == nil) {
        NSLog(@"arrProperty is NULL");
    }
    return [arrProperty count];
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
    
    PropertyTemplate *oTemplate = [arrProperty objectAtIndex:indexRow];
    NSString *sProName = oTemplate.propertyName;
    NSString *sProValue = @"";
    if (![oTemplate.propertyType isEqualToString:@"NSString"])
    {
        Utils *oUtil = [[Utils alloc]init];
        sProValue = [oUtil convertIDtoNSString:oTemplate.propertyValue];
    }
    else sProValue = oTemplate.propertyValue;
    
    NSLog(@"SProValue: %@", sProValue);
    cell.lbl_PropertyName.text = sProName;
    [cell.lbl_PropertyName setTextColor:[UIColor lightTextColor]];
    cell.txt_PropertyValue.text = sProValue;
    
    if ([oTemplate.isEdited intValue] == 0)
        [cell.btn_Update setHidden:TRUE];
    return cell;

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end