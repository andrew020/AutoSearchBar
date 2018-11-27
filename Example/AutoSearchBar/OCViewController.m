//
//  OCViewController.m
//  AutoSearchBar_Example
//
//  Created by 李宗良 on 2018/11/27.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

#import "OCViewController.h"
#import "AutoSearchBar-Swift.h"

@interface OCViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.searchBar setAutoSearchWithEnable:YES];
    self.searchBar.delegate = self;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"latest text: %lf", [[NSDate date] timeIntervalSince1970]);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search text: %lf", [[NSDate date] timeIntervalSince1970]);
    [searchBar cancelAutoSearch];
    self.label.text = searchBar.text;
}

@end
