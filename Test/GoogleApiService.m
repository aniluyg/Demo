//
//  GoogleApiService.m
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import "GoogleApiService.h"
#import "UNIHTTPClientHelper.h"
#import "UNIRest.h"
#import "GoogleApiResponse.h"


@implementation GoogleApiService


//Google search api limits us to request more result
static uint const SEARCH_RESULT_ITEM_COUNT_PER_PAGE = 10;


-(NSArray*) searchByKey:(NSString*) searchKey andPageIndex:(uint)pageIndex{

    uint startIndex = [self calculateSearchStartIndexByPageIndex:pageIndex];
    
    NSString* requestUrl = [NSString stringWithFormat: @"https://www.googleapis.com/customsearch/v1?key=AIzaSyCRLHWR3ULlQKut8X0Io7NGJm3ln5dgos8&cx=002930895759511133860:brwsp47inok&fields=items(title,link,snippet)&start=%d&q=%@", startIndex, searchKey];

    NSDictionary* headers = @{@"accept": @"application/json", @"accept-encoding": @"gzip"};
    
    UNIHTTPJsonResponse *response = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:requestUrl];
        [request setHeaders:headers];
    }] asJson];
    
    
    NSMutableArray<GoogleApiResponse*> *responseList = [NSMutableArray new];

    //Mapping
    if(response != nil && response.body != nil && response.body.object != nil){
        NSArray* itemList = [response.body.object objectForKey:@"items"];
        
        if(itemList != nil && itemList.count > 0){
            for(NSDictionary *item in itemList){
                
                NSString *title = [item objectForKey:@"title"];
                NSString *link = [item objectForKey:@"link"];
                NSString *snippet = [item objectForKey:@"snippet"];
                
                GoogleApiResponse *apiResponseModel = [[GoogleApiResponse alloc] initWithTitle:title andLink:link andSnippet:snippet];
                [responseList addObject:apiResponseModel];
            }
        }
    }
    
    return responseList;
}

-(uint)calculateSearchStartIndexByPageIndex:(uint)pageIndex{
    int startIndex = 1;
    if(pageIndex > 0){
        startIndex += pageIndex * SEARCH_RESULT_ITEM_COUNT_PER_PAGE;
    }
    return startIndex;
}

@end
