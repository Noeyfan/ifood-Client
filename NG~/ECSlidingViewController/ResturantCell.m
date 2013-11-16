//
//  ResturantCell.m
//  NG_OderingSystem
//
//  Created by You on 13-3-17.
//
//

#import "ResturantCell.h"

@implementation ResturantCell
@synthesize RImage;
@synthesize RName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
