//
//  Dao.m
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Dao.h"

@implementation Dao
-(void)createCompanies{
    
    //create apple
    Company *apple = [[Company alloc] init];
    apple.companyTitle = @"Apple mobile devices";
    apple.companyImg = @"apple.png";
    
    //create apple products
    Product *ipad = [[Product alloc]init];
    ipad.productName = @"iPad";
    ipad.productURL = @"http://www.apple.com/ipad/";
    ipad.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/ipad";
    Product *ipod = [[Product alloc]init];
    ipod.productName = @"iPod Touch";
    ipod.productURL = @"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_91262087527_&cid=aos-us-kwg-ipod-slid-";
    ipod.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/ipod-touch-product-initial-2015";
    Product *iphone= [[Product alloc]init];
    iphone.productName = @"iPhone";
    iphone.productURL = @"http://www.apple.com/iphone/?afid=p238%7CsGy8lsjhy-dc_mtid_1870765e38482_pcrid_99437624767_&cid=aos-us-kwg-iphone-slid-";
    iphone.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/iphone";
    
    //store apple products in array
    apple.productObjectArray = [NSMutableArray arrayWithObjects:ipad.productName,ipod.productName,iphone.productName,nil ];
    apple.websiteArray = [NSMutableArray arrayWithObjects:ipad.productURL,ipod.productURL,iphone.productURL, nil];
    apple.productImgArray = [NSMutableArray arrayWithObjects:ipad.productImg,ipod.productImg,iphone.productImg,nil];
    
    //create samsung
    Company *samsung = [[Company alloc] init];
    samsung.companyTitle = @"Samsung mobile devices";
    samsung.companyImg = @"samsung-logo.jpeg";
    
    Product *galaxyS6 = [[Product alloc]init];
    galaxyS6.productName = @"Galaxy S6";
    galaxyS6.productURL = @"http://www.samsung.com/us/explore/galaxy-s6-edge-plus-features-and-specs/?cid=ppc-";
    galaxyS6.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/glaxy";
    
    
    Product *galaxyNote = [[Product alloc]init];
    galaxyNote.productName = @"Galaxy Note";
    galaxyNote.productURL = @"http://www.samsung.com/us/explore/galaxy-note-5-features-and-specs/?cid=ppc-";
    galaxyNote.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/gnote";
    
    Product *galaxyTab = [[Product alloc]init];
    galaxyTab.productName = @"Galaxy Tab";
    galaxyTab.productURL = @"http://www.samsung.com/us/mobile/galaxy-tab/";
    galaxyTab.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/gtab";
    
    samsung.productObjectArray = [NSMutableArray arrayWithObjects:galaxyS6.productName,galaxyNote.productName,galaxyTab.productName, nil];
    samsung.websiteArray = [NSMutableArray arrayWithObjects:galaxyS6.productURL,galaxyNote.productURL,galaxyTab.productURL, nil];
    samsung.productImgArray = [NSMutableArray arrayWithObjects:galaxyS6.productImg,galaxyNote.productImg,galaxyTab.productImg,nil];
    //create HTC
    Company *htc = [[Company alloc] init];
    htc.companyTitle = @"HTC mobile devices";
    htc.companyImg = @"HTC.jpeg";
    
    Product *oneA9 = [[Product alloc]init];
    oneA9.productName = @"ONE A9";
    oneA9.productURL = @"http://www.htc.com/us/smartphones/htc-one-a9/";
    oneA9.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/oneA9";
    
    Product *desire = [[Product alloc]init];
    desire.productName = @"Desire";
    desire.productURL = @"hhttp://www.htc.com/us/smartphones/htc-desire-626/";
    desire.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/desire";
    
    Product *oneM9 = [[Product alloc]init];
    oneM9.productName = @"ONE M9";
    oneM9.productURL = @"http://www.htc.com/us/smartphones/htc-one-m9/";
    oneM9.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/oneM9";
    htc.productObjectArray = [NSMutableArray arrayWithObjects:oneA9.productName,desire.productName,oneM9.productName, nil];
    htc.websiteArray = [NSMutableArray arrayWithObjects:oneA9.productURL,desire.productURL,oneM9.productURL, nil];
    htc.productImgArray = [NSMutableArray arrayWithObjects:oneA9.productImg,desire.productImg,oneM9.productImg, nil];
    
    //create blackberry
    Company *blackberry = [[Company alloc]init];
    blackberry.companyTitle =@"Blackberry mobile devices";
    blackberry.companyImg = @"Blackberry_Logo_without_wordmark.svg";
    
    Product *classic = [[Product alloc]init];
    classic.productName = @"Classic";
    classic.productURL = @"http://us.blackberry.com/smartphones/blackberry-classic/overview.html";
    classic.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/classic";
    
    Product *leap = [[Product alloc]init];
    leap.productName = @"Leap";
    leap.productURL = @"http://us.blackberry.com/smartphones/blackberry-leap/overview.html";
    leap.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/leap";
    
    Product *z30 = [[Product alloc]init];
    z30.productName = @"Z30";
    z30.productURL = @"http://us.blackberry.com/smartphones/blackberry-z30/overview.html";
    z30.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/z30";
    
    blackberry.productObjectArray = [NSMutableArray arrayWithObjects:classic.productName,leap.productName,z30.productName, nil];
    blackberry.websiteArray = [NSMutableArray arrayWithObjects:classic.productURL,leap.productURL,z30.productURL, nil];
    blackberry.productImgArray = [NSMutableArray arrayWithObjects:classic.productImg,leap.productImg,z30.productImg, nil];
    
    self.companyList = [NSMutableArray arrayWithObjects: apple,samsung,htc,blackberry,nil];
    self.companynames = [NSMutableArray arrayWithObjects: apple.companyTitle,samsung.companyTitle,htc.companyTitle,blackberry.companyTitle,nil];
    
    self.imgArray = [NSMutableArray arrayWithObjects: apple.companyImg,samsung.companyImg,htc.companyImg,blackberry.companyImg,nil];
}
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
    }
}

