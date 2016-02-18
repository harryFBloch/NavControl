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
    
    
    self.data = [Dao sharedManager];
    [self.data createCompanies];
   
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow:)];
    self.navigationItem.leftBarButtonItem = addButton ;
    
    }
-(void)addRow:sender{
    addCompanyViewController *add = [[addCompanyViewController alloc]init];
    add.title = @"Add a Company";
    [self.navigationController
     pushViewController:add
     animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
  self.tempString = [[NSMutableString alloc]init];
    for (int i=0; i<self.data.companyList.count; i++) {
        [self.tempString appendString:@"+"];
        [self.tempString appendString:self.data.tickerNamesArary[i]];
    }
    NSString *urlString=[NSString stringWithFormat:@"http://finance.yahoo.com/d/quotes.csv?s=%@&f=a",self.tempString];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *stockData,NSURLResponse *response,NSError *error){
        NSLog(@"data->%@\t error->%@",stockData,error);
        NSString *temp = [[NSString alloc] initWithData:stockData encoding:NSUTF8StringEncoding];
        self.stockArray = (NSMutableArray*)[temp componentsSeparatedByString:@"\n"];
        for (int i=0; i<self.stockArray.count-1; i++) {
            [self.data.stockpriceArray addObject:self.stockArray[i]];
        }

        
    }]resume];
        
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
        self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...

    self.cell.textLabel.text = [self.data.companynames objectAtIndex:[indexPath row]];
    NSString *tempString = [self.data.imgArray objectAtIndex:indexPath.row];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:tempString]];
    self.cell.imageView.image =[UIImage imageWithData:imageData];
    self.cell.detailTextLabel.text = [self.data.stockpriceArray objectAtIndex:indexPath.row];
    
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
        [self.data.companyList removeObjectAtIndex:indexPath.row];
        [self.data.companynames removeObjectAtIndex:indexPath.row];
        [self.data.imgArray removeObjectAtIndex:indexPath.row];
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
    if (tableView.editing == YES) {
        NSLog(@"editing Mode Entered");
        addCompanyViewController *editCompany = [[addCompanyViewController alloc] init];
        editCompany.title = @"Edit a Company";
        editCompany.currentCompany = [self.data.companyList objectAtIndex:indexPath.row];
        [self.data.companyList removeObjectAtIndex:indexPath.row];
        [self.data.companynames removeObjectAtIndex:indexPath.row];
        [self.data.imgArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
        [self.navigationController pushViewController:editCompany animated:YES];
        return;
    }
   
//    NSUInteger appleIndex = [self.data.companyList indexOfObject:@"Apple mobile devices"];
//     NSUInteger samsungIndex = [self.data.companyList indexOfObject:@"Samsung mobile devices"];
//     NSUInteger htcIndex = [self.data.companyList indexOfObject:@"HTC mobile devices"];
//     NSUInteger blackberryIndex = [self.data.companyList indexOfObject:@"Blackberry mobile devices"];
//
//    if (indexPath.row == appleIndex){
//        self.productViewController.title = @"Apple mobile devices";
//        
//    } else if(indexPath.row == samsungIndex) {
//        self.productViewController.title = @"Samsung mobile devices";
//    } else if(indexPath.row == htcIndex) {
//        self.productViewController.title = @"HTC mobile devices";
//    }else if(indexPath.row == blackberryIndex) {
//        self.productViewController.title = @"Blackberry mobile devices";
//    }
    self.productViewController.currentCompany = [self.data.companyList objectAtIndex:indexPath.row];
//    self.productViewController.title = [self.data.companynames objectAtIndex:indexPath.row];
    
    [self.navigationController
        pushViewController:self.productViewController
        animated:YES];
    

}
 


@end
