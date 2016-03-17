//
//  MyDataController.m
//  NavCtrl
//
//  Created by harry bloch on 3/3/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "MyDataController.h"
#import "AFNetworking.h"
#import "MYCollectionViewController.h"


@implementation MyDataController
+(id)sharedManager{
    static MyDataController *DaoManager = nil;
    @synchronized(self) {
        if (DaoManager == nil) {
            DaoManager = [[self alloc]init];
        }
    }
    return DaoManager;
}

-(NSString *) archivePath{
    NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentsDirectories objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"store.data"];
}
-(void)initModelContext{
    _model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    NSString *path = [self archivePath];
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        [NSException raise:@"OPEN FAILED" format:@"REASON:%@", [error localizedDescription]];
    }
    _managedObjectContext = [[NSManagedObjectContext alloc]init];
    [_managedObjectContext setPersistentStoreCoordinator:psc];
    _managedObjectContext.undoManager = [[[NSUndoManager alloc]init]autorelease];
}
-(NSMutableArray *)loadAllFromDB:(NSString *)entityName{
    if (_tempInt == 0) {
        
    
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
        NSEntityDescription *e = [[_model entitiesByName] objectForKey:entityName];
        [request setEntity:e];
        NSError *error = nil;
        NSArray *result = [_managedObjectContext executeFetchRequest:request error:&error];
        [request release];
        if (!result) {
            [NSException raise:@"FETCH FAILED" format:@"REASON:%@",[error localizedDescription]];
        }
        self.companies = [[NSMutableArray alloc]initWithArray:result];
        _tempInt ++;
        return self.companies;
        
    }else{
        
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
        NSEntityDescription *e = [[_model entitiesByName] objectForKey:entityName];
        [request setEntity:e];
        NSError *error = nil;
        NSArray *result = [_managedObjectContext executeFetchRequest:request error:&error];
        [request release];
        if (!result) {
            [NSException raise:@"FETCH FAILED" format:@"REASON:%@",[error localizedDescription]];
        }
        self.produtcs = [[NSMutableArray alloc]initWithArray:result];
        return self.produtcs;
    }
  
    
}

