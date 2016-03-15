//
//  AddProductViewController.h
//  NavCtrl
//
//  Created by harry bloch on 3/10/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import "Product.h"

@interface AddProductViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *productNameLabel;
@property (retain, nonatomic) IBOutlet UITextField *productNameTxt;

@property (retain, nonatomic) IBOutlet UITextField *productLogoTxt;
@property (retain, nonatomic) IBOutlet UITextField *productWebsiteTxt;
- (IBAction)createproduct:(id)sender;

@property(nonatomic , retain) Company *currentCompany;
@property(nonatomic , retain) Product *currentProduct;

@property(nonatomic) BOOL editingMode;

@end
