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
   
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.data = [[Dao alloc]init];
    [self.data createCompanies];
    

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
    
    self.cell.textLabel.text = [self.data.companynames objectAtIndex:[indexPath row]];
    self.cell.imageView.image =[UIImage imageNamed:[self.data.imgArray objectAtIndex:indexPath.row]];
    
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
        [self.data.companyList removeObjectAtIndex:indexPath.row];
        [self.data.companynames removeObjectAtIndex:indexPath.row];
        [self.data.imgArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
        
    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *tempString = [self.data.companyList objectAtIndex:fromIndexPath.row];
    [self.data.companyList removeObjectAtIndex:fromIndexPath.row];
    [self.data.companynames removeObjectAtIndex:fromIndexPath.row];
    [self.data.companyList insertObject:tempString atIndex:toIndexPath.row];
    [self.data.companynames insertObject:tempString atIndex:toIndexPath.row];
    
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
    NSUInteger appleIndex = [self.data.companyList indexOfObject:@"Apple mobile devices"];
     NSUInteger samsungIndex = [self.data.companyList indexOfObject:@"Samsung mobile devices"];
     NSUInteger htcIndex = [self.data.companyList indexOfObject:@"HTC mobile devices"];
     NSUInteger blackberryIndex = [self.data.companyList indexOfObject:@"Blackberry mobile devices"];

    if (indexPath.row == appleIndex){
        self.productViewController.title = @"Apple mobile devices";
        
    } else if(indexPath.row == samsungIndex) {
        self.productViewController.title = @"Samsung mobile devices";
    } else if(indexPath.row == htcIndex) {
        self.productViewController.title = @"HTC mobile devices";
    }else if(indexPath.row == blackberryIndex) {
        self.productViewController.title = @"Blackberry mobile devices";
    }
    self.productViewController.currentCompany = [self.data.companyList objectAtIndex:indexPath.row];
    
    [self.navigationController
        pushViewController:self.productViewController
        animated:YES];
    

}
 


@end
