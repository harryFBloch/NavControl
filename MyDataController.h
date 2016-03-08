//
//  MyDataController.h
//  NavCtrl
//
//  Created by harry bloch on 3/3/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Companies.h"
#import "Products.h"
#import "Company.h"
#import "Product.h"
#import "Dao.h"

@interface MyDataController : NSObject

@property (strong) NSManagedObjectContext *managedObjectContext;
@property(strong) NSManagedObjectModel *model;
@property(nonatomic,strong) NSMutableArray *companies;
@property(nonatomic,strong) NSMutableArray *produtcs;
@property(nonatomic) NSInteger tempInt;

-(NSString *) archivePath;
-(void)initModelContext;
-(NSMutableArray *)loadAllFromDB:(NSString *)entityName;
-(void) saveChanges;
-(void)CreateCompany:(NSString *)name companyTitle:(NSString *)title CompanyImg:(NSString *)img companyIDnumber:(NSNumber *)companyID index:(NSNumber *)index;
-(void)CreateProducts:(NSString *)name productURl:(NSString *)url productImg:(NSString *)img companyID:(NSNumber *)ID index:(NSNumber *)index primaryKey:(NSNumber *)key;
-(void)DeleteCompany:(NSInteger)index;
-(void)deleteProduct:(Product *)product;
-(void)companyRearrange;
-(void)ProductRearrange:(Company *)currentCompany;
-(void)addCompany:(Company *)company;
-(void)editComany:(Company *)company;
-(void)undoButton;
+(id)sharedManager;

@end
