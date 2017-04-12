//
//  ViewController.m
//  contact
//
//  Created by duxuezhe on 17-4-12.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import "ViewController.h"
#import "showContactViewController.h"
#import "EditContactViewController.h"
#import "contact.h"

#define contactsNum 5

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
@synthesize contacts;

- (IBAction)addContact:(id)sender
{
    [self performSegueWithIdentifier:@"addContact" sender:self];
}

#pragma mark -- backWithContact:IsEditing:
-(void)backWithContact:(contact *)contact IsEditing:(BOOL)isEditing
{
    if (!isEditing) {
        [self.contacts addObject:contact];
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.contacts = [[NSMutableArray alloc]init];
    for (int i = 0; i < contactsNum; i++) {
        contact *c = [[contact alloc]init];
        c.name = [NSString stringWithFormat:@"联系人%d",i+1];
        c.telephone = [NSString stringWithFormat:@"1507607%04d",arc4random()/10000];
        
        [self.contacts addObject:c];
    }
    
    
}

#pragma mark -- UITableView dataSource and detegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showContact" sender:self];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contractCell = @"contactCell";
    //1.从重用对象池中找不用的cell对象
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:contractCell];
    //2.如果没有就自己创建对象
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:contractCell];
    }
    contact *c = self.contacts[indexPath.row];
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.telephone;
    
    return cell;
}


#pragma mark Segue跳转前的准备工作
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showContact"]){
        showContactViewController *showVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        showVC.contact = self.contacts[indexPath.row];
    }
    else if([segue.identifier isEqualToString:@"addContact"]){
        EditContactViewController *editVC = segue.destinationViewController;
        editVC.delegate = self;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
