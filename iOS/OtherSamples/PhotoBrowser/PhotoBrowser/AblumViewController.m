//
//  AblumViewController.m
//  PhotoBrowser
//
//  Created by mengai on 15/11/16.
//  Copyright © 2015年 Meng. All rights reserved.
//

#import "AblumViewController.h"
#import "QYPhotoAlbum.h"
@interface AblumViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arrPhotos;

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation AblumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    // Do any additional setup after loading the view from its nib.
    [self naviRightBotton:@"关闭" action:@selector(back)];
    
    [PhotosAlbum getPhotosGroupsBlock:^(NSArray *arrGroups) {
        NSLog(@"arrGroups = %@",arrGroups);
        if (arrGroups.count) {
            ALAssetsGroup *grp=arrGroups.firstObject;
            [self showGroup:grp];
        }
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
}

- (void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrPhotos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (indexPath.row < arrPhotos.count) {
        cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row + 1];
        ALAsset *ass = [arrPhotos objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageWithCGImage:ass.thumbnail];
    }
    
    
    return cell;
}

- (void)showGroup:(ALAssetsGroup*)grp{
    self.title=[grp valueForProperty:ALAssetsGroupPropertyName];
    [PhotosAlbum getPhotoAssetsByGroup:grp resultBlock:^(NSArray *arrAssets) {
        arrPhotos=arrAssets;
        //        DebugLog(@"%i",arrPhotos.count);
        [self.tableView reloadData];
        if (arrPhotos.count){
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:arrPhotos.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        }
        else {
            //没有照片
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 右侧文字按钮
- (void)naviRightBotton:(NSString*)aTitle action:(SEL)action
{
    CGRect frm = CGRectMake(0,0,40,44);
    UIButton* btn= [[UIButton alloc] initWithFrame:frm];
    
    
    [btn setTitle:aTitle forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.backgroundColor=[UIColor clearColor];
    
    
    UIBarButtonItem *fixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixed.width = 5;
    
    UIBarButtonItem* btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItems = @[fixed,btnItem];
}

@end
