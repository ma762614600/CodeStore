//
//  ViewController.m
//  L05CollectionView
//
//  Created by mengai on 16/9/10.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "RootViewController.h"
#import "MyCollectionViewCell.h"

#define kMaxWidth 298


static NSString *const MyCollectionViewIdentifier = @"MyCollectionViewIdentifier";

@interface RootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollectionView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(40, 40);
    
    
    UIPickerView
    _dataSource = @[@"字"];
    
    //,
    _myCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    _myCollectionView.backgroundColor = [UIColor whiteColor];
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    [self.view addSubview:_myCollectionView];
    
    
    [_myCollectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:MyCollectionViewIdentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = 0;
    
    NSInteger totalRow = [self totalRowWith:_dataSource countInEveryRow:3];
    NSInteger currentRow = indexPath.row/3 + 1;
    
    if (currentRow == totalRow) {
        NSInteger lastRowCount = _dataSource.count - (totalRow - 1)*3;
        if (lastRowCount == 0) {
            lastRowCount = 1;
        }
        width = floor(kMaxWidth/lastRowCount);
    }else{
        width = floor(kMaxWidth/3.0);
    }
    return (CGSize){width,40};
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 点击高亮
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
}

// 长按某item，弹出copy和paste的菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 使copy和paste有效
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        return YES;
    }
    
    return NO;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
     CGFloat padding = floor((CGRectGetWidth(self.view.frame) - kMaxWidth)/2);
    return UIEdgeInsetsMake(0,  padding, 0, padding);
}

- (NSInteger)totalRowWith:(NSArray *)array countInEveryRow:(NSInteger)count
{
    if (count == 0) {
        return 0;
    }
    NSInteger row = array.count/count;
    if (array.count % count > 0) {
        row += 1;
    }
    return row;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MyCollectionViewIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    cell.answerLabel.text = _dataSource[indexPath.row];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了 = %ld",(long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
