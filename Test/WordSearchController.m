//
//  ViewController.m
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import "WordSearchController.h"
#import "GoogleApiService.h"
#import "GoogleSearchResultController.h"

@interface WordSearchController ()

@end

@implementation WordSearchController

@synthesize searchBar;
@synthesize isFiltered, filteredTextList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    searchBar.delegate = self;
    [searchBar setReturnKeyType:UIReturnKeyDone];
}


#pragma mark - TableView delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(isFiltered){
        return filteredTextList.count;
    } else {
        return 0;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"SearchTextCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [filteredTextList objectAtIndex:indexPath.row];
    
    return cell;
    
}

#pragma mark - SearchBar delegates
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    isFiltered = false;
    _searchText = searchText;
    
    if(searchText.length > 0){
        filteredTextList = [[SearchUtil sharedUtil] getSuggestionsWithPrefix:searchText];
        if(filteredTextList){
            isFiltered = true;
        }
    }
    
    [self.tableView reloadData];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar {
    [aSearchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar
{
    [aSearchBar resignFirstResponder];
}

#pragma mark - storyboard methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGoogleSearchList"]) {
        NSIndexPath *indexPath = nil;
        
        if(isFiltered){
            indexPath = [self.tableView indexPathForSelectedRow];
            NSString* searchKey = [filteredTextList objectAtIndex:indexPath.row];
            
            GoogleApiService* service = [GoogleApiService new];
            GoogleSearchResultController *destViewController = segue.destinationViewController;
            destViewController.searchResultList = [service searchByKey:searchKey andPageIndex:0];
            destViewController.searchText = _searchText;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
