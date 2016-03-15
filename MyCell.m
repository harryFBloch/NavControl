//
//  MyCell.m
//  NavCtrl
//
//  Created by harry bloch on 3/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc {
    [_cellLogo release];
    [_cellLabel release];
    [super dealloc];
}
@end
