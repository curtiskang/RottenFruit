//
//  ViewController.m
//  RottenFruit
//
//  Created by Curtis Kang on 6/12/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+AFNetworking.h>
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController
//http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=7ue5rxaj9xn4mhbmsuexug54

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"TEST");
    
    [SVProgressHUD showWithStatus:@"Loading picker..."];
    
    // 2) Get a concurrent queue form the system
    dispatch_queue_t concurrentQueue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 3) Load picker in background
    dispatch_async(concurrentQueue, ^{

        
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"synopsis"];
    NSString *posterURLString = [self.movie valueForKeyPath:@"posters.detailed"];
    posterURLString =[self convertPostUrlStringToHighRes:posterURLString];
    [self.posterView setImageWithURL:[NSURL URLWithString:posterURLString]];
        // 4) Present picker in main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //[self presentViewController:_picker animated:YES completion:nil];
            [SVProgressHUD dismiss];
        });
           });
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
