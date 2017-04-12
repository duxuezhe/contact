//
//  EditContactViewController.h
//  contact
//
//  Created by duxuezhe on 17-4-12.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contact.h"

@protocol editContactViewControllerDelegate
-(void)backWithContact:(contact *)contact IsEditing:(BOOL)isEditing;
@end

@interface EditContactViewController : UIViewController<UITextFieldDelegate>
@property(strong,nonatomic)contact *contact;
@property(weak,nonatomic)id<editContactViewControllerDelegate>delegate;

@end
