//
//  ViewController.m
//  Caculate
//
//  Created by TobyoTenma on 16/3/22.
//  Copyright © 2016年 TobyoTenma. All rights reserved.
//

/*
TODO:
 
 //1.加车的=号功能没有实现
 
    1.1按回车后 得到结果为 0(这个问题与第 2 个问题是同一个问题)
 
 //2.输入完成数字后的运算符才是最终进行的运算
 
 //3. 连续运算后,出现运算混乱(如果输入运算符后有输入数据就运算,否则更新运算符)
 
 */

#define TTADEBUG 0

#if TTADEBUG==1
#define LOG(var1,var2) NSLog(var1,var2)
#else
#define LOG(var1,var2)
#endif

#import "ViewController.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//判断用户是有没有已经在输入数字了
BOOL isEmpty = YES;

//记录用户第一个数字有没有输入完成
BOOL flag = NO;

- (IBAction)numButton:(UIButton *)sender {
    
//    NSInteger digit = sender.currentTitle.integerValue;
    NSString *digit = sender.currentTitle;
    //    self.num = [self.num appendFormat:@"%ld",(long)digit];
    if (isEmpty) {
        //不是正在输入,而是刚输入第一个数字,那么就将开始的 0 换为输入的第一个数字
        self.resultLable.text = [NSString stringWithFormat:@"%@",digit];
        isEmpty = NO;
    }else{
        //正在输入数字,那么就在已有的数字后追加
        self.resultLable.text = [self.resultLable.text stringByAppendingFormat:@"%@",digit];
    }
    //    NSLog(@"%@",self.resultLable.text);
    flag = YES;
}



//计算结果
double result = 0.0;
//定义两个操作数
double num1 = 0.0,num2 = 0.0;
//定义一个运算符
NSInteger operator = 0;


- (IBAction)caculateButton:(UIButton *)sender {
    
    numberArray *operandStack = [numberArray defultNumberArray];
    
    

    //这个地方是做什么的????
    //写的时候只有上帝和我知道
    //现在只有上帝知道
    //----BUT NOW----
    //判断用户有没有输入完成一个数字
    //如果第一个数字输入完后,将这个数字加入的数组中
    //如果没有这个判断,先输入运算符,会直接得到result的初始值
    if (flag == YES) {
        [operandStack.numArr addObject:self.resultLable.text];
        isEmpty = YES;
    }
    //依次取出数组中的元素,并进行运算
    if (operandStack.numArr.count >= 2) {
        num1 = [operandStack.numArr.lastObject doubleValue];
        [operandStack.numArr removeLastObject];
        num2 = [operandStack.numArr.lastObject doubleValue];
        [operandStack.numArr removeLastObject];
        
        //根据运算符进行运算
        switch (operator) {
            case 1:
                result = num1 + num2;
                break;
            case 2:
                result = num2 - num1;
                break;
            case 3:
                result = num1 * num2;
                break;
            case 4:
                result = num2 / num1;
                break;
            default:
                break;
        }
        //显示运算结果
        self.resultLable.text = [NSString stringWithFormat:@"%.2lf",result];
        //将去处结果加入到数组中
        [operandStack.numArr addObject:self.resultLable.text];
        flag = NO;
    }
    
    //存储用户输入的运算符
    operator = sender.tag;

}


/**
 *  对所有的元素进行初始化
 *
 */
- (IBAction)cleanButton:(UIButton *)sender {
    numberArray *operandStack = [numberArray defultNumberArray];
    self.resultLable.text = @"0";
    operandStack.numArr = nil;
    result = 0;
    isEmpty = YES;
}
@end
