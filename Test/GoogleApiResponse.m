//
//  GoogleApiResponse.m
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import "GoogleApiResponse.h"



@implementation GoogleApiResponse

@synthesize title, link, snippet;

-(id)initWithTitle:(NSString*)_title andLink:(NSString*)_link andSnippet:(NSString*)_snippet{
    
    self = [super init];
    if (self) {
        self.title = _title;
        self.link = _link;
        self.snippet = [_snippet stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return self;
}

@end
