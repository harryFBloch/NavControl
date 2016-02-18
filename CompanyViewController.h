//
//  CompanyViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dao.h"
#import "addCompanyViewController.h"

@class ProductViewController;

@interface CompanyViewController : UITableViewController
@property (nonatomic, strong) NSMutableString *tempString;
@property (nonatomic, retain) IBOutlet  ProductViewController * productViewController;
@property (nonatomic, strong)UITableViewCell *cell;
@property (nonatomic, strong) NSMutableArray *stockArray;
@property (retain) Dao *data;

@end
