//
//  ADDCompanyViewController.h
//  NavCtrl
//
//  Created by harry bloch on 3/10/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"

@interface ADDCompanyViewController : UIViewController

@property (nonatomic , strong) Company * currentCompany;
@property (retain, nonatomic) IBOutlet UITextField *companyName;
@property (retain, nonatomic) IBOutlet UITextField *CompanyLogo;

@property (retain, nonatomic) IBOutlet UILabel *CompanyNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *CompanyLogoLabel;

- (IBAction)createCompanyButton:(id)sender;

@property(nonatomic) BOOL editBool;


@end
