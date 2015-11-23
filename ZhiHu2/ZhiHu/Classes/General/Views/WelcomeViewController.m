//
//  WelcomeViewController.m
//  ZhiHu
//
//  Created by 高升 on 15/11/21.
//  Copyright © 2015年 liudan.com. All rights reserved.
//

#import "WelcomeViewController.h"
#import "Welcome.h"
#import "RootViewController.h"

@interface WelcomeViewController ()

@property (nonatomic, retain)NSTimer * timer;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestWelcome];
}

- (void)requestWelcome{
    
    __weak typeof(self) vc = self;
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kStart parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [vc.image sd_setImageWithURL:[NSURL URLWithString:responseObject[@"img"]]];
        vc.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:vc selector:@selector(goRootView) userInfo:nil repeats:NO];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败");
    }];
}

- (void)goRootView{
    RootViewController *rootVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rootVC"];
    rootVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:rootVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
