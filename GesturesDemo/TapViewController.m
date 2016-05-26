
//
//  TapViewController.m
//  GesturesDemo
//
//  Created by Revo Tech on 5/26/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()


-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;

@end

@implementation TapViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.testVew addGestureRecognizer:singleTapGestureRecognizer];
    
    
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    doubleTapGestureRecognizer.numberOfTouchesRequired = 2;
    [self.testVew addGestureRecognizer:doubleTapGestureRecognizer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    CGFloat newWidth = 100.0;
    if (self.testVew.frame.size.width == 100.0) {
        newWidth = 200.0;
    }
    
    CGPoint currentCenter = self.testVew.center;
    
    self.testVew.frame = CGRectMake(self.testVew.frame.origin.x, self.testVew.frame.origin.y, newWidth, self.testVew.frame.size.height);
    self.testVew.center = currentCenter;
}


-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    CGSize newSize = CGSizeMake(100.0, 100.0);
    if (self.testVew.frame.size.width == 100.0) {
        newSize.width = 200.0;
        newSize.height = 200.0;
    }
    
    CGPoint currentCenter = self.testVew.center;
    
    self.testVew.frame = CGRectMake(self.testVew.frame.origin.x, self.testVew.frame.origin.y, newSize.width, newSize.height);
    self.testVew.center = currentCenter;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
