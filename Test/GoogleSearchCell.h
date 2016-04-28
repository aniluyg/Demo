//
//  GoogleSearchCell.h
//  Test
//
//  Created by anil on 27/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoogleSearchCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *linkLabel;
@property (nonatomic, weak) IBOutlet UILabel *snippetLabel;

@end
