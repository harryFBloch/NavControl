//
//  ProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyViewController.h"
#import "Company.h"
#import "Product.h"



@interface ProductViewController : UITableViewController


@property(nonatomic,strong) UIWebView *webView;
@property(retain) Company *currentCompany;
@property(retain) Product *currentProduct;
@property(retain) Dao *data;

@property(nonatomic,strong)UITableViewCell *cell;

@end
