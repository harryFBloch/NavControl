//
//  AddProductViewController.m
//  NavCtrl
//
//  Created by harry bloch on 3/10/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "AddProductViewController.h"
#import "Dao.h"
#import "MyDataController.h"
#import "ProductCollectionViewController.h"

@interface AddProductViewController ()

@end

@implementation AddProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_patterns_lines_shadow_43860_1920x1080.jpg"]];
    if ([self.title isEqualToString:@"edit a Product"]) {
        self.productLogoTxt.text = self.currentProduct.productImg;
        self.productNameTxt.text = self.currentProduct.productName;
        self.productWebsiteTxt.text = self.currentProduct.productURL;
        self.editingMode = true;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_productNameLabel release];
    [_productNameTxt release];
    [_productLogoTxt release];
    [_productWebsiteTxt release];
    [super dealloc];
}
- (IBAction)createproduct:(id)sender {
    Dao *data = [Dao sharedManager];
    MyDataController *coreData = [MyDataController sharedManager];
    
    if (self.editingMode) {
        self.currentProduct.productName = self.productNameTxt.text;
        self.currentProduct.productImg = self.productLogoTxt.text;
        self.currentProduct.productURL = self.productWebsiteTxt.text;
        [self.currentCompany.productObjectArray replaceObjectAtIndex:self.currentProduct.index withObject:self.currentProduct];
        [data.companyList replaceObjectAtIndex:self.currentCompany.Pk withObject:self.currentCompany];
        [coreData editComany:self.currentCompany];
    }else{
        self.currentProduct = [[Product alloc] init];
        self.currentProduct.productName = self.productNameTxt.text;
        self.currentProduct.productImg = self.productLogoTxt.text;
        self.currentProduct.productURL = self.productWebsiteTxt.text;
        self.currentProduct.companyID = self.currentCompany.ID;
        self.currentProduct.index = self.currentCompany.productObjectArray.count;
        self.currentProduct.PK = coreData.produtcs.count;
        [self.currentCompany.productObjectArray addObject:self.currentProduct];
        [data.companyList replaceObjectAtIndex:self.currentCompany.Pk withObject:self.currentCompany];
    [coreData addProduct:self.currentProduct];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
