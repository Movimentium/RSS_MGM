//
//  MovieTableViewCell.h
//  prRSS
//
//  Created by Miguel Gallego on 17/6/17.
//  Copyright © 2017 Miguel Gallego. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
