//
//  ViewController.h
//  contact
//
//  Created by duxuezhe on 17-4-12.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditContactViewController.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,editContactViewControllerDelegate>
@property(strong,nonatomic) NSMutableArray *contacts;
@end
