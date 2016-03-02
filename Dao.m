//
//  Dao.m
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Dao.h"

@implementation Dao

+(id)sharedManager{
    static Dao *DaoManager = nil;
    @synchronized(self) {
        if (DaoManager == nil) {
            DaoManager = [[self alloc]init];
        }
    }
    return DaoManager;
}
//-(void)createCompanies{
//    
//    if (self.arrayOfProductArrays == nil) {
//        
//    
//    //create apple
//    Company *apple = [[Company alloc] init];
//    apple.companyTitle = @"Apple mobile devices";
//    apple.companyImg = @"http://logok.org/wp-content/uploads/2014/04/Apple-Logo-rainbow.png";
//    
//    //create apple products
//    Product *ipad = [[Product alloc]init];
//    ipad.productName = @"iPad";
//    ipad.productURL = @"http://www.apple.com/ipad/";
//    ipad.productImg = @"https://www.apple.com/support/assets/images/products/ipad/hero_ipad_family_2015_2x.jpg";
//    Product *ipod = [[Product alloc]init];
//    ipod.productName = @"iPod Touch";
//    ipod.productURL = @"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_91262087527_&cid=aos-us-kwg-ipod-slid-";
//    ipod.productImg = @"https://www.apple.com/support/assets/images/products/ipodtouch/hero_ipodtouch6_2015.jpg";
//    Product *iphone= [[Product alloc]init];
//    iphone.productName = @"iPhone";
//    iphone.productURL = @"http://www.apple.com/iphone/?afid=p238%7CsGy8lsjhy-dc_mtid_1870765e38482_pcrid_99437624767_&cid=aos-us-kwg-iphone-slid-";
//    iphone.productImg = @"https://www.apple.com/support/assets/images/products/iphone/hero_iphone_6s_2x.png";
//    
//    //store apple products in array
//    apple.productArray = [NSMutableArray arrayWithObjects:ipad.productName,ipod.productName,iphone.productName,nil ];
//    apple.websiteArray = [NSMutableArray arrayWithObjects:ipad.productURL,ipod.productURL,iphone.productURL, nil];
//    apple.productImgArray = [NSMutableArray arrayWithObjects:ipad.productImg,ipod.productImg,iphone.productImg,nil];
//    apple.productObjectArray = [NSMutableArray arrayWithObjects:ipad,ipod,iphone, nil];
//    
//    //create samsung
//    Company *samsung = [[Company alloc] init];
//    samsung.companyTitle = @"Samsung mobile devices";
//    samsung.companyImg = @"http://files.technobezz.com/files/uploads/2014/06/samsung-boot.jpg";
//    
//    Product *galaxyS6 = [[Product alloc]init];
//    galaxyS6.productName = @"Galaxy S6";
//    galaxyS6.productURL = @"http://www.samsung.com/us/explore/galaxy-s6-edge-plus-features-and-specs/?cid=ppc-";
//    galaxyS6.productImg = @"http://www.samsung.com/in/consumer-images/product/mobile-phone/2015/SM-G920IZDAINS/features/SM-G920IZDAINS-403979-2.jpg";
//    
//    
//    Product *galaxyNote = [[Product alloc]init];
//    galaxyNote.productName = @"Galaxy Note";
//    galaxyNote.productURL = @"http://www.samsung.com/us/explore/galaxy-note-5-features-and-specs/?cid=ppc-";
//    galaxyNote.productImg = @"http://cdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-note-i717-ofic.jpg";
//    
//    Product *galaxyTab = [[Product alloc]init];
//    galaxyTab.productName = @"Galaxy Tab";
//    galaxyTab.productURL = @"http://www.samsung.com/us/mobile/galaxy-tab/";
//    galaxyTab.productImg = @"http://cdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-tab-ofic-3.jpg";
//    
//    samsung.productArray = [NSMutableArray arrayWithObjects:galaxyS6.productName,galaxyNote.productName,galaxyTab.productName, nil];
//    samsung.websiteArray = [NSMutableArray arrayWithObjects:galaxyS6.productURL,galaxyNote.productURL,galaxyTab.productURL, nil];
//    samsung.productImgArray = [NSMutableArray arrayWithObjects:galaxyS6.productImg,galaxyNote.productImg,galaxyTab.productImg,nil];
//    samsung.productObjectArray = [NSMutableArray arrayWithObjects:galaxyS6,galaxyNote,galaxyTab, nil];
//    //create HTC
//    Company *htc = [[Company alloc] init];
//    htc.companyTitle = @"HTC mobile devices";
//    htc.companyImg = @"http://www.norebbo.com/wp-content/uploads/2012/02/melt_htc.jpg";
//    
//    Product *oneA9 = [[Product alloc]init];
//    oneA9.productName = @"ONE A9";
//    oneA9.productURL = @"http://www.htc.com/us/smartphones/htc-one-a9/";
//    oneA9.productImg = @"http://cnet4.cbsistatic.com/hub/i/r/2015/10/19/eb3b7231-4293-4d97-8573-5edb055f03da/thumbnail/770x433/1e9eea63bc946c6b5730694cc42ba74f/fd-htc-one-a9-product-nda.jpg";
//    
//    Product *desire = [[Product alloc]init];
//    desire.productName = @"Desire";
//    desire.productURL = @"hhttp://www.htc.com/us/smartphones/htc-desire-626/";
//    desire.productImg = @"http://www.htc.com/managed-assets/shared/desktop/smartphones/htc-desire-626/en-us/att/sketchfab/htc-desire-626-en_us-att-marine-white-sketchfab.png";
//    
//    Product *oneM9 = [[Product alloc]init];
//    oneM9.productName = @"ONE M9";
//    oneM9.productURL = @"http://www.htc.com/us/smartphones/htc-one-m9/";
//    oneM9.productImg = @"http://www.htc.com/managed-assets/shared/desktop/smartphones/htc-one-m9/Sketchfab/htc-one-m9-global-sketchfab-gunmetal.png";
//    htc.productArray = [NSMutableArray arrayWithObjects:oneA9.productName,desire.productName,oneM9.productName, nil];
//    htc.websiteArray = [NSMutableArray arrayWithObjects:oneA9.productURL,desire.productURL,oneM9.productURL, nil];
//    htc.productImgArray = [NSMutableArray arrayWithObjects:oneA9.productImg,desire.productImg,oneM9.productImg, nil];
//    htc.productObjectArray = [NSMutableArray arrayWithObjects:oneA9,desire,oneM9, nil];
//    
//    //create blackberry
//    Company *blackberry = [[Company alloc]init];
//    blackberry.companyTitle =@"Blackberry mobile devices";
//    blackberry.companyImg = @"http://siliconangle.com/files/2015/04/blackberry-logo.jpg";
//    
//    Product *classic = [[Product alloc]init];
//    classic.productName = @"Classic";
//    classic.productURL = @"http://us.blackberry.com/smartphones/blackberry-classic/overview.html";
//    classic.productImg = @"https://rimblogs.files.wordpress.com/2014/12/classic_black_2device-v2.jpg";
//    
//    Product *leap = [[Product alloc]init];
//    leap.productName = @"Leap";
//    leap.productURL = @"http://us.blackberry.com/smartphones/blackberry-leap/overview.html";
//    leap.productImg = @"http://o.aolcdn.com/hss/storage/midas/52df4a7a20deb754db9f3dbb4f77805d/201633836/leap-fb.jpg";
//    
//    Product *z30 = [[Product alloc]init];
//    z30.productName = @"Z30";
//    z30.productURL = @"http://us.blackberry.com/smartphones/blackberry-z30/overview.html";
//    z30.productImg = @"http://us.blackberry.com/content/dam/bbCompany/Desktop/Global/Device/Z30/Z30_Front.jpg";
//    
//    blackberry.productArray = [NSMutableArray arrayWithObjects:classic.productName,leap.productName,z30.productName, nil];
//    blackberry.websiteArray = [NSMutableArray arrayWithObjects:classic.productURL,leap.productURL,z30.productURL, nil];
//    blackberry.productImgArray = [NSMutableArray arrayWithObjects:classic.productImg,leap.productImg,z30.productImg, nil];
//    blackberry.productObjectArray = [NSMutableArray arrayWithObjects:classic,leap,z30, nil];
//    
//    self.companyList = [NSMutableArray arrayWithObjects: apple,samsung,htc,blackberry,nil];
//    self.companynames = [NSMutableArray arrayWithObjects: apple.companyTitle,samsung.companyTitle,htc.companyTitle,blackberry.companyTitle,nil];
//    
//    self.imgArray = [NSMutableArray arrayWithObjects: apple.companyImg,samsung.companyImg,htc.companyImg,blackberry.companyImg,nil];
//    self.arrayOfProductArrays = [NSMutableArray arrayWithObjects:apple.productObjectArray,samsung.productObjectArray,htc.productObjectArray,blackberry.productObjectArray, nil];
//}
//}

