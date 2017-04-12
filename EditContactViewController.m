//
//  EditContactViewController.m
//  contact
//
//  Created by duxuezhe on 17-4-12.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import "EditContactViewController.h"

@interface EditContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property BOOL isEditing;
@end

@implementation EditContactViewController
@synthesize contact;
- (IBAction)Done:(id)sender
{
    self.contact.name = self.nameTextField.text;
    self.contact.telephone = self.telephoneTextField.text;
    [self.delegate backWithContact:self.contact IsEditing:self.isEditing];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)returnBack:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.editing = YES;
    if (self.contact == nil) {
        self.isEditing = NO;
        self.contact = [contact new];
    }
    self.nameTextField.text = self.contact.name;
    self.telephoneTextField.text = self.contact.telephone;
    
    //设置textfield的代理
    self.telephoneTextField.delegate = self;
    self.nameTextField.delegate = self;
}

#pragma mark - textfield的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
