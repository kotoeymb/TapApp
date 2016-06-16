//
//  ShopViewController.m
//  GesturesDemo
//
//  Created by Revo Tech on 6/14/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "ShopViewController.h"
// #import "PageViewController.h"
#import "PageImageScrollView.h"
#import "CollectionViewCell.h"
@interface ShopViewController () <UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *contentImages;
@property (nonatomic, strong) NSArray *itemNameArray;

// @property (nonatomic, strong) UIPageViewController *pageViewController;
@end

@implementation ShopViewController
NSInteger selectedindex;
UIColor *city_mart_color;

/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
  //   [self createPageViewController];
   //  [self setupPageControl];
   // self.itemNameArray = @[@"item1",@"item2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    city_mart_color =  [UIColor colorWithRed:(123.0 / 255.0f)
                                         green:(102.0/ 255.0f)
                                          blue:(167.0/ 255.0f)
                                         alpha:1.0f].CGColor;
    PageImageScrollView *pageScrollView = [[PageImageScrollView alloc] initWithFrame:CGRectMake(0, 25, 420, 220)];
    [pageScrollView setScrollViewContents:@[[UIImage imageNamed:@"nature_pic_1"], [UIImage imageNamed:@"nature_pic_2"], [UIImage imageNamed:@"nature_pic_3"], [UIImage imageNamed:@"nature_pic_4"]]];
    //easily setting pagecontrol pos, see PageControlPosition defination in PagedImageScrollView.h
  //   pageScrollView.pageControlPos = PageControlPositionCenterBottom;
    [self.view addSubview:pageScrollView];

    UIImage *nav_img = [UIImage imageNamed:@"logo-2"];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:nav_img] ;
    self.btn_minus.layer.borderWidth = 1;
    self.btn_minus.layer.cornerRadius = 2;
    self.btn_minus.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
    self.add_btn.layer.borderWidth = 1;
    self.add_btn.layer.cornerRadius = 2;
    self.add_btn.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
    self.label.layer.borderWidth = 1;
   
    self.label.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
    self.item_collectionView.backgroundColor = [UIColor whiteColor];

   
    /*
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-220, self.view.frame.size.width, 100)];
    
    int x = 10;
    for (int i = 0; i < 10; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x,10,90,90)];
        [button setTitle:[NSString stringWithFormat:@"Button %d", i] forState:UIControlStateNormal];
        [button setTag:i];
        [button setBackgroundColor:[UIColor greenColor]];
        [button addTarget:self action:@selector(onClickofFilter:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];
        
        x += button.frame.size.width+10;
    }
    
    scrollView.contentSize = CGSizeMake(x, scrollView.frame.size.height);
    scrollView.backgroundColor = [UIColor whiteColor];
    
     
     
    [self.view addSubview:scrollView];

    UIImage *image = [UIImage imageNamed:@"car"];
    _item_view = [[UIImageView alloc]initWithImage:image];
    _item_view.frame = [[UIScreen mainScreen] bounds];
    _item_view.contentMode = (UIViewContentModeScaleAspectFit);
    _item_view.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    _item_view.backgroundColor = [UIColor clearColor];
    
    
    
   //  UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    scrollView.contentMode = (UIViewContentModeScaleAspectFit);
    
    scrollView.contentSize = CGSizeMake(image.size.width,960);
    scrollView.pagingEnabled = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.alwaysBounceVertical = NO;
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    scrollView.maximumZoomScale = 2.5;
    scrollView.minimumZoomScale = 1;
    scrollView.clipsToBounds = YES;
   // [scrollView addSubview:imageView];
   //  [image release];
   //  [_item_view release];
    [self.view addSubview:scrollView];
    // For Scroll View handlae
     
     
     */
    
}
/*
- (void)createPageViewController
{
   
 
    _contentImages = @[@"nature_pic_1",
                       @"nature_pic_2",
                       @"nature_pic_3",
                       @"nature_pic_4"];
    
    UIPageViewController *pageController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageView"];
    
    pageController.dataSource = self;
    
    if([_contentImages count])
    {
        NSArray *startingViewControllers = @[[self itemControllerForIndex:0]];
        [pageController setViewControllers:startingViewControllers
                                 direction:UIPageViewControllerNavigationDirectionForward
                                  animated:NO
                                completion:nil];
    }
    
    self.pageViewController = pageController;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    
}

- (void)setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor:[UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    //     [[UIPageControl appearance] setBackgroundColor:[UIColor darkGrayColor]];
    //    UIPageControl.appearance().pageIndicatorTintColor           = UIColor.lightGrayColor()
    //    UIPageControl.appearance().currentPageIndicatorTintColor    = UIColor.redColor()
    
    [self createPageViewController];
}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    PageViewController *itemController = (PageViewController *)viewController;
    
    if (itemController.itemIndex > 0)
    {
        return [self itemControllerForIndex:itemController.itemIndex-1];
    }
    
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    PageViewController *itemController = (PageViewController *)viewController;
    
    if (itemController.itemIndex+1 < [_contentImages count])
    {
        return [self itemControllerForIndex:itemController.itemIndex+1];
    }
    
    return nil;
}

- (PageViewController *)itemControllerForIndex:(NSUInteger)itemIndex
{
    if (itemIndex < [_contentImages count])
    {
        PageViewController *pageItemController = [self.storyboard instantiateViewControllerWithIdentifier:@"itemController"];
        pageItemController.itemIndex = itemIndex;
        pageItemController.imageName = _contentImages[itemIndex];
        return pageItemController;
    }
    
    return nil;
}

#pragma mark Page Indicator

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [_contentImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark - Additions

- (NSUInteger)currentControllerIndex
{
    PageViewController *pageItemController = (PageViewController *) [self currentController];
    
    if (pageItemController)
    {
        return pageItemController.itemIndex;
    }
    
    return -1;
}

- (UIViewController *)currentController
{
    if ([self.pageViewController.viewControllers count])
    {
        return self.pageViewController.viewControllers[0];
    }
    
    return nil;
}

*/
#pragma mark <UICollectionViewDataSource>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
   // cell.backgroundColor = [UIColor magentaColor];
    //   selectedindex = indexPath.item;
    [cell setSelected:YES];
   //  [collectionView reloadData];
    
    
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//   float cellwidth = self.collview.frame.size.width/4;
//   return CGSizeMake(cellwidth, 56.f);
//}
//


