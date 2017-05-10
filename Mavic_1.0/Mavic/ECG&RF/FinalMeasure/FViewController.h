//
//  ViewController.h
//  Demo
//
//  Created by liuxingyu on 2017/4/11.
//  Copyright © 2017年 zhumengjiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UploadBlock)();

@interface FViewController : UIViewController

@property (nonatomic, copy) UploadBlock uploadBlock;

@end

