//
//  DefaultCell.m
//  todolist
//
//  Created by Puneet Khanduri on 10/15/13.
//  Copyright (c) 2013 Puneet Khanduri. All rights reserved.
//

#import "DefaultCell.h"

@implementation DefaultCell

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