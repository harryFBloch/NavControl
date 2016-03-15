//
//  MYCollectionViewController.h
//  NavCtrl
//
//  Created by harry bloch on 3/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dao.h"
#import "MyDataController.h"
#import "Company.h"
#import "ProductCollectionViewController.h"

@interface MYCollectionViewController : UICollectionViewController

@property (nonatomic, retain) Dao *data;
@property (nonatomic ,retain) MyDataController *coreData;
@property (nonatomic) BOOL isDeleting;
@property (nonatomic) NSInteger deletingInt;
@property (nonatomic,strong)UIBarButtonItem *deleteButton;

@end
