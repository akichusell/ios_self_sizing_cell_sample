//
//  TableViewCell.m
//  SkpReadme
//
//  Created by chu.seil on 2015. 8. 12..
//  Copyright (c) 2015년 chu.seil. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _title = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 8, 8)];
        _title.font = [UIFont systemFontOfSize:17.0];
        _title.numberOfLines = 0;
        _title.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_title];
        
        
        NSMutableArray *constraints = [[NSMutableArray alloc] init];
        
        [constraints addObjectsFromArray:
         [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[_title]-8-|"
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
