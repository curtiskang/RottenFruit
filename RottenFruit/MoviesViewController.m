//
//  MoviesViewController.m
//  RottenFruit
//
//  Created by Curtis Kang on 6/17/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "ViewController.h"
#import <UIImageView+AFNetworking.h>

@interface MoviesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *movies;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      
    self.tableView.dataSource =self;
    self.tableView.delegate = self;
    
    // Do any additional setup after loading the view.
    NSString *apiUrlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=7ue5rxaj9xn4mhbmsuexug54&limit=20&country=us";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:apiUrlString]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.movies = dict[@"movies"];
        [self.tableView reloadData];
        }];
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movies.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyMovieCell" forIndexPath:indexPath];
    NSDictionary *movie = self.movies[indexPath.row];
    
    cell.titleLabel.text = movie[@"title"];
    cell.synposisLabel.text = movie[@"synopsis"];
    NSString *posterURLString = [movie valueForKeyPath:@"posters.thumbnail"];
    [cell.posterView setImageWithURL:[NSURL URLWithString:posterURLString]];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MovieCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSDictionary *movie = self.movies[indexPath.row];
    ViewController *destinationVC = segue.destinationViewController;
    destinationVC.movie = movie;
}


@end
