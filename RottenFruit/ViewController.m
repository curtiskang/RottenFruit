//
//  ViewController.m
//  RottenFruit
//
//  Created by Curtis Kang on 6/12/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController
//http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=7ue5rxaj9xn4mhbmsuexug54

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"TEST");
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"synopsis"];
    NSString *posterURLString = [self.movie valueForKeyPath:@"posters.detailed"];
    posterURLString =[self convertPostUrlStringToHighRes:posterURLString];
    [self.posterView setImageWithURL:[NSURL URLWithString:posterURLString]];

   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)convertPostUrlStringToHighRes:(NSString *)urlString {
    NSRange range = [urlString rangeOfString:@".*cloudfront.net/" options:NSRegularExpressionSearch];
    NSString *returnValue = urlString;
    if (range.length > 0 ){
        returnValue = [urlString stringByReplacingCharactersInRange:range withString: @"https://content6.flixster.com/"];
    }
    return returnValue;
}

@end
