//
//  WebSitViewController.h
//  NavCtrl
//
//  Created by harry bloch on 2/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebSitViewController : UIViewController


@property(nonatomic,strong) NSURL *websiteUrl;
@property(nonatomic,strong) WKWebView *webView;


@end
