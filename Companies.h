//
//  Companies.h
//  NavCtrl
//
//  Created by harry bloch on 3/3/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Companies.h"
#import "Dao.h"

@class Products;

NS_ASSUME_NONNULL_BEGIN

@interface Companies : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+(Companies *)companyWithID:(NSInteger)ID inManagedObjectContext:(NSManagedObjectContext *) context;

@end

NS_ASSUME_NONNULL_END

#import "Companies+CoreDataProperties.h"
