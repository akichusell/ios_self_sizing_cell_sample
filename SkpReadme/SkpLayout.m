//
//  SkpLayout.m
//  SkpReadme
//
//  Created by chu.seil on 2015. 8. 20..
//  Copyright (c) 2015년 chu.seil. All rights reserved.
//

#import "SkpLayout.h"

@interface SkpLayout()

@property (nonatomic, strong) NSMutableArray* layoutAttributes;
@property (nonatomic) CGFloat spacing;

@property (nonatomic) CGSize contentSize;
@property (nonatomic, strong) NSMutableArray* elementsInRect;

@property (nonatomic) BOOL needToInitLayoutAttributes;


@end

@implementation SkpLayout

#pragma mark - life cycle
- (id) init {
    self = [super init];
    if (self) {
        [self _init];
    }
    
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

- (void) _init
{
    self.layoutAttributes = [[NSMutableArray alloc] init];
    self.elementsInRect = [[NSMutableArray alloc] init];
    
    self.spacing = 10;
    
    self.needToInitLayoutAttributes = YES;
    self.estimatedItemSize = CGSizeZero;
    self.contentSize = CGSizeZero;
}

#pragma mark - UICollectionViewLayout Layouting Process

-(void)prepareLayout
{
    const NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    const CGFloat collectionViewWidth = self.collectionView.bounds.size.width;

    CGFloat yPos = 0;
    for(NSInteger item = 0; item<itemCount; item++)
    {
        UICollectionViewLayoutAttributes *attr;
        CGSize itemSize;
     
        if(_needToInitLayoutAttributes) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:item inSection:0];
            attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            itemSize = _estimatedItemSize;
            
        }else {
            attr = _layoutAttributes[item];
            itemSize = attr.frame.size;
        }
        
        const CGFloat x = (collectionViewWidth - itemSize.width) * 0.5;
        
        attr.frame = CGRectMake(x, yPos, itemSize.width, itemSize.height);
        _layoutAttributes[item] = attr;
        
        yPos += (itemSize.height + _spacing);
    }
    
    _contentSize = CGSizeMake(collectionViewWidth, yPos-_spacing);
    
    _needToInitLayoutAttributes = NO;
}

-(CGSize)collectionViewContentSize
{
    return _contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    [_elementsInRect removeAllObjects];
    
    const NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for(NSInteger item = 0; item<itemCount; item++) {
        UICollectionViewLayoutAttributes* attr = _layoutAttributes[item];
        if( CGRectIntersectsRect(attr.frame, rect) ) {
            [_elementsInRect addObject:attr];
        }
    }
    
    return _elementsInRect;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return _layoutAttributes[indexPath.item];
}

#pragma mark - UICollectionViewLayout invalidate

-(BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
{
    const CGSize preferredSize = preferredAttributes.frame.size;
    const CGSize originSize = originalAttributes.frame.size;
    if( !CGSizeEqualToSize(preferredSize, originSize) )
    {
        const NSInteger item = preferredAttributes.indexPath.item;
        UICollectionViewLayoutAttributes* attr = _layoutAttributes[item];
        
        attr.frame = CGRectMake(attr.frame.origin.x, attr.frame.origin.y, preferredSize.width, preferredSize.height);
        
        return YES;
    }
    else {
        return NO;
    }
}

@end
