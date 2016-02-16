//
//  Company.h
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property(nonatomic,strong) NSMutableArray *productObjectArray;
@property(nonatomic,strong) NSString *companyTitle;
@property(nonatomic,strong) NSString *companyImg;
@property(nonatomic,strong) NSMutableArray *websiteArray;
@property(nonatomic,strong)NSMutableArray *productImgArray;
@end
