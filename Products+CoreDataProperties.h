//
//  Products+CoreDataProperties.h
//  NavCtrl
//
//  Created by harry bloch on 3/15/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Products.h"

NS_ASSUME_NONNULL_BEGIN

@interface Products (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *companyID;
@property (nullable, nonatomic, retain) NSString *img;
@property (nullable, nonatomic, retain) NSNumber *index;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *pK;
@property (nullable, nonatomic, retain) NSString *webSite;

@end

NS_ASSUME_NONNULL_END
