//
//  ProductViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ProductViewController.h"
#import "WebSitViewController.h"
#import <WebKit/WebKit.h>
#import "Company.h"
#import "Product.h"
#import "Dao.h"


@interface ProductViewController ()

@end

@implementation ProductViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

     
    self.title = @"Mobile device makers";

   
}

- (void)viewWillAppear:(BOOL)animated {
    
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
    
    return self.currentCompany.productObjectArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    self.cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (self.cell == nil) {
        self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...

    self.cell.textLabel.text = [self.currentCompany.productArray objectAtIndex:[indexPath row]];
    NSString *tempString = [self.currentCompany.productImgArray objectAtIndex:indexPath.row];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:tempString]];
    self.cell.imageView.image =[UIImage imageWithData:imageData];
    self.title = self.currentCompany.companyTitle;

    self.cell.textLabel.text = [self.currentCompany.productNameArray objectAtIndex:[indexPath row]];
    self.cell.imageView.image =[UIImage imageWithContentsOfFile:[self.currentCompany.productImgArray objectAtIndex:indexPath.row]];

    return self.cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSString *temp = [[NSString alloc ]initWithString: [self.currentCompany.productNameArray objectAtIndex:indexPath.row]];
        [self.data deleteFromDBProduct:temp];
        [self.currentCompany.productObjectArray removeObjectAtIndex:indexPath.row];
        [self.currentCompany.productImgArray removeObjectAtIndex:indexPath.row];
        [self.currentCompany.websiteArray removeObjectAtIndex:indexPath.row];
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
    NSString *tempstring = [self.currentCompany.websiteArray objectAtIndex:fromIndexPath.row];
    NSString *imgTemp = [self.currentCompany.productImgArray objectAtIndex:fromIndexPath.row];
     NSString *nameTemp = [self.currentCompany.productNameArray objectAtIndex:fromIndexPath.row];
    [self.currentCompany.websiteArray removeObjectAtIndex:fromIndexPath.row];
    [self.currentCompany.websiteArray insertObject:tempstring atIndex:toIndexPath.row];
    [self.currentCompany.productImgArray removeObjectAtIndex:fromIndexPath.row];
    [self.currentCompany.productImgArray insertObject:imgTemp atIndex:toIndexPath.row];
    [self.currentCompany.productNameArray removeObjectAtIndex:fromIndexPath.row];
    [self.currentCompany.productNameArray insertObject:nameTemp atIndex:toIndexPath.row];
    [self.data productReArrange:self.currentCompany];
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

    WebSitViewController *detailViewController = [[WebSitViewController alloc]init];
    detailViewController.websiteUrl = [[NSURL alloc]initWithString:[self.currentCompany.websiteArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
    
    
    
}
 


@end

































