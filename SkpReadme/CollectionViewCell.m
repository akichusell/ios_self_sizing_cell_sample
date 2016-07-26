//
//  CollectionViewCell.m
//  SkpReadme
//
//  Created by chu.seil on 2015. 8. 12..
//  Copyright (c) 2015년 chu.seil. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        self.contentView.clipsToBounds = YES;
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:17.0];
        _title.numberOfLines = 0;
        _title.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_title];
        
        
        NSMutableArray *constraints = [[NSMutableArray alloc] init];
        
        [constraints addObjectsFromArray:
         [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[_title(<=300)]-8-|"
                                                 options:0
                                                 metrics:nil
                                                   views:NSDictionaryOfVariableBindings(_title)]];
        
        [constraints addObjectsFromArray:
         [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[_title]-8-|"
                                                 options:0
                                                 metrics:nil
                                                   views:NSDictionaryOfVariableBindings(_title)]];
        
        [self.contentView addConstraints:constraints];
    }
    return self;
}
@end
