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

@interface Dao : NSObject


@property (nonatomic, strong) NSMutableArray *imgArray;
@property (nonatomic, strong) NSMutableArray *companyList;
@property (nonatomic, strong) NSMutableArray *companynames;
@property (nonatomic, strong) NSMutableArray *arrayOfProductArrays;
@property (nonatomic, strong) NSMutableArray *tickerNamesArary;
@property (nonatomic, strong) NSMutableArray *stockpriceArray;

+(id)sharedManager;
-(void)createCompanies;

@end
