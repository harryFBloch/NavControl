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
    
    
    _companylogoURL = [[UITextField alloc] initWithFrame:CGRectMake(280, 120, 250, 50)];
    self.companylogoURL.backgroundColor = [UIColor redColor];
    self.companylogoURL.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.companylogoURL];
    
    
  
  
    
    UILabel *companyLogoLabel = [[UILabel alloc]initWithFrame:CGRectMake(280, 60, 250, 50)];
    companyLogoLabel.text = @"Enter Company Logo Website";
    companyLogoLabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:companyLogoLabel];
   
    
    
//    UITextField *cname = [[UITextField alloc] initWithFrame:CGRectMake(20, 120, 250, 50)];
//    [self setCompanyNameText:cname]; // self.companyNameText = cname;
//    [cname release];
    //or
    //_companyNameText = [[UITextField alloc] initWithFrame:CGRectMake(20, 120, 250, 50)];
    
    _companyNameText = [[UITextField alloc] initWithFrame:CGRectMake(20, 120, 250, 50)];
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
   
    
    _productOne = [[UITextField alloc] initWithFrame:CGRectMake(20, 230, 250, 50)];
    self.productOne.backgroundColor = [UIColor redColor];
     self.productOne.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.productOne];
    
    
    _urlOne = [[UITextField alloc] initWithFrame:CGRectMake(280, 230, 200, 50)];
    self.urlOne.backgroundColor = [UIColor redColor];
     self.urlOne.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.urlOne];
    
    
    _logoOne = [[UITextField alloc] initWithFrame:CGRectMake(490, 230, 250, 50)];
    self.logoOne.backgroundColor = [UIColor redColor];
     self.logoOne.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.logoOne];
    
    
   _productTwo = [[UITextField alloc] initWithFrame:CGRectMake(20, 290, 250, 50)];
    self.productTwo.backgroundColor = [UIColor redColor];
     self.productTwo.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.productTwo];
  
    
   _urlTwo = [[UITextField alloc] initWithFrame:CGRectMake(280, 290, 200, 50)];
    self.urlTwo.backgroundColor = [UIColor redColor];
     self.urlTwo.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.urlTwo];
  
    
   _logoTwo = [[UITextField alloc] initWithFrame:CGRectMake(490, 290, 250, 50)];
    self.logoTwo.backgroundColor = [UIColor redColor];
     self.logoTwo.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.logoTwo];
   
    
    _productThree = [[UITextField alloc] initWithFrame:CGRectMake(20, 350, 250, 50)];
    self.productThree.backgroundColor = [UIColor redColor];
     self.productThree.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.productThree];
    
    
    _urlThree = [[UITextField alloc] initWithFrame:CGRectMake(280, 350, 200, 50)];
    self.urlThree.backgroundColor = [UIColor redColor];
     self.urlThree.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:self.urlThree];
   
    
    _logoThree = [[UITextField alloc] initWithFrame:CGRectMake(490, 350, 250, 50)];
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
        
        Product *temp = self.currentCompany.productObjectArray[0];
        Product *temp1 = self.currentCompany.productObjectArray[1];
        Product *temp2 = self.currentCompany.productObjectArray[2];
        
        self.companyNameText.text = self.currentCompany.companyName;
        self.companylogoURL.text = self.currentCompany.companyImg;
        
        self.productOne.text = temp.productName;
        self.productTwo.text = temp1.productName;
        self.productThree.text = temp2.productName;
        
        self.urlOne.text = temp.productURL;
        self.urlTwo.text = temp1.productURL;
        self.urlThree.text = temp2.productURL;
        
        self.logoOne.text = temp.productImg;
        self.logoTwo.text = temp.productImg;
        self.logoThree.text = temp.productImg;
        self.tempInt = 1;
    }
  
   
}


