//
//  CollectionViewController.h
//  NavCtrl
//
//  Created by harry bloch on 3/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dao.h"

@interface CollectionViewController : UICollectionViewController

@property (nonatomic,retain) Dao *data;

@property (retain, nonatomic) IBOutlet UICollectionView *viewOutlet;




@end
