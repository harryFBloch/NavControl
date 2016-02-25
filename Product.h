//
//  Product.h
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property(nonatomic,strong)NSString *productName;
@property(nonatomic,strong)NSString *productURL;
@property(nonatomic,strong)NSString *productImg;
@property(nonatomic) NSInteger companyID;


@end
