//
//  WebsiteViewCon.h
//  NavCtrl
//
//  Created by harry bloch on 2/11/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebsiteViewCon : UIViewController

@property(nonatomic,strong) NSArray *webSiteArray;
@property(nonatomic,strong) NSURL *websiteUrl;
@property(nonatomic,strong) UIWebView *webView;


@end
