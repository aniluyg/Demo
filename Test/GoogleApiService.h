//
//  GoogleApiService.h
//  Test
//
//  Created by anil on 26/04/16.
//  Copyright © 2016 . All rights reserved.
//

@interface GoogleApiService : NSObject


-(NSArray*) searchByKey:(NSString*) searchKey andPageIndex:(uint)pageIndex;
@end