-(void)openDB{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"navDB" ofType:@"db"];
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *documentDBFolderPath = [documentsDirectory stringByAppendingString:@"/navDB.db"];
    self.dbPathString = documentDBFolderPath;
    if (![fileManager fileExistsAtPath:self.dbPathString]) {
        [fileManager copyItemAtPath:filePath toPath:self.dbPathString error:&error];
        NSLog(@"ERROR->%@",[error localizedDescription]);
        [error release];
        [paths release];
       
    }
}

-(void)databaseInfo{

    sqlite3_stmt *statement;
    self.companyList = [[NSMutableArray alloc]init];
    NSMutableArray * productObjectArrayTemp = [[NSMutableArray alloc] init];
   NSMutableArray * tempCompanyList = [[NSMutableArray alloc] init];
    NSInteger tempINT = 0;
    NSUInteger i = 0;
    NSUInteger b = 0;
    NSUInteger productRows = 0;
  
  
   
    
    sqlite3_stmt *statement2;
    
    if (sqlite3_open([self.dbPathString  UTF8String], &_personDB2) == SQLITE_OK) {
        NSString *querySQLTwo = [NSString stringWithFormat:@"SELECT * FROM Product"];
        const char *query_sqlTwo = [querySQLTwo UTF8String];
        NSLog(@"%d",sqlite3_prepare(_personDB2, query_sqlTwo, -1, &statement2, NULL)== SQLITE_OK);
        if (sqlite3_prepare(_personDB2, query_sqlTwo, -1, &statement2, NULL)== SQLITE_OK) {
            while (sqlite3_step(statement2) == SQLITE_ROW) {
                
               
                b++;
                NSString *name = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 1)];
                NSString *productLogoURL =[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 2)];
                NSString *productURL = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 3)];
                NSInteger productID = sqlite3_column_int(statement2, 4);
                NSString *productIndexTEmp = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 5)];
                NSInteger tempProductPK= sqlite3_column_int(statement2, 0);
                
                Product *product = [[Product alloc]init];
                product.productName = name ;
                product.productURL = productURL;
                product.productImg = productLogoURL;
                product.companyID = productID;
                product.index = [productIndexTEmp integerValue];
                product.PK = tempProductPK;

                [productObjectArrayTemp addObject:product];
                [name release];
                [productLogoURL release];
                [productURL release];
                [productIndexTEmp release];
                [product release];

                
            }
            
        }
        
        sqlite3_finalize(statement2);
        sqlite3_close(_personDB2);
        
    }
    if (sqlite3_open([self.dbPathString  UTF8String], &_personDB) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM Company"];
        
        
        const char *query_sql = [querySQL UTF8String];
        
        NSLog(@"TEST->%d",sqlite3_prepare_v2(_personDB, query_sql, -1, &statement, NULL));
        if (sqlite3_prepare_v2(_personDB, query_sql, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *companyLogoURL = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                NSString *companyTitle =[[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                NSString *companyName = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                NSInteger companyIndex = sqlite3_column_int(statement, 4);
                NSInteger companyPK = sqlite3_column_int(statement, 0);
                
                Company *company = [[Company alloc]init];
                company.index = companyIndex;
                company.companyImg = [[NSString alloc]initWithString:companyLogoURL];
                company.Pk = companyPK;
                
               company.companyTitle = [[NSString alloc]initWithString:companyTitle];
                company.ID = companyIndex;
                company.companyName = [[NSString alloc]initWithString:companyName];
                
                company.productObjectArray = [[NSMutableArray alloc]init];
                
                [companyLogoURL release];
                [companyTitle release];
                [companyName release];
    
                NSString *tempString = [NSString stringWithFormat:@"SELECT * FROM Product WHERE Company_ID = '%ld'",(long)company.Pk];
                productRows = [self countProductRows:tempString];
                for (int i=0; i<productRows; i++) {
                    [company.productObjectArray addObject: @""];
                    [company.websiteArray addObject:@""];
                    [company.productImgArray addObject:@""];
                    [company.productNameArray addObject:@""];
                }
                
                for (i=0; i<productObjectArrayTemp.count; i++) {
                    Product *tempProduct = productObjectArrayTemp[i];
                    if (tempProduct.companyID == company.Pk) {
                        [company.productObjectArray replaceObjectAtIndex:tempProduct.index withObject:tempProduct];
                        [company.websiteArray replaceObjectAtIndex:tempProduct.index withObject:tempProduct.productURL];
                        [company.productImgArray replaceObjectAtIndex:tempProduct.index withObject:tempProduct.productImg];
                        [company.productNameArray replaceObjectAtIndex:tempProduct.index withObject:tempProduct.productName];
                    }
                }
                [tempCompanyList addObject:company];
                tempINT ++;
                if (tempINT==self.max) {
                    for (int z = 0; z<=(self.max -1); z++) {
                        [self.companyList addObject:@""];
                    }
                    for (int z = 0; z < self.max ; z++) {
                        company = tempCompanyList[z];
                        [self.companyList replaceObjectAtIndex:company.ID withObject:company];
                            }
                }
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(_personDB);
    }
    
    [tempCompanyList release];
    [productObjectArrayTemp release];
}


-(void)deleteFromDBCompany:(NSString*)query{
    
    sqlite3_stmt *statement3;
    NSString * tempstring1 = [NSString stringWithFormat:@"DELETE FROM Company WHERE company_Title ='%@'",query];
    if (sqlite3_open([self.dbPathString  UTF8String], &_deleteCompany) == SQLITE_OK) {
        NSLog(@"%s",sqlite3_errmsg(_deleteCompany));
        const char *query_sqlTwo = [tempstring1 UTF8String];
        
        NSLog(@"%d",sqlite3_prepare(_deleteCompany, query_sqlTwo, -1, &statement3, NULL)== SQLITE_OK);
        if (sqlite3_prepare(_deleteCompany, query_sqlTwo, -1, &statement3, NULL)== SQLITE_OK) {
            
            NSLog(@"Item Deleted");
            
        }
        if (sqlite3_step(statement3)==SQLITE_DONE) {
            
            NSLog(@"%s",sqlite3_errmsg(_deleteCompany));
            sqlite3_finalize(statement3);
        }
        
        sqlite3_close(_deleteCompany);
        NSLog(@"%s",sqlite3_errmsg(_deleteCompany));
        
    }
    for (int i = 0; i<self.companyList.count; i++) {
        Company *tempC = self.companyList[i];
        NSString *temp = [NSString stringWithFormat:@"UPDATE Company SET 'index' = '%d' WHERE  company_Title = '%@'",i,tempC.companyTitle];
        [self sqlPers:temp];
    }
}
-(void)deleteFromDBProduct:(NSString*)query{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentDBFolderPath = [documentsDirectory stringByAppendingString:@"/navDB.db"];
    self.dbPathString = documentDBFolderPath;

    
    sqlite3_stmt *statement4;
    NSString * tempstring1 = [NSString stringWithFormat:@"DELETE FROM Product WHERE name ='%@'",query];
    if (sqlite3_open([self.dbPathString  UTF8String], &_deleteProduct) == SQLITE_OK) {
        NSLog(@"%s",sqlite3_errmsg(_deleteProduct));
        const char *query_sqlTwo = [tempstring1 UTF8String];
        
        NSLog(@"%d",sqlite3_prepare(_deleteProduct, query_sqlTwo, -1, &statement4, NULL)== SQLITE_OK);
        if (sqlite3_prepare(_deleteProduct, query_sqlTwo, -1, &statement4, NULL)== SQLITE_OK) {
            
            NSLog(@"Item Deleted");
            
        }
        if (sqlite3_step(statement4)==SQLITE_DONE) {
            
            NSLog(@"%s",sqlite3_errmsg(_deleteProduct));
            sqlite3_finalize(statement4);
        }
        
        sqlite3_close(_deleteProduct);
        NSLog(@"%s",sqlite3_errmsg(_deleteProduct));

    }

}
-(void)countRows{
      sqlite3_stmt *statement3;
      
    NSString * tempstring1 = @"SELECT * FROM Company";
    NSInteger counter = 0;
    if (sqlite3_open([self.dbPathString  UTF8String], &_countDB) == SQLITE_OK) {
        const char *query_sqlTwo = [tempstring1 UTF8String];
        NSLog(@"%d",sqlite3_prepare(_countDB, query_sqlTwo, -1, &statement3, NULL)== SQLITE_OK);
        if (sqlite3_prepare(_countDB, query_sqlTwo, -1, &statement3, NULL)== SQLITE_OK) {
            while (sqlite3_step(statement3) == SQLITE_ROW) {
                counter++;
                self.max=counter;
            }

            if (sqlite3_step(statement3)==SQLITE_DONE) {
            
            sqlite3_finalize(statement3);
        }
       
        sqlite3_close(_countDB);
      
    }
}
}

-(void)sqlPers:(NSString*)query{
    
    if (!self.dbPathString) {
        
   
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentDBFolderPath = [documentsDirectory stringByAppendingString:@"/navDB.db"];
    self.dbPathString = documentDBFolderPath;
    }
    
    sqlite3_stmt *statement4;
    NSString * tempstring1 = query;
    if (sqlite3_open([self.dbPathString  UTF8String], &_deleteProduct) == SQLITE_OK) {
        
        const char *query_sqlTwo = [tempstring1 UTF8String];
        
        
        if (sqlite3_prepare(_deleteProduct, query_sqlTwo, -1, &statement4, NULL)== SQLITE_OK) {
            
            NSLog(@"Item changed");
            
        }
        if (sqlite3_step(statement4)==SQLITE_DONE) {
            
           
            sqlite3_finalize(statement4);
        }
        
        sqlite3_close(_deleteProduct);
    
        
    }
    
}

-(void)reArrange{
    while (self.tempINT<self.companyList.count) {
         Company *temp = self.companyList[self.tempINT];
        temp.ID = self.tempINT;
        NSString *indexTempString = [[NSString alloc]initWithFormat:@"UPDATE Company SET 'index' = '%ld' WHERE  name = '%@'",(long)temp.ID,temp.companyName];
        self.tempINT++;
        [self sqlPers:indexTempString];
        [indexTempString release];
        
    }
    
    
}

-(void)productReArrange:(Company *)company{
    
   
        Product *temp = company.productObjectArray[0];
        Product *temp1 = company.productObjectArray[1];
        Product *temp2 = company.productObjectArray[2];
        NSString *tempString2 = [NSString stringWithFormat:@"UPDATE Product SET 'index' = %d WHERE name = '%@'",2,temp2.productName];
        [self sqlPers:tempString2];
        NSString *tempString = [NSString stringWithFormat:@"UPDATE Product SET 'index' = %d WHERE name = '%@'",0,temp.productName];
        [self sqlPers:tempString];
        NSString *tempString1 = [NSString stringWithFormat:@"UPDATE Product SET 'index' = %d WHERE name = '%@'",1,temp1.productName];
        [self sqlPers:tempString1];
    
    

}
-(NSInteger)countProductRows:(NSString*)query{
    sqlite3_stmt *statement3;
    
    NSString * tempstring1 = query;
    NSInteger counter = 0;
    if (sqlite3_open([self.dbPathString  UTF8String], &_countDB) == SQLITE_OK) {
        const char *query_sqlTwo = [tempstring1 UTF8String];
//        NSLog(@"%d",sqlite3_prepare(_countDB, query_sqlTwo, -1, &statement3, NULL)== SQLITE_OK);
        if (sqlite3_prepare(_countDB, query_sqlTwo, -1, &statement3, NULL)== SQLITE_OK) {
            while (sqlite3_step(statement3) == SQLITE_ROW) {
                counter++;
                self.productMax=counter;
            }
            
            if (sqlite3_step(statement3)==SQLITE_DONE) {
                
                sqlite3_finalize(statement3);
            }
            
            sqlite3_close(_countDB);
            
        }
    }
    return self.productMax;
}

-(void)manageADDForum:(Company *)newCompany{
    [self.companyList addObject:newCompany];
     NSString *tempCompanySQL = [NSString stringWithFormat:@"INSERT INTO Company VALUES (%ld,'%@','%@','%@',%ld)",((long)newCompany.Pk+1),newCompany.companyName,newCompany.companyImg,newCompany.companyTitle,(long)newCompany.ID];
    [self sqlPers:tempCompanySQL];
    for (int i=0; i<newCompany.productObjectArray.count; i++) {
        Product * tempProduct = newCompany.productObjectArray[i];
        NSInteger temp = [self countProductRows:@"SELECT * FROM Product"];
        NSString *tempProductSQL = [NSString stringWithFormat:@"INSERT INTO Product VALUES (%d,'%@','%@','%@',%ld,%d)",(temp +1),tempProduct.productName,tempProduct.productImg,tempProduct.productURL,((long)newCompany.Pk+1),i];
        [self sqlPers:tempProductSQL];
        
    }
}
-(void)manageEditForum:(Company *)editedCompany{
    [self.companyList replaceObjectAtIndex:editedCompany.ID withObject:editedCompany];
    NSString *tempCompanySQL = [NSString stringWithFormat:@"UPDATE Company SET name = '%@',logoURL = '%@',company_Title = '%@','index' = %ld WHERE company_Title = '%@'",editedCompany.companyName,editedCompany.companyImg,editedCompany.companyTitle,(long)editedCompany.ID,editedCompany.companyName];
    [self sqlPers:tempCompanySQL];
    for (int i=0; i<editedCompany.productObjectArray.count; i++) {
        Product *tempProduct = editedCompany.productObjectArray[i];
        NSString *tempProductSQL = [NSString stringWithFormat:@"Update Product SET name ='%@', logoURL = '%@',URL = '%@', Company_ID = %ld, 'index' = %ld WHERE id = '%ld'",tempProduct.productName,tempProduct.productImg,tempProduct.productURL,(long)editedCompany.Pk,(long)i,(long)tempProduct.PK];
        [self sqlPers:tempProductSQL];
       
}
}


@end












