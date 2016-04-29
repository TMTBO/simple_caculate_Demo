//
//  ViewController.h
//  Caculate
//
//  Created by TobyoTenma on 16/3/22.
//  Copyright © 2016年 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "numberArray.h"


@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *resultLable;


- (IBAction)numButton:(UIButton *)sender;

- (IBAction)caculateButton:(UIButton *)sender;

- (IBAction)cleanButton:(UIButton *)sender;

















@end

