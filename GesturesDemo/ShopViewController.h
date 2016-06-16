//
//  ShopViewController.h
//  GesturesDemo
//
//  Created by Revo Tech on 6/14/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *add_btn;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *btn_minus;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UIImageView *item_view;
@property (weak, nonatomic) IBOutlet UICollectionView *item_collectionView;

@end
