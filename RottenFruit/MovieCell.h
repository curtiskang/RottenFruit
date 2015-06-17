//
//  MovieCell.h
//  RottenFruit
//
//  Created by Curtis Kang on 6/17/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *synposisLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@end