-(void)createCompany:company{
    
    Company * insertCompany = [[Company alloc]init];
   insertCompany.companyTitle = [NSString stringWithFormat:@"%@ mobile device makers",self.companyNameText.text];
    insertCompany.companyImg = self.companylogoURL.text;
    insertCompany.companyName = self.companyNameText.text;
    insertCompany.index = self.currentCompany.index;
   
    
   
    
    Product *insertProductOne = [[Product alloc]init];
    insertProductOne.productName = self.productOne.text;
    insertProductOne.productImg = self.logoOne.text;
    insertProductOne.productURL = self.urlOne.text;
   
    
    Product *insertProductTwo = [[Product alloc]init];
    insertProductTwo.productName = self.productTwo.text;
    insertProductTwo.productImg = self.logoTwo.text;
    insertProductTwo.productURL = self.urlTwo.text;
  
    Product *insertProductThree = [[Product alloc]init];
    insertProductThree.productName = self.productThree.text;
    insertProductThree.productImg = self.logoThree.text;
    insertProductThree.productURL = self.urlThree.text;
           MyDataController *coreData = [MyDataController sharedManager];
    if (!self.currentCompany) {
        insertProductOne.PK = coreData.produtcs.count;
        insertProductTwo.PK = coreData.produtcs.count+1;
        insertProductThree.PK = coreData.produtcs.count+2;
    }
    if (self.tempInt == 0) {
        insertCompany.ID = self.data.companyList.count+1;
        insertCompany.Pk = self.data.companyList.count;
        insertProductOne.index = 0;
        insertProductOne.companyID = insertCompany.ID;
        insertProductTwo.companyID = insertCompany.ID;
        insertProductTwo.index = 1;
        insertProductThree.index = 2;
        insertProductThree.companyID = insertCompany.ID;
    }else{
        insertCompany.ID = self.currentCompany.ID;
        insertCompany.Pk = self.currentCompany.Pk;
        insertProductOne.index = 0;
        insertProductOne.companyID = self.currentCompany.ID;
        insertProductTwo.companyID = self.currentCompany.ID;
        insertProductTwo.index = 1;
        insertProductThree.index = 2;
        insertProductThree.companyID = self.currentCompany.ID;

    }
    
    for (int i=0; i<self.currentCompany.productObjectArray.count; i++) {
        
        
       Product * temp = self.currentCompany.productObjectArray[i];
        if (i==0) {
            insertProductOne.PK = temp.PK;
        }
        if (i==1) {
            insertProductTwo.PK = temp.PK;
        }
        if (i==2) {
            insertProductThree.PK = temp.PK;
            
        }
    }
    insertCompany.productObjectArray = [NSMutableArray arrayWithObjects:insertProductOne,insertProductTwo,insertProductThree, nil];
    [insertProductOne release];
    [insertProductTwo release];
    [insertProductThree release];
        self.data = [Dao sharedManager];
  

    if (self.tempInt == 0) {
        insertCompany.Pk = self.data.companyList.count+1;
        insertCompany.ID = self.data.companyList.count+1;
        insertCompany.index = self.data.companyList.count;
        MyDataController *coreData = [MyDataController sharedManager];
        [self.data.companyList addObject:insertCompany];
        [coreData addCompany:insertCompany];
       
    }else{
       
        MyDataController *coreData = [MyDataController sharedManager];
        insertCompany.Pk = self.currentCompany.Pk;
        insertCompany.ID = self.currentCompany.ID;
        insertCompany.index = self.currentCompany.index;
        [self.data.companyList replaceObjectAtIndex:self.currentCompany.index withObject:insertCompany];
        [coreData editComany:insertCompany];
        
    }
   
    [insertCompany release];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
   
    [_companylogoURL release];
    [_companyNameText release];
    [_productOne release];
    [_urlOne release];
    [_logoOne release];
    [_productTwo release];
    [_urlTwo release];
    [_logoTwo release];
    [_productThree release];
    [_urlThree release];
    [_logoThree release];
    [super dealloc];
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
