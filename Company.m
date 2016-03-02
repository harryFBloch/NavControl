//
//  Company.m
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

+(id)CompanyManager{
    static Company *companyManager = nil;
    @synchronized(self) {
        if (companyManager == nil) {
            companyManager = [[self alloc]init];
        }
    }
    return companyManager;
}

@end