//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 2;
//
//}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"Setting size for cell at index %d",indexPath.row);
    CGSize mSize = CGSizeMake(110, 130);
    return mSize;
}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//
//    return 2.0;
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 2.0;
//}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(3, 3, 3, 3);
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // #warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // #warning Incomplete implementation, return the number of items
    return 8;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_ID" forIndexPath:indexPath];
   // cell.backgroundColor=[UIColor orangeColor];

   //  NSLog(@"paymentcell : %ld",(long)indexPath.row);
//    cell.backgroundColor = [UIColor whiteColor];
//    cell.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
//    //  Configure the cell
//       cell.lbl_time.text = self.timeArray[indexPath.row];
//    cell.name_lbl.text = [NSString stringWithFormat:@"%li", (long)indexPath.row +1 ];
//    
//    if (selectedindex == indexPath.item) {
//      //   cell.backgroundColor = [UIColor cyanColor];
//        cell.backgroundColor = [UIColor clearColor];
//        self.btn_minus.layer.borderWidth = 0.8;
//        cell.name_lbl.layer.borderColor = [UIColor colorWithRed:(123.0 / 255.0f)
//                                                          green:(102.0/ 255.0f)
//                                                           blue:(167.0/ 255.0f)
//                                                          alpha:1.0f].CGColor;
//        
//    }
//    else {
//        cell.backgroundColor = [UIColor whiteColor];
//        cell.name_lbl.textColor = [UIColor lightGrayColor];
//    }
//    //   return cell;
   
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
 //   cell.backgroundColor = [UIColor cyanColor];
     [cell setSelected:YES];
}
//-(void) collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    //change color when tapped
//    cell.backgroundColor = [UIColor cyanColor];
//}
//-(void) collectionView:(UICollectionView *)collectionView HighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    //change color when tapped
//    cell.backgroundColor = [UIColor cyanColor];
//     [cell setSelected:YES];
//}
//-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//    //change back on touch up
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//   // cell.layer.borderColor = [UIColor cyanColor];
//}


@end






