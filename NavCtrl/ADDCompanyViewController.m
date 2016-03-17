//
//  ADDCompanyViewController.m
//  NavCtrl
//
//  Created by harry bloch on 3/10/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ADDCompanyViewController.h"
#import "Dao.h"
#import "MyDataController.h"

@interface ADDCompanyViewController ()

@end

@implementation ADDCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_patterns_lines_shadow_43860_1920x1080.jpg"]];
    
    if ([self.title  isEqual: @"Edit a Company"]) {
        self.CompanyLogo.text = self.currentCompany.companyImg;
        self.companyName.text = self.currentCompany.companyName;
        self.editBool = true;
        self.stockSymbolTxt.text = self.currentCompany.stockSymbol;
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


- (IBAction)createCompanyButton:(id)sender {
    Dao *data = [Dao sharedManager];
    MyDataController *coreData = [MyDataController sharedManager];
    
    if (self.editBool) {
        self.currentCompany.companyName = self.companyName.text;
        self.currentCompany.companyImg = self.CompanyLogo.text;
        self.currentCompany.stockSymbol = self.stockSymbolTxt.text;
        [data.companyList replaceObjectAtIndex:self.currentCompany.index withObject:self.currentCompany];
        [coreData editComany:self.currentCompany];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        Company *tempC = [[Company alloc]init];
        tempC.companyName = self.companyName.text;
        tempC.companyImg = self.CompanyLogo.text;
        tempC.companyTitle = [NSString stringWithFormat:@"%@ mobile device makers",self.companyName.text];
        tempC.Pk = data.companyList.count+1;
        tempC.ID = data.companyList.count+1;
        tempC.stockSymbol = self.stockSymbolTxt.text;
        tempC.index = data.companyList.count;
        [data.companyList addObject:tempC];
        [coreData addCompany:tempC];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}
- (void)dealloc {
    [_stockSymbolTxt release];
    [super dealloc];
}
@end
