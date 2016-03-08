//
//  Companies.m
//  NavCtrl
//
//  Created by harry bloch on 3/3/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Companies.h"
#import "Products.h"

@implementation Companies

// Insert code here to add functionality to your managed object subclass
+(Companies *)companyWithID:(NSInteger)ID inManagedObjectContext:(NSManagedObjectContext *) context{
    Companies *company = nil;
    Company *currentCompany = [[Company alloc]init];
    Dao *data = [Dao sharedManager];
    for (int i=0; i<data.companyList.count; i++) {
        currentCompany = data.companyList[i];
        
        if (currentCompany.Pk == ID) {
            break;
        }
    }
    
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Companies"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@",currentCompany.companyName];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || ([matches count] > 1)) {
        NSLog(@"ERROR\n%@",[error localizedDescription]);
    } else if ([matches count]) {
        company = [matches firstObject];
    }else{
        company = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:context];
        company.name = currentCompany.companyName;
        company.title = currentCompany.companyTitle;
        company.img = currentCompany.companyImg;
    }
    return company;
}



@end
