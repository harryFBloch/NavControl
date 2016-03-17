//
//  addCompanyViewController.h
//  NavCtrl
//
//  Created by harry bloch on 2/16/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dao.h"
#import "Product.h"
#import "Company.h"
#import "ProductViewController.h"
#import "CompanyViewController.h"
#import "MyDataController.h"


@interface adCompanyViewController : UIViewController

@property(retain) Company *currentCompany;
@property(retain) Dao *data;
@property(nonatomic) NSInteger tempInt;


@property(nonatomic,strong) UITextField *companyNameText;
@property(nonatomic,strong) UITextField  *companylogoURL;
@property(nonatomic,strong) UITextField *productOne;
@property(nonatomic,strong) UITextField *productTwo;
@property(nonatomic,strong) UITextField *productThree;

@property(nonatomic,strong) UITextField *urlOne;
@property(nonatomic,strong) UITextField *urlTwo;
@property(nonatomic,strong) UITextField *urlThree;

@property(nonatomic,strong) UITextField *logoOne;
@property(nonatomic,strong) UITextField *logoTwo;
@property(nonatomic,strong) UITextField *logoThree;





@end