-(void) saveChanges
{
    NSError *err = nil;
    BOOL successful = [_managedObjectContext save:&err];
    if(!successful){
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    NSLog(@"Data Saved");
}

-(void)CreateCompany:(NSString *)name companyTitle:(NSString *)title CompanyImg:(NSString *)img companyIDnumber:(NSNumber *)companyID index:(NSNumber *)index stockSymbol:(NSString *)symbol{
//    [self saveChanges];

    if (!self.companies) {
        self.companies = [[NSMutableArray alloc]init];
    }
    
    Companies *c = [NSEntityDescription insertNewObjectForEntityForName:@"Companies" inManagedObjectContext:_managedObjectContext];
    [[[self managedObjectContext]undoManager]beginUndoGrouping];
    [c setCompanyID: companyID];
    [c setImg: img];
    [c setName: name];
    [c setTitle: title];
    [c setStockSymbol:symbol];
    [c setIndex:index];
    [c setPk:index];
    [self.companies addObject: c];
    [[[self managedObjectContext]undoManager]endUndoGrouping];
}
-(void)CreateProducts:(NSString *)name productURl:(NSString *)url productImg:(NSString *)img companyID:(NSNumber *)ID index:(NSNumber *)index primaryKey:(NSNumber *)key{
//    [self saveChanges];

    Products *p = [NSEntityDescription insertNewObjectForEntityForName:@"Products" inManagedObjectContext:_managedObjectContext];
    if (!self.produtcs) {
        self.produtcs = [[NSMutableArray alloc]init];
    }
    [p setCompanyID: ID];
    [p setName: name];
    [p setImg: img];
    [p setWebSite:url];
    [p setIndex:index];
    [p setPK:key];
    [self.produtcs addObject:p];
}
-(void)DeleteCompany:(NSInteger)index{
//    [self saveChanges];
    Companies *c = self.companies[index];
    [self.companies removeObject:c];

    [_managedObjectContext deleteObject:c];
        for (int i = 0; i<self.companies.count; i++) {
            Companies *temp = self.companies[i];
            temp.index = [NSNumber numberWithInteger: i];
        }

    
}
-(void)deleteProduct:(Company *)currentCompany product:(Product *)deletedProduct{
//     [self saveChanges];
    
    Products *p = self.produtcs[deletedProduct.PK];
    [self.produtcs removeObject:p];
    [_managedObjectContext deleteObject:p];
    NSInteger j = 0;
    for (int i = 0 ; i<self.produtcs.count ; i++) {
       Products *product = self.produtcs[i];

        if ([product.companyID integerValue] == currentCompany.ID) {
            NSNumber *indexTemp = [NSNumber numberWithInteger:j];
            product.index = indexTemp;
            j++;
        }
    }
}

-(void)companyRearrange{

    for (int i = 0 ; i<self.companies.count; i++) {
        Companies *temp = self.companies[i];
        NSNumber *tempInt = [NSNumber numberWithInteger:i];
        [temp setPk:tempInt];
        [temp setIndex:tempInt];
    }
    
}
-(void)ProductRearrange:(Company *)currentCompany{
    
    for (int i = 0; i<currentCompany.productObjectArray.count; i++) {
        Product *tempP = currentCompany.productObjectArray[i];
        Products *temp = self.produtcs[tempP.PK];
            NSNumber *tempINT = [NSNumber numberWithInteger:i];
            [temp setIndex:tempINT];
        
        
    }
}

-(void)addCompany:(Company *)company{

    NSNumber *temp1 = [NSNumber numberWithInteger:company.ID];
    NSNumber *temp2 = [NSNumber numberWithInteger:company.index];
    
    [self CreateCompany:company.companyName
           companyTitle:company.companyTitle
             CompanyImg:company.companyImg
        companyIDnumber:temp1
                  index:temp2
            stockSymbol:company.stockSymbol];
    
    for (int i = 0; i<company.productObjectArray.count; i++) {
        Product *p = company.productObjectArray[i];
        NSNumber *temp4 = [NSNumber numberWithInteger:company.ID];
        NSNumber *temp5 = [NSNumber numberWithInteger:p.index];
        NSNumber *temp6 = [NSNumber numberWithInteger:p.PK];
        [self CreateProducts:p.productName productURl:p.productURL productImg:p.productImg companyID:temp4 index:temp5 primaryKey:temp6];
    }
  
}
-(void)editComany:(Company *)company{


    NSNumber *temp1 = [NSNumber numberWithInteger:company.ID];
     NSNumber *temp2 = [NSNumber numberWithInteger:company.index];
     NSNumber *temp3 = [NSNumber numberWithInteger:company.Pk];
    NSInteger j = 0;
    Companies *c = self.companies[company.Pk];
    [c setCompanyID: temp1];
    [c setImg: company.companyImg];
    [c setName: company.companyName];
    [c setTitle: company.companyTitle];
    [c setIndex: temp2];
    [c setPk: temp3];
    
    for (int i = 0; i<self.produtcs.count; i++) {
        Products *p = self.produtcs[i];
        if ([p.companyID integerValue] == company.ID) {
            Product *product = company.productObjectArray[j];
            NSNumber *temp4 = [NSNumber numberWithInteger:product.companyID];
            NSNumber *temp5 = [NSNumber numberWithInteger:product.index];
            NSNumber *temp6 = [NSNumber numberWithInteger:product.PK];
            [p setCompanyID: temp4];
            [p setName: product.productName];
            [p setImg: product.productImg];
            [p setWebSite:product.productURL];
            [p setIndex:temp5];
            [p setPK:temp6];
            j++;
        }
    }
    
}
-(void)undoButton{
    [self.managedObjectContext undo];
    [self.managedObjectContext save:nil];
    self.tempInt = 0;
    Dao *data = [Dao sharedManager];
    [data createCompanies];
}

-(void)addProduct:(Product *)product{
    NSNumber *temp1 = [NSNumber numberWithInteger:product.companyID];
    NSNumber *temp2 = [NSNumber numberWithInteger:product.index];
    NSNumber *temp3 = [NSNumber numberWithInteger:product.PK];
    [self CreateProducts:product.productName productURl:product.productURL productImg:product.productImg companyID:temp1 index:temp2 primaryKey:temp3];
}

-(Company *)productUndo:(NSInteger)currentCompanyPK;{
    [self.managedObjectContext undo];
    [self.managedObjectContext save:nil];
    self.tempInt = 0;
    Dao *data = [Dao sharedManager];
    [data createCompanies];
    
    Company *tempCompany = data.companyList[currentCompanyPK];
    
    return tempCompany;
}

-(void)CompanyLoop{
    Dao *data = [Dao sharedManager];
    NSMutableString *stockSymbols = [[NSMutableString alloc]init];
    for (int i = 0;i < data.companyList.count; i++) {
        NSString *stockSymbol = [NSString stringWithFormat:@",%@",[data.companyList[i] stockSymbol]];
        [stockSymbols appendString:stockSymbol];
    }
    [self getStockPriceforCompany:stockSymbols];
    [stockSymbols release];
    
}
-(void)getStockPriceforCompany:(NSString *)queryString{
    if (!self.stockprices ) {
        self.stockprices = [[NSMutableArray alloc]init];
    }else{
        self.stockprices = nil;
        self.stockprices = [[NSMutableArray alloc]init];
    }
    NSLog(@"STRING:\t%@",queryString);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *stockSybolString = [NSString stringWithFormat:@"http://finance.yahoo.com/webservice/v1/symbols/%@/quote?format=json",queryString];
    NSURL *URL = [NSURL URLWithString:stockSybolString];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject){
        NSLog(@"JSON: %@",responseObject);
        NSDictionary *responseDict = responseObject;
        for (int i = 0; i<[[responseDict valueForKeyPath:@"list.resources"] count]; i++) {
            [self.stockprices addObject:[[[responseDict valueForKeyPath:@"list.resources" ] objectAtIndex:i] valueForKeyPath:@"resource.fields.price"]];
        }
        NSLog(@"%@",self.stockprices);
        [self CompanyAddPrice:self.stockprices];
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error){
        NSLog(@"Error: %@",error);
    }];
    [_stockprices autorelease];
}
-(void)CompanyAddPrice:(NSMutableArray *)priceArray{
    Dao *data = [Dao sharedManager];
    for (int i =0; i<data.companyList.count; i++) {
        Company *tempCompany = data.companyList[i];
             tempCompany.stockPrice = priceArray[i];
    }
}

@end