//
//  ThemeOfDailyController.h
//  ZhiHu
//
//  Created by 高升 on 15/11/21.
//  Copyright © 2015年 liudan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeOfDailyController : UITableViewController

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, retain) NSString *name;

+(ThemeOfDailyController *)sharedThemes;

@end
