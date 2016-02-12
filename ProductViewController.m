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
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if (self.i==0) {
        
    
    if ([self.title isEqualToString:@"Apple mobile devices"]) {
        self.products = [NSMutableArray arrayWithObjects: @"iPad", @"iPod Touch",@"iPhone",nil];
        self.webSiteArray =@[@"http://www.apple.com/ipad/",@"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_91262087527_&cid=aos-us-kwg-ipod-slid-",@"http://www.apple.com/iphone/?afid=p238%7CsGy8lsjhy-dc_mtid_1870765e38482_pcrid_99437624767_&cid=aos-us-kwg-iphone-slid-"];
    } if([self.title isEqualToString:@"Samsung mobile devices"]){
        self.products = [NSMutableArray arrayWithObjects:@"Galaxy S6", @"Galaxy Note", @"Galaxy Tab",nil];
        self.webSiteArray = @[@"http://www.samsung.com/us/explore/galaxy-s6-edge-plus-features-and-specs/?cid=ppc-",@"http://www.samsung.com/us/explore/galaxy-note-5-features-and-specs/?cid=ppc-",@"http://www.samsung.com/us/mobile/galaxy-tab/"];
    } if([self.title isEqualToString:@"HTC mobile devices"]){
        self.products = [NSMutableArray arrayWithObjects:@"ONE A9", @"Desire",@"ONE M9",nil];
        self.webSiteArray = @[@"http://www.htc.com/us/smartphones/htc-one-a9/",@"hhttp://www.htc.com/us/smartphones/htc-desire-626/",@"http://www.htc.com/us/smartphones/htc-one-m9/"];
    } if([self.title isEqualToString:@"Blackberry mobile devices"]){
        self.products = [NSMutableArray arrayWithObjects:@"Classic", @"Leap", @"Z30",nil];
        self.webSiteArray = @[ @"http://us.blackberry.com/smartphones/blackberry-classic/overview.html", @"http://us.blackberry.com/smartphones/blackberry-leap/overview.html", @"http://us.blackberry.com/smartphones/blackberry-z30/overview.html"];
        }
    }
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
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    return cell;
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
        [self.products removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
        self.i++;
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

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
   
//    
//                self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0.0, 200.0, 600.0, 300.0)];
//    self.webView.center = self.view.superview.center;
//        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[self.webSiteArray objectAtIndex:indexPath.row]]  cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:0];
    //[self.webView loadRequest:request];
    WebSitViewController *detailViewController = [[WebSitViewController alloc]init];
    detailViewController.websiteUrl = [[NSURL alloc]initWithString:[self.webSiteArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
    
    
    
}
 


@end

































