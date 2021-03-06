//
//  ViewController.h
//  RottenFruit
//
//  Created by Curtis Kang on 6/12/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@property (strong, nonatomic) NSDictionary *movie;
@end

