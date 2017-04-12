//
//  ViewController.h
//  contact
//
//  Created by duxuezhe on 17-4-12.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic) NSMutableArray *contacts;
@end
