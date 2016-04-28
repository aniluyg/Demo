//
//  SearchUtil.m
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//


#import "SearchUtil.h"
#import "DDFileReader.h"
#import "RadixTree.h"

@interface SearchUtil ()
    @property (nonatomic, strong) PJTernarySearchTree * tree ;
    @property (nonatomic, strong) RadixTree *trie;
@end

@implementation SearchUtil
@synthesize tree, trie;

static uint const MAXIMUM_SEARCH_RESULT_COUNT = 100;

-(id)init{

    self = [super init];
    if (self) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"british-english-insane" ofType:nil];
        DDFileReader * reader = [[DDFileReader alloc] initWithFilePath:bundlePath];
        NSString * line = nil;
        
        tree = [[PJTernarySearchTree alloc] init];
        //trie = [[RadixTree alloc] init];

        
        while ((line = [reader readLine])) {
            line = [self removeLineBerakes:line];
            
            [tree insertString:line];
            //[trie insert:line value:line];

        }
    }
    return self;

}

-(NSString*) removeLineBerakes:(NSString*)line{
    return [line stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

-(NSArray*) getSuggestionsWithPrefix:(NSString*)prefix{
    return [tree retrievePrefix:prefix countLimit:MAXIMUM_SEARCH_RESULT_COUNT];
    //return [trie searchPrefix:prefix recordLimit:MAXIMUM_SEARCH_RESULT_COUNT];
}


+ (id)sharedUtil {
    static SearchUtil *sharedUtil = nil;
    @synchronized(self) {
        if (sharedUtil == nil)
            sharedUtil = [[self alloc] init];
    }
    return sharedUtil;
}

@end
