//
//  Dao.h
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "Company.h"
#import <sqlite3.h>
#import "Products.h"
#import "Products+CoreDataProperties.h"
#import "MyDataController.h"

@interface Dao : NSObject



@property(nonatomic,strong)NSMutableArray *companyList;
@property(nonatomic,strong)NSMutableArray *TempcompanyList;
@property(nonatomic,strong)NSMutableArray *products;
@property(nonatomic,strong)NSMutableArray *TempProducts;


//@property (nonatomic, strong) NSString *dbPathString;
//
//@property (nonatomic) sqlite3 *personDB;
//@property (nonatomic) sqlite3 *personDB2;
//@property (nonatomic) sqlite3 *countDB;
//@property (nonatomic) sqlite3 *deleteCompany;
//@property (nonatomic) sqlite3 *deleteProduct;
//
//@property (nonatomic,retain)  Company *company2;
//
//@property (nonatomic,strong) NSMutableArray *productIDArray;
//@property (nonatomic) NSInteger max;
//@property (nonatomic) NSInteger productMax;
//@property (nonatomic) NSInteger tempINT;
//@property (nonatomic) NSInteger counter;







+(id)sharedManager;
-(void)createCompanies;
//-(void)openDB;
//-(void)databaseInfo;
//-(void)deleteFromDBCompany:(NSString*)query;
//-(void)deleteFromDBProduct:(NSString*)query;
//-(void)countRows;
//-(void)sqlPers:(NSString*)query;
//-(void)reArrange;
//-(void)productReArrange:(Company*)company;
//-(NSInteger)countProductRows:(NSString*)query;
//-(void)manageADDForum:(Company *)newCompany;
//-(void)manageEditForum:(Company *)editedCompany;

@end
