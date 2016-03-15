//
//  ProductCollectionViewController.h
//  NavCtrl
//
//  Created by harry bloch on 3/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "Company.h"

@interface ProductCollectionViewController : UICollectionViewController

@property (nonatomic , retain) Company * currentCompany;
@property (nonatomic , retain) Product * tempProduct;
@property (nonatomic,strong)UIBarButtonItem *deleteButton;

@property (nonatomic) BOOL isDeleting;
@property (nonatomic) NSInteger deletingInt;

@end
