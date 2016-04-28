//
//  GoogleApiResponse.h
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//


@interface GoogleApiResponse : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* link;
@property (nonatomic, strong) NSString* snippet;

-(id)initWithTitle:(NSString*)_title andLink:(NSString*)_link andSnippet:(NSString*)_snippet;
@end