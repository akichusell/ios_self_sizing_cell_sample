//
//  CollectionViewController.m
//  SkpReadme
//
//  Created by chu.seil on 2015. 8. 12..
//  Copyright (c) 2015년 chu.seil. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

#import "SkpLayout.h"


static NSString* const contentTexts[] = {
    @"가나다라마바사아자차카파타하ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    @"동해물과 백두산이 마르고\n닳도록 하느님이 보우하사\n우리나라 만세.\n무궁화 삼천리\n화려강산 대한사람\n대한으로 길이\n보전하세",
    @"남산 위에 저 소나무\n철갑을 두른 듯 바람서리 불변함은 우리\n기상일세\n가을 하늘 공활한데\n높고 구름 없이\n밝은 달은 우리 가슴 일편단심일세\n이 기상과 이 맘으로\n충성을 다하여\n괴로우나 즐거우나\n나라 사랑하세",
    @"Thanks so much for coming to What's New in Table and Collection Views. This is a topic of special dearness to my heart as we give it every year. Well, not exactly at this session but something on collection and table views we usually to get to talk about.And that's really because table views and collection views are a tool that get used in nearly every single application and we recognized that as we went through to add a lot of improvements to iOS 8.",
    @"We really wanted to do things that made your life easier doing awesome things with the tools that, as I said, just about everybody uses. So, what we're going to talk about today is a few fundamental improvements to both table view and collection view. And we'll be beginning with table view.",
    @"In particular, the big thing that we're going to be talking about today is how to do Dynamic Type adoption in your table views.",
    @"We're going to be asking that all applications that deal with text in iOS 8 adopt Dynamic Type and you'll see in fact that all of our system apps have already done this.",
    @"So users are going to expect that your application do this. And I'm going to show you that it's really quite simple to do and I think you'll have a lot of fun with it. The mechanism that we're giving you for adopting Dynamic Type is self-sizing cells.",
};

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.estimatedItemSize = CGSizeMake(1, 1);   // CGSizeMake(110, 50);   // 스크롤이 끝까지 되지 않는 문제 발생
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    self.collectionView.collectionViewLayout = flowLayout;
    
#pragma mark ---- Custom UICollectionViewLayout
    SkpLayout* skpLayout = [[SkpLayout alloc] init];
    skpLayout.estimatedItemSize = CGSizeMake(300, 100);
    self.collectionView.collectionViewLayout = skpLayout;
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CellWithReuseIdentifier"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellWithReuseIdentifier" forIndexPath:indexPath];
    cell.title.text = [NSString stringWithFormat:@"No.%ld %@", (long)indexPath.item, contentTexts[ indexPath.item % 8 ]];
    
    return cell;
}
@end
