//
//  MyDataController.m
//  NavCtrl
//
//  Created by harry bloch on 3/3/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "MyDataController.h"

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
    [_managedObjectContext setUndoManager:nil];
}
-(NSMutableArray *)loadAllFromDB:(NSString *)entityName{
    if (_tempInt == 0) {
        
    
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
        NSEntityDescription *e = [[_model entitiesByName] objectForKey:entityName];
        [request setEntity:e];
        NSError *error = nil;
        NSArray *result = [_managedObjectContext executeFetchRequest:request error:&error];
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

-(void)CreateCompany:(NSString *)name companyTitle:(NSString *)title CompanyImg:(NSString *)img companyIDnumber:(NSNumber *)companyID index:(NSNumber *)index;{
//    [self saveChanges];

    if (!self.companies) {
        self.companies = [[NSMutableArray alloc]init];
    }
    Companies *c = [NSEntityDescription insertNewObjectForEntityForName:@"Companies" inManagedObjectContext:_managedObjectContext];
    
    [c setCompanyID: companyID];
    [c setImg: img];
    [c setName: name];
    [c setTitle: title];
    [c setIndex:index];
    [c setPk:index];
    [self.companies addObject: c];
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
    [_managedObjectContext deleteObject:c];
    [self.companies removeObjectAtIndex:index];
    for (int i = 0; i<self.companies.count; i++) {
        Companies *temp = self.companies[i];
        temp.index = [NSNumber numberWithInteger: i];
    }

    
}
-(void)deleteProduct:(Product *)product{
//     [self saveChanges];
    Products *p = self.produtcs[product.PK];
    [_managedObjectContext deleteObject:p];
   
    
    
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
    NSInteger j = 0;
//       [self saveChanges];
    for (int i = 0; i<self.produtcs.count; i++) {
        Products *temp = self.produtcs[i];
        NSInteger tempint = [temp.companyID integerValue];
        if (tempint == currentCompany.ID) {
            NSNumber *tempINT = [NSNumber numberWithInteger:j];
            [temp setIndex:tempINT];
            j++;
          
        }
       
    }
}

-(void)addCompany:(Company *)company{

    NSNumber *temp1 = [NSNumber numberWithInteger:company.ID];
    NSNumber *temp2 = [NSNumber numberWithInteger:company.index];
    [self CreateCompany:company.companyName companyTitle:company.companyTitle CompanyImg:company.companyImg companyIDnumber:temp1 index:temp2];
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
    self.tempInt = 0;
    Dao *data = [Dao sharedManager];
    [data createCompanies];
}

@end
