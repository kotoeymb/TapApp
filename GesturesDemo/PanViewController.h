//
//  PanViewController.h
//  GesturesDemo
//
//  Created by Revo Tech on 5/26/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet UILabel *horizontalVelocityLabel;

@property (weak, nonatomic) IBOutlet UILabel *verticalVelocityLabel;
@end
