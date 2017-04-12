//
//  ViewController.m
//  contact
//
//  Created by duxuezhe on 17-4-12.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import "ViewController.h"
#import "contact.h"

#define contactsNum 5

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
@synthesize contacts;

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
    static NSString *contractCell = @"contractCell";
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
