//
//  ViewController.h
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchUtil.h"

@interface WordSearchController : UITableViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, assign) bool isFiltered;
@property (strong, nonatomic) NSArray *filteredTextList;
@property (strong, nonatomic) NSString *searchText;

@end

