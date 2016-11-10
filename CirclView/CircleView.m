//
//  CircleView.m
//  YCT
//
//  Created by 余晋龙 on 16/9/21.
//  Copyright © 2016年 bzjc. All rights reserved.
//


#define TITLE_HEIGHT 60
#define PIE_HEIGHT 200
#define Radius 65.5 //圆形比例图的半径

#import "CircleView.h"
#import "CircleMapView.h"


@interface CircleView()
{
 CircleMapView *circleView;
    id delegate;
}
@end
@implementation CircleView
-(instancetype)initWithFrame:(CGRect)frame andUrlStr:(NSString *)str
{
    if (self = [super initWithFrame:frame]) {
        _str = str;
        //
        [self addCirclView:self.dataArray];  //添加饼状图
    }
    return self;
}
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        
        if ([_str isEqualToString:@"融资"]) { //总资产
           _dataArray = [[NSMutableArray alloc]initWithArray:@[
  @{@"number":@"100",@"color":@"00b0ec",@"name":@"信托产品\n(买的+收益)"},
  @{@"number":@"200",@"color":@"e94f25",@"name":@"粤财汇\n(代收/冻结/可用金额+收益)"},
  @{@"number":@"200",@"color":@"006db8",@"name":@"投资\n(三个公司投资总额+收益)"}]];
        }else{
        _dataArray = [[NSMutableArray alloc]initWithArray:@[
  @{@"number":@"200",@"color":@"ff9429",@"name":@"担保产品"},
  @{@"number":@"200",@"color":@"e94f25",@"name":@"粤财汇"},
  @{@"number":@"200",@"color":@"00b0ec",@"name":@"信托产品"},
  @{@"number":@"200",@"color":@"006db8",@"name":@"投资"},
  @{@"number":@"200",@"color":@"fdd100",@"name":@"资产产品"}]];
        }
        
    }
    return _dataArray;
}
//添加圆形比例图
-(void)addCirclView:(NSMutableArray *)arr{
    if (!circleView) {
        circleView = [[CircleMapView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, PIE_HEIGHT) andWithDataArray:arr andWithCircleRadius:Radius];
        circleView.backgroundColor = [UIColor whiteColor];
//        circleView.dataArray = self.dataArray;
    }
    [self addSubview:circleView];
}
@end
