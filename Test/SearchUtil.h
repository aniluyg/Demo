//
//  SearchUtil.h
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

//
#import "PJTernarySearchTree.h"

@interface SearchUtil : NSObject 

+ (id)sharedUtil;

-(NSArray*) getSuggestionsWithPrefix:(NSString*)prefix;

@end