-(void)databaseInfo{
    sqlite3_stmt *statement;
    self.companyList = [[NSMutableArray alloc]init];
    self.companynames = [[NSMutableArray alloc]init];
    self.imgArray = [[NSMutableArray alloc]init];
    self.productObjectArrayTemp = [[NSMutableArray alloc] init];
    self.productIDArray = [[NSMutableArray alloc] init];
    self.tempCompanyList = [[NSMutableArray alloc] init];
    NSInteger tempINT = 0;
    NSUInteger i = 0;
    NSUInteger k = 0;
  
    
    
    
    sqlite3_stmt *statement2;
    
    if (sqlite3_open([self.dbPathString  UTF8String], &_personDB2) == SQLITE_OK) {
        NSString *querySQLTwo = [NSString stringWithFormat:@"SELECT * FROM Product"];
        const char *query_sqlTwo = [querySQLTwo UTF8String];
        NSLog(@"%d",sqlite3_prepare(_personDB2, query_sqlTwo, -1, &statement2, NULL)== SQLITE_OK);
        if (sqlite3_prepare(_personDB2, query_sqlTwo, -1, &statement2, NULL)== SQLITE_OK) {
            while (sqlite3_step(statement2) == SQLITE_ROW) {
                
                k=sqlite3_column_count(statement2)-2;
                
                NSString *name = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 1)];
                NSString *productLogoURL =[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 2)];
                NSString *productURL = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 3)];
                NSString *productID = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement2, 4)];
                Product *product = [[Product alloc]init];
                product.productName = name ;
                product.productURL = productURL;
                product.productImg = productLogoURL;
                product.companyID = [productID integerValue];
                NSNumber *number = [NSNumber numberWithInt:product.companyID];
               
                [self.productIDArray addObject:number];
                [self.productObjectArrayTemp addObject:product];
             
               
                
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
                NSString *companyID = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                NSString *companyName = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                NSString *companyIndex = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 4)];
                NSString *companyPK = [[NSString alloc] initWithUTF8String:(const char*)sqlite3_column_text(statement, 0)];
                self.company = [[Company alloc]init];
                self.company.index = [companyIndex integerValue];
                self.company.companyImg = [[NSString alloc]init];
                self.company.companyImg = companyLogoURL;
                self.company.Pk = [companyPK integerValue];
                self.company.companyTitle = [[NSString alloc]init];
                self.company.companyTitle = companyTitle;
                self.company.ID = [companyID integerValue];
                self.company.companyName = [[NSString alloc]init];
                self.company.companyName = companyName;
                self.company.productObjectArray = [[NSMutableArray alloc]init];
                self.company.productNameArray = [[NSMutableArray alloc]init];
                self.company.websiteArray = [[NSMutableArray alloc]init];
                self.company.productImgArray = [[NSMutableArray alloc]init];
                for (i=0; i<self.productObjectArrayTemp.count; i++) {
                    Product *tempProduct = [[Product alloc] init];
                    tempProduct = self.productObjectArrayTemp[i];
                    if (tempProduct.companyID == self.company.Pk) {
                        [self.company.productObjectArray addObject: tempProduct];
                        [self.company.websiteArray addObject:tempProduct.productURL];
                        [self.company.productImgArray addObject:tempProduct.productImg];
                        [self.company.productNameArray addObject:tempProduct.productName];
                    }
                    
                }
                [self.tempCompanyList addObject:self.company];
                tempINT ++;
                if (tempINT==self.max) {
                    for (int z = 0; z<self.max ; z++) {
                        [self.companyList addObject:@""];
                        [self.companynames addObject:@""];
                        [self.imgArray addObject:@""];
                    }
                    for (int z = 0; z<self.max ; z++) {
                        self.company = [[Company alloc]init];
                        self.company = self.tempCompanyList[z];
                        for (int b = 0; b<self.max; b++) {
                            self.company2 = [[Company alloc] init];
                            if (self.company.ID>self.company2.ID) {
                                [self.companyList replaceObjectAtIndex:z withObject:self.company];
                                [self.companynames replaceObjectAtIndex:z withObject:self.company.companyTitle];
                                [self.imgArray replaceObjectAtIndex:z withObject:self.company.companyImg];
                            }else if (self.company.ID < self.company2.ID){
                                [self.companyList replaceObjectAtIndex:(z-1) withObject:self.company];
                                [self.companynames replaceObjectAtIndex:(z-1) withObject:self.company.companyTitle];
                                [self.imgArray replaceObjectAtIndex:(z-1) withObject:self.company.companyImg];
                            }
                            
                            }
                        }
                        
                    
                    
                  
                }
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(_personDB);
    }
    
    
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
@end
