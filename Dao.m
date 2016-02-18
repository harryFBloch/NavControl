//
//  Dao.m
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Dao.h"

@implementation Dao

+(id)sharedManager{
    static Dao *DaoManager = nil;
    @synchronized(self) {
        if (DaoManager == nil) {
            DaoManager = [[self alloc]init];
        }
    }
    return DaoManager;
}
-(void)createCompanies{
    
    if (self.arrayOfProductArrays == nil) {
        
    
    //create apple
    Company *apple = [[Company alloc] init];
    apple.companyTitle = @"Apple mobile devices";
    apple.companyImg = @"http://logok.org/wp-content/uploads/2014/04/Apple-Logo-rainbow.png";
    
    //create apple products
    Product *ipad = [[Product alloc]init];
    ipad.productName = @"iPad";
    ipad.productURL = @"http://www.apple.com/ipad/";
    ipad.productImg = @"https://www.apple.com/support/assets/images/products/ipad/hero_ipad_family_2015_2x.jpg";
    Product *ipod = [[Product alloc]init];
    ipod.productName = @"iPod Touch";
    ipod.productURL = @"http://www.apple.com/shop/buy-ipod/ipod-touch?afid=p238%7CsKVyypZcE-dc_mtid_1870765e38482_pcrid_91262087527_&cid=aos-us-kwg-ipod-slid-";
    ipod.productImg = @"https://www.apple.com/support/assets/images/products/ipodtouch/hero_ipodtouch6_2015.jpg";
    Product *iphone= [[Product alloc]init];
    iphone.productName = @"iPhone";
    iphone.productURL = @"http://www.apple.com/iphone/?afid=p238%7CsGy8lsjhy-dc_mtid_1870765e38482_pcrid_99437624767_&cid=aos-us-kwg-iphone-slid-";
    iphone.productImg = @"https://www.apple.com/support/assets/images/products/iphone/hero_iphone_6s_2x.png";
    
    //store apple products in array
    apple.productArray = [NSMutableArray arrayWithObjects:ipad.productName,ipod.productName,iphone.productName,nil ];
    apple.websiteArray = [NSMutableArray arrayWithObjects:ipad.productURL,ipod.productURL,iphone.productURL, nil];
    apple.productImgArray = [NSMutableArray arrayWithObjects:ipad.productImg,ipod.productImg,iphone.productImg,nil];
    apple.productObjectArray = [NSMutableArray arrayWithObjects:ipad,ipod,iphone, nil];
    
    //create samsung
    Company *samsung = [[Company alloc] init];
    samsung.companyTitle = @"Samsung mobile devices";
    samsung.companyImg = @"http://files.technobezz.com/files/uploads/2014/06/samsung-boot.jpg";
    
    Product *galaxyS6 = [[Product alloc]init];
    galaxyS6.productName = @"Galaxy S6";
    galaxyS6.productURL = @"http://www.samsung.com/us/explore/galaxy-s6-edge-plus-features-and-specs/?cid=ppc-";
    galaxyS6.productImg = @"http://www.samsung.com/in/consumer-images/product/mobile-phone/2015/SM-G920IZDAINS/features/SM-G920IZDAINS-403979-2.jpg";
    
    
    Product *galaxyNote = [[Product alloc]init];
    galaxyNote.productName = @"Galaxy Note";
    galaxyNote.productURL = @"http://www.samsung.com/us/explore/galaxy-note-5-features-and-specs/?cid=ppc-";
    galaxyNote.productImg = @"http://cdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-note-i717-ofic.jpg";
    
    Product *galaxyTab = [[Product alloc]init];
    galaxyTab.productName = @"Galaxy Tab";
    galaxyTab.productURL = @"http://www.samsung.com/us/mobile/galaxy-tab/";
    galaxyTab.productImg = @"http://cdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-tab-ofic-3.jpg";
    
    samsung.productArray = [NSMutableArray arrayWithObjects:galaxyS6.productName,galaxyNote.productName,galaxyTab.productName, nil];
    samsung.websiteArray = [NSMutableArray arrayWithObjects:galaxyS6.productURL,galaxyNote.productURL,galaxyTab.productURL, nil];
    samsung.productImgArray = [NSMutableArray arrayWithObjects:galaxyS6.productImg,galaxyNote.productImg,galaxyTab.productImg,nil];
    samsung.productObjectArray = [NSMutableArray arrayWithObjects:galaxyS6,galaxyNote,galaxyTab, nil];
    //create HTC
    Company *htc = [[Company alloc] init];
    htc.companyTitle = @"HTC mobile devices";
    htc.companyImg = @"http://www.norebbo.com/wp-content/uploads/2012/02/melt_htc.jpg";
    
    Product *oneA9 = [[Product alloc]init];
    oneA9.productName = @"ONE A9";
    oneA9.productURL = @"http://www.htc.com/us/smartphones/htc-one-a9/";
    oneA9.productImg = @"http://cnet4.cbsistatic.com/hub/i/r/2015/10/19/eb3b7231-4293-4d97-8573-5edb055f03da/thumbnail/770x433/1e9eea63bc946c6b5730694cc42ba74f/fd-htc-one-a9-product-nda.jpg";
    
    Product *desire = [[Product alloc]init];
    desire.productName = @"Desire";
    desire.productURL = @"hhttp://www.htc.com/us/smartphones/htc-desire-626/";
    desire.productImg = @"http://www.htc.com/managed-assets/shared/desktop/smartphones/htc-desire-626/en-us/att/sketchfab/htc-desire-626-en_us-att-marine-white-sketchfab.png";
    
    Product *oneM9 = [[Product alloc]init];
    oneM9.productName = @"ONE M9";
    oneM9.productURL = @"http://www.htc.com/us/smartphones/htc-one-m9/";
    oneM9.productImg = @"http://www.htc.com/managed-assets/shared/desktop/smartphones/htc-one-m9/Sketchfab/htc-one-m9-global-sketchfab-gunmetal.png";
    htc.productArray = [NSMutableArray arrayWithObjects:oneA9.productName,desire.productName,oneM9.productName, nil];
    htc.websiteArray = [NSMutableArray arrayWithObjects:oneA9.productURL,desire.productURL,oneM9.productURL, nil];
    htc.productImgArray = [NSMutableArray arrayWithObjects:oneA9.productImg,desire.productImg,oneM9.productImg, nil];
    htc.productObjectArray = [NSMutableArray arrayWithObjects:oneA9,desire,oneM9, nil];
    
    //create blackberry
    Company *blackberry = [[Company alloc]init];
    blackberry.companyTitle =@"Blackberry mobile devices";
    blackberry.companyImg = @"http://siliconangle.com/files/2015/04/blackberry-logo.jpg";
    
    Product *classic = [[Product alloc]init];
    classic.productName = @"Classic";
    classic.productURL = @"http://us.blackberry.com/smartphones/blackberry-classic/overview.html";
    classic.productImg = @"https://rimblogs.files.wordpress.com/2014/12/classic_black_2device-v2.jpg";
    
    Product *leap = [[Product alloc]init];
    leap.productName = @"Leap";
    leap.productURL = @"http://us.blackberry.com/smartphones/blackberry-leap/overview.html";
    leap.productImg = @"http://o.aolcdn.com/hss/storage/midas/52df4a7a20deb754db9f3dbb4f77805d/201633836/leap-fb.jpg";
    
    Product *z30 = [[Product alloc]init];
    z30.productName = @"Z30";
    z30.productURL = @"http://us.blackberry.com/smartphones/blackberry-z30/overview.html";
    z30.productImg = @"http://us.blackberry.com/content/dam/bbCompany/Desktop/Global/Device/Z30/Z30_Front.jpg";
    
    blackberry.productArray = [NSMutableArray arrayWithObjects:classic.productName,leap.productName,z30.productName, nil];
    blackberry.websiteArray = [NSMutableArray arrayWithObjects:classic.productURL,leap.productURL,z30.productURL, nil];
    blackberry.productImgArray = [NSMutableArray arrayWithObjects:classic.productImg,leap.productImg,z30.productImg, nil];
    blackberry.productObjectArray = [NSMutableArray arrayWithObjects:classic,leap,z30, nil];
    
    self.companyList = [NSMutableArray arrayWithObjects: apple,samsung,htc,blackberry,nil];
    self.companynames = [NSMutableArray arrayWithObjects: apple.companyTitle,samsung.companyTitle,htc.companyTitle,blackberry.companyTitle,nil];
    
    self.imgArray = [NSMutableArray arrayWithObjects: apple.companyImg,samsung.companyImg,htc.companyImg,blackberry.companyImg,nil];
    self.arrayOfProductArrays = [NSMutableArray arrayWithObjects:apple.productObjectArray,samsung.productObjectArray,htc.productObjectArray,blackberry.productObjectArray, nil];
}
}
@end












