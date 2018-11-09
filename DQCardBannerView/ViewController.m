//
//  ViewController.m
//  DQCardBannerView
//
//  Created by edz on 2018/5/28.
//  Copyright © 2018年 DQ. All rights reserved.
//

#import "ViewController.h"
#import "DQCardBannerView.h"

@interface ViewController () <DQCardBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    DQCardBannerView *cardBanner = [DQCardBannerView DQCardBannerViewWithFrame:CGRectMake(0, 200, 375, 150) delegate:self];
    cardBanner.imageUrlArray = [[NSMutableArray alloc] initWithArray:@[@"123", @"123123", @"222", @"1", @"22"]];
    cardBanner.delegate = self;
    [self.view addSubview:cardBanner];

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
