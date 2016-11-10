//
//  ViewController.m
//  CirclView
//
//  Created by 余晋龙 on 2016/10/31.
//  Copyright © 2016年 余晋龙. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()
//
@property(nonatomic , strong) CircleView *circleView_one;
@property(nonatomic , strong) CircleView *circleView_two;
@end

@implementation ViewController
{
    NSString *_str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"圆形比例图(带标注)";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton]; //添加选择按钮
    
    //添加圆形比例图
    [self.view addSubview:self.circleView_one];
    
    UIButton *bt = [self.view viewWithTag:101];
    bt.selected = YES;
    
}
- (CircleView *)circleView_one{
     if (!_circleView_one) {
        _circleView_one = [[CircleView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200) andUrlStr:@"融资"];
    }
    return _circleView_one;
}

- (CircleView *)circleView_two
{
    if (!_circleView_two) {
        _circleView_two = [[CircleView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200) andUrlStr:@"投资"];
    }
    return _circleView_two;
}

-(void)addButton{
    
    NSArray *arr = @[@"融资",@"投资"];
    
    for (int i = 0; i < arr.count; i++) {
        UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(i * self.view.frame.size.width / arr.count, 0, self.view.frame.size.width / arr.count, 40)];
        bt.tag = 101 + i;
        [bt setTitle:arr[i] forState:0];
        [bt setTitleColor:[UIColor blueColor] forState:0];
        [bt setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [bt addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
    }
    
}
-(void)click:(UIButton *)sender
{
    
    if ([sender.titleLabel.text isEqualToString:@"融资"]) {
        //
        [self.circleView_one removeFromSuperview];
        [self.circleView_two removeFromSuperview];
        //添加圆形比例图
        [self.view addSubview:self.circleView_one];
        
        
    }else if ([sender.titleLabel.text isEqualToString:@"投资"]){
        //
        [self.circleView_one removeFromSuperview];
        [self.circleView_two removeFromSuperview];
        //添加圆形比例图
        [self.view addSubview:self.circleView_two];
    }
    sender.selected = YES;
    
    if (sender.tag == 101) {
        UIButton *bt = [self.view viewWithTag:102];
        bt.selected = NO;
    }else if (sender.tag == 102){
        UIButton *bt = [self.view viewWithTag:101];
        bt.selected = NO;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
