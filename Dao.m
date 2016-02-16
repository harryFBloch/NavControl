//
//  Dao.m
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Dao.h"

@implementation Dao
-(void)createCompanies{
    
    //create apple
    Company *apple = [[Company alloc] init];
    apple.companyTitle = @"Apple mobile devices";
    apple.companyImg = @"apple.png";
    
    //create apple products
    Product *ipad = [[Product alloc]init];
    ipad.productName = @"iPad";
    ipad.productURL = @"http://www.apple.com/ipad/";
    ipad.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/ipad";
    Product *ipod = [[Product alloc]init];
    ipod.productName = @"iPod Touch";
    ipod.productURL = @"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_91262087527_&cid=aos-us-kwg-ipod-slid-";
    ipod.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/ipod-touch-product-initial-2015";
    Product *iphone= [[Product alloc]init];
    iphone.productName = @"iPhone";
    iphone.productURL = @"http://www.apple.com/iphone/?afid=p238%7CsGy8lsjhy-dc_mtid_1870765e38482_pcrid_99437624767_&cid=aos-us-kwg-iphone-slid-";
    iphone.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/iphone";
    
    //store apple products in array
    apple.productObjectArray = [NSMutableArray arrayWithObjects:ipad.productName,ipod.productName,iphone.productName,nil ];
    apple.websiteArray = [NSMutableArray arrayWithObjects:ipad.productURL,ipod.productURL,iphone.productURL, nil];
    apple.productImgArray = [NSMutableArray arrayWithObjects:ipad.productImg,ipod.productImg,iphone.productImg,nil];
    
    //create samsung
    Company *samsung = [[Company alloc] init];
    samsung.companyTitle = @"Samsung mobile devices";
    samsung.companyImg = @"samsung-logo.jpeg";
    
    Product *galaxyS6 = [[Product alloc]init];
    galaxyS6.productName = @"Galaxy S6";
    galaxyS6.productURL = @"http://www.samsung.com/us/explore/galaxy-s6-edge-plus-features-and-specs/?cid=ppc-";
    galaxyS6.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/glaxy";
    
    
    Product *galaxyNote = [[Product alloc]init];
    galaxyNote.productName = @"Galaxy Note";
    galaxyNote.productURL = @"http://www.samsung.com/us/explore/galaxy-note-5-features-and-specs/?cid=ppc-";
    galaxyNote.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/gnote";
    
    Product *galaxyTab = [[Product alloc]init];
    galaxyTab.productName = @"Galaxy Tab";
    galaxyTab.productURL = @"http://www.samsung.com/us/mobile/galaxy-tab/";
    galaxyTab.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/gtab";
    
    samsung.productObjectArray = [NSMutableArray arrayWithObjects:galaxyS6.productName,galaxyNote.productName,galaxyTab.productName, nil];
    samsung.websiteArray = [NSMutableArray arrayWithObjects:galaxyS6.productURL,galaxyNote.productURL,galaxyTab.productURL, nil];
    samsung.productImgArray = [NSMutableArray arrayWithObjects:galaxyS6.productImg,galaxyNote.productImg,galaxyTab.productImg,nil];
    //create HTC
    Company *htc = [[Company alloc] init];
    htc.companyTitle = @"HTC mobile devices";
    htc.companyImg = @"HTC.jpeg";
    
    Product *oneA9 = [[Product alloc]init];
    oneA9.productName = @"ONE A9";
    oneA9.productURL = @"http://www.htc.com/us/smartphones/htc-one-a9/";
    oneA9.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/oneA9";
    
    Product *desire = [[Product alloc]init];
    desire.productName = @"Desire";
    desire.productURL = @"hhttp://www.htc.com/us/smartphones/htc-desire-626/";
    desire.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/desire";
    
    Product *oneM9 = [[Product alloc]init];
    oneM9.productName = @"ONE M9";
    oneM9.productURL = @"http://www.htc.com/us/smartphones/htc-one-m9/";
    oneM9.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/oneM9";
    htc.productObjectArray = [NSMutableArray arrayWithObjects:oneA9.productName,desire.productName,oneM9.productName, nil];
    htc.websiteArray = [NSMutableArray arrayWithObjects:oneA9.productURL,desire.productURL,oneM9.productURL, nil];
    htc.productImgArray = [NSMutableArray arrayWithObjects:oneA9.productImg,desire.productImg,oneM9.productImg, nil];
    
    //create blackberry
    Company *blackberry = [[Company alloc]init];
    blackberry.companyTitle =@"Blackberry mobile devices";
    blackberry.companyImg = @"Blackberry_Logo_without_wordmark.svg";
    
    Product *classic = [[Product alloc]init];
    classic.productName = @"Classic";
    classic.productURL = @"http://us.blackberry.com/smartphones/blackberry-classic/overview.html";
    classic.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/classic";
    
    Product *leap = [[Product alloc]init];
    leap.productName = @"Leap";
    leap.productURL = @"http://us.blackberry.com/smartphones/blackberry-leap/overview.html";
    leap.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/leap";
    
    Product *z30 = [[Product alloc]init];
    z30.productName = @"Z30";
    z30.productURL = @"http://us.blackberry.com/smartphones/blackberry-z30/overview.html";
    z30.productImg = @"/Users/harry/Desktop/dev/objective_c/navControl/pics/z30";
    
    blackberry.productObjectArray = [NSMutableArray arrayWithObjects:classic.productName,leap.productName,z30.productName, nil];
    blackberry.websiteArray = [NSMutableArray arrayWithObjects:classic.productURL,leap.productURL,z30.productURL, nil];
    blackberry.productImgArray = [NSMutableArray arrayWithObjects:classic.productImg,leap.productImg,z30.productImg, nil];
    
    self.companyList = [NSMutableArray arrayWithObjects: apple,samsung,htc,blackberry,nil];
    self.companynames = [NSMutableArray arrayWithObjects: apple.companyTitle,samsung.companyTitle,htc.companyTitle,blackberry.companyTitle,nil];
    
    self.imgArray = [NSMutableArray arrayWithObjects: apple.companyImg,samsung.companyImg,htc.companyImg,blackberry.companyImg,nil];
}

@end
