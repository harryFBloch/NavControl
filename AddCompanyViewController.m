//
//  addCompanyViewController.m
//  NavCtrl
//
//  Created by harry bloch on 2/16/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "addCompanyViewController.h"
#import "CompanyViewController.h"

@interface addCompanyViewController ()

@end

@implementation addCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *companyNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 250, 50)];
    companyNameLabel.text = @"Company";
    companyNameLabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:companyNameLabel];
    
    self.companylogoURL = [[UITextField alloc] initWithFrame:CGRectMake(280, 120, 250, 50)];
    self.companylogoURL.backgroundColor = [UIColor redColor];
    self.companylogoURL.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.companylogoURL];
    
    
    UILabel *companyLogoLabel = [[UILabel alloc]initWithFrame:CGRectMake(280, 60, 250, 50)];
    companyLogoLabel.text = @"Enter Company Logo Website";
    companyLogoLabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:companyLogoLabel];
    
    self.companyNameText = [[UITextField alloc] initWithFrame:CGRectMake(20, 120, 250, 50)];
    self.companyNameText.backgroundColor = [UIColor redColor];
     self.companyNameText.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.companyNameText];
    
    UILabel *products = [[UILabel alloc]initWithFrame:CGRectMake(20, 175, 250, 50)];
    products.text = @"Enter Up Too Three Products";
    products.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:products];
    
    UILabel *productsLogo = [[UILabel alloc]initWithFrame:CGRectMake(490, 175, 250, 50)];
    productsLogo.text = @"Enter Product Logo Website";
    productsLogo.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:productsLogo];
    
    UILabel *productsURL = [[UILabel alloc]initWithFrame:CGRectMake(280, 175, 200, 50)];
    productsURL.text = @"Enter Products Website";
    productsURL.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:productsURL];
    
    self.productOne = [[UITextField alloc] initWithFrame:CGRectMake(20, 230, 250, 50)];
    self.productOne.backgroundColor = [UIColor redColor];
     self.productOne.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.productOne];
    
    self.urlOne = [[UITextField alloc] initWithFrame:CGRectMake(280, 230, 200, 50)];
    self.urlOne.backgroundColor = [UIColor redColor];
     self.urlOne.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.urlOne];
    
    self.logoOne = [[UITextField alloc] initWithFrame:CGRectMake(490, 230, 250, 50)];
    self.logoOne.backgroundColor = [UIColor redColor];
     self.logoOne.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.logoOne];
    
   self.productTwo = [[UITextField alloc] initWithFrame:CGRectMake(20, 290, 250, 50)];
    self.productTwo.backgroundColor = [UIColor redColor];
     self.productTwo.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.productTwo];
    
   self.urlTwo = [[UITextField alloc] initWithFrame:CGRectMake(280, 290, 200, 50)];
    self.urlTwo.backgroundColor = [UIColor redColor];
     self.urlTwo.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.urlTwo];
    
   self.logoTwo = [[UITextField alloc] initWithFrame:CGRectMake(490, 290, 250, 50)];
    self.logoTwo.backgroundColor = [UIColor redColor];
     self.logoTwo.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.logoTwo];
    
    self.productThree = [[UITextField alloc] initWithFrame:CGRectMake(20, 350, 250, 50)];
    self.productThree.backgroundColor = [UIColor redColor];
     self.productThree.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.productThree];
    
    self.urlThree = [[UITextField alloc] initWithFrame:CGRectMake(280, 350, 200, 50)];
    self.urlThree.backgroundColor = [UIColor redColor];
     self.urlThree.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.urlThree];
    
    self.logoThree = [[UITextField alloc] initWithFrame:CGRectMake(490, 350, 250, 50)];
    self.logoThree.backgroundColor = [UIColor redColor];
     self.logoThree.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.logoThree];
    if ([self.title  isEqual: @"Add a Company"]) {
    UIButton *createCompanyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    createCompanyButton.frame = CGRectMake(20, 550, 300, 75);
    createCompanyButton.backgroundColor = [UIColor greenColor];
    [createCompanyButton setTitle:@"Create Company" forState:UIControlStateNormal];
    [createCompanyButton addTarget:self action:@selector(createCompany:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createCompanyButton];
        self.tempInt = 0;
    }else{
        UIButton *editCompanyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        editCompanyButton.frame =CGRectMake(20, 550, 300, 75);
        editCompanyButton.backgroundColor = [UIColor greenColor];
        [editCompanyButton setTitle:@"Submit Changes" forState:UIControlStateNormal];
        [editCompanyButton addTarget:self action:@selector(createCompany:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:editCompanyButton];
       
        self.companyNameText.text = self.currentCompany.companyName;
        self.companylogoURL.text = self.currentCompany.companyImg;
        
        self.productOne.text = self.currentCompany.productNameArray[0];
        self.productTwo.text = self.currentCompany.productNameArray[1];
        self.productThree.text = self.currentCompany.productNameArray[2];
        
        self.urlOne.text = self.currentCompany.websiteArray[0];
        self.urlTwo.text = self.currentCompany.websiteArray[1];
        self.urlThree.text = self.currentCompany.websiteArray[2];
        
        self.logoOne.text = self.currentCompany.productImgArray[0];
        self.logoTwo.text = self.currentCompany.productImgArray[1];
        self.logoThree.text = self.currentCompany.productImgArray[2];
        self.tempInt = 1;
    }
  
   
    
}


-(void)createCompany:company{
    
    self.insertCompany = [[Company alloc]init];
    self.insertCompany.companyTitle = [NSString stringWithFormat:@"%@ mobile device makers",self.companyNameText.text];
    self.insertCompany.companyImg = self.companylogoURL.text;
    self.insertCompany.companyName = self.companyNameText.text;
    self.insertCompany.index = self.currentCompany.index;
    self.insertCompany.ID = self.currentCompany.ID;
    self.insertCompany.Pk = self.currentCompany.Pk;
    
   
    
    self.insertProductOne = [[Product alloc]init];
    self.insertProductOne.productName = self.productOne.text;
    self.insertProductOne.productImg = self.logoOne.text;
    self.insertProductOne.productURL = self.urlOne.text;
    self.insertProductTwo = [[Product alloc]init];
    self.insertProductTwo.productName = self.productTwo.text;
    self.insertProductTwo.productImg = self.logoTwo.text;
    self.insertProductTwo.productURL = self.urlTwo.text;
    self.insertProductThree = [[Product alloc]init];
    self.insertProductThree.productName = self.productThree.text;
    self.insertProductThree.productImg = self.logoThree.text;
    self.insertProductThree.productURL = self.urlThree.text;
    for (int i=0; i<self.currentCompany.productObjectArray.count; i++) {
        Product *temp = [[Product alloc] init];
        temp = self.currentCompany.productObjectArray[i];
        if (i==0) {
            self.insertProductOne.PK = temp.PK;
        }
        if (i==1) {
            self.insertProductTwo.PK = temp.PK;
        }
        if (i==2) {
            self.insertProductThree.PK = temp.PK;
        }
    }
    
    self.insertCompany.websiteArray = [NSMutableArray arrayWithObjects:self.insertProductOne.productURL,self.insertProductTwo.productURL,self.insertProductThree.productURL, nil];
    self.insertCompany.productNameArray = [NSMutableArray arrayWithObjects:self.insertProductOne.productName,self.insertProductTwo.productName,self.insertProductThree.productName, nil];
    self.insertCompany.productObjectArray = [NSMutableArray arrayWithObjects:self.insertProductOne,self.insertProductTwo,self.insertProductThree, nil];
    self.insertCompany.productImgArray = [NSMutableArray arrayWithObjects:self.insertProductOne.productImg,self.insertProductTwo.productImg,self.insertProductThree.productImg, nil];
   
    self.logoArray = [NSMutableArray arrayWithObjects: self.insertProductOne.productImg, self.insertProductTwo.productImg, self.insertProductThree.productImg, nil];
    self.urlArray = [NSMutableArray arrayWithObjects: self.insertProductOne.productURL, self.insertProductTwo.productURL, self.insertProductThree.productURL, nil];
    
    
    self.data = [Dao sharedManager];
   
    
    if (self.tempInt == 0) {
        self.insertCompany.Pk = self.data.companyList.count;
        self.insertCompany.ID = self.data.companyList.count;
        self.insertCompany.index = self.data.companyList.count;
        [_data.arrayOfProductArrays addObject:self.insertCompany.productObjectArray];
        [self.data.imgArray addObject:self.insertCompany.companyImg];
        [self.data.companynames addObject:self.insertCompany.companyTitle];
        [self.data.companyList addObject:self.insertCompany];
        [self.data manageADDForum:self.insertCompany];
    }else {
        [self.data manageEditForum:self.insertCompany];
    }
    

    
//   CompanyViewController *pushCompanyViewController = [[CompanyViewController alloc]init];
//    [self.navigationController pushViewController:pushCompanyViewController animated:YES];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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

@end
