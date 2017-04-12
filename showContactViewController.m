//
//  showContactViewController.m
//  contact
//
//  Created by duxuezhe on 17-4-12.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import "showContactViewController.h"
#import "EditContactViewController.h"

@interface showContactViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telephoneLabel;

@end

@implementation showContactViewController
@synthesize contact;
- (IBAction)Done:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)editContact:(id)sender
{
    [self performSegueWithIdentifier:@"editContact" sender:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.nameLabel.text = self.contact.name;
    self.telephoneLabel.text = self.contact.telephone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editContact"]) {
        EditContactViewController *editVC = segue.destinationViewController;
        editVC.contact = self.contact;
        editVC.delegate = self.navigationController.viewControllers[0];
    }

}


@end
