//
//  GoogleSearchResultController.h
//  Test
//
//  Created by anil on 27/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoogleApiResponse.h"

@interface GoogleSearchResultController : UITableViewController
@property (strong, nonatomic) NSArray<GoogleApiResponse *> *searchResultList;
@property (strong, nonatomic) NSString* searchText;

@end