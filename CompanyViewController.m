//
//  CompanyViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "CompanyViewController.h"
#import "ProductViewController.h"
#import "Company.h"
#import "Product.h"


@interface CompanyViewController ()

@end

@implementation CompanyViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Mobile device makers";
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

   
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow:)];
    self.navigationItem.leftBarButtonItem = addButton ;
    self.data = [Dao sharedManager];
    [self.data openDB];
    [self.data countRows];
    [self.data databaseInfo];
    



    }
-(void)addRow:sender{
    addCompanyViewController *add = [[addCompanyViewController alloc]init];
    add.title = @"Add a Company";
    [add autorelease];
    [self.navigationController
     pushViewController:add
     animated:YES];
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.data.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    self.cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (self.cell == nil) {
        self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    Company *temp = [self.data.companyList objectAtIndex:indexPath.row];
    self.cell.textLabel.text = temp.companyName;
    self.cell.imageView.image =[UIImage imageNamed:temp.companyImg];
    return self.cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing ==YES) {
        tableView.allowsSelectionDuringEditing = YES;
    }
   // Return NO if you do not want the specified item to be editable.
    return YES;
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Company *tempC = self.data.companyList[indexPath.row];
        NSString *temp = [[NSString alloc ]initWithString: tempC.companyTitle];
       
        [self.data.companyList removeObjectAtIndex:indexPath.row];
        [self.data deleteFromDBCompany:temp];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [temp release];
        [tableView reloadData];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      
    }
}
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Company *tempString = [self.data.companyList objectAtIndex:fromIndexPath.row];
    [self.data.companyList removeObjectAtIndex:fromIndexPath.row];
    [self.data.companyList insertObject:tempString atIndex:toIndexPath.row];
    [self.data reArrange];
    
}
/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing == YES) {
        NSLog(@"editing Mode Entered");
        addCompanyViewController *editCompany = [[addCompanyViewController alloc] init];
        editCompany.title = @"Edit a Company";
        editCompany.currentCompany = [self.data.companyList objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:editCompany animated:YES];
        [editCompany release];
        return;
    }
   

    self.productViewController.currentCompany = [self.data.companyList objectAtIndex:indexPath.row];
    [self.navigationController
        pushViewController:self.productViewController
        animated:YES];
}
@end
