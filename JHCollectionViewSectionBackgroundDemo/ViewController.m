//
//  ViewController.m
//  JHCollectionViewSectionBackgroundDemo
//
//  Created by 张健华-迈动 on 2017/3/20.
//  Copyright © 2017年 zhangjianhua. All rights reserved.
//

#import "ViewController.h"

#import "JHCollectionViewFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, JHCollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JHCollectionViewFlowLayout *jhFlowLayout = [[JHCollectionViewFlowLayout alloc] init];
    jhFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    jhFlowLayout.itemSize = CGSizeMake(50, 50);
    jhFlowLayout.minimumInteritemSpacing = 30;
    jhFlowLayout.minimumLineSpacing = 30;
    jhFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:jhFlowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark - JHCollectionViewDelegateFlowLayout
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section
{
    return [@[
              [UIColor redColor],
              [UIColor greenColor],
              [UIColor yellowColor]
              ] objectAtIndex:section];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
