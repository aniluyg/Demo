//
//  ViewController.m
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import "GoogleSearchResultController.h"
#import "GoogleApiService.h"
#import "GoogleSearchCell.h"

@interface GoogleSearchResultController ()

@end

@implementation GoogleSearchResultController

@synthesize searchResultList, searchText;



- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - TableView delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(searchResultList){
        return searchResultList.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"GoogleSearchTextCell";
    GoogleSearchCell *cell = (GoogleSearchCell *)[self.tableView dequeueReusableCellWithIdentifier:identifier];
   
    if (cell == nil) {
        cell = [[GoogleSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    GoogleApiResponse *model = [searchResultList objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = model.title;
    cell.linkLabel.text = model.link;
    cell.snippetLabel.text = model.snippet;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
