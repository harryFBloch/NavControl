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
    UIBarButtonItem *undoButton = [[UIBarButtonItem alloc] initWithTitle:@"Undo" style:UIBarButtonItemStylePlain target:self action:@selector(undoButton)];
   
    NSArray *temp = [[NSArray alloc]initWithObjects:undoButton,self.editButtonItem, nil];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItems = temp;
    

   
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow:)];
    self.navigationItem.leftBarButtonItem = addButton ;
    self.data = [Dao sharedManager];
    [_data createCompanies];
    MyDataController *temp1 = [MyDataController sharedManager];
    [temp1 saveChanges];
//    [self.data openDB];
//    [self.data countRows];
//    [self.data databaseInfo];
  
  
   
    



    }
-(void)undoButton{
    MyDataController *coredata = [MyDataController sharedManager];
    [coredata undoButton];
    [self.tableView reloadData];
}
-(void)addRow:sender{
    adCompanyViewController *add = [[adCompanyViewController alloc]init];
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
//    self.cell.imageView.image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:temp.companyImg]]];
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
     
        MyDataController *temp = [MyDataController sharedManager];
        [temp DeleteCompany:indexPath.row];
        [self.data.companyList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      
    }
}
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    MyDataController *temp = [MyDataController sharedManager];
    Company *tempString = [self.data.companyList objectAtIndex:fromIndexPath.row];
    Companies *tempComp = temp.companies[fromIndexPath.row];
    [temp.companies removeObjectAtIndex:fromIndexPath.row];
    [temp.companies insertObject:tempComp atIndex:toIndexPath.row];
    [self.data.companyList removeObjectAtIndex:fromIndexPath.row];
    [self.data.companyList insertObject:tempString atIndex:toIndexPath.row];
    [temp companyRearrange];

    
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
        adCompanyViewController *editCompany = [[adCompanyViewController alloc] init];
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
