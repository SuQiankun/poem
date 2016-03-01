//
//  ViewController.m
//  pmeo
//
//  Created by 两好三坏 on 16/2/25.
//  Copyright © 2016年 qinakun. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "ToolsView.h"
#import "UIView+Extension.h"

#define kViewWidth [UIScreen mainScreen].bounds.size.width
#define kViewHeight 49

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *biaoti;
@property (weak, nonatomic) IBOutlet UILabel *neirong;
@property (weak, nonatomic) IBOutlet UILabel *zuozhe;
@property(nonatomic,strong)  ToolsView *toolsView ;


@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toolsView = [[ToolsView alloc] initWithFrame:CGRectMake(0, self.view.height - kViewHeight + 5,kViewWidth, kViewHeight)];
    self.toolsView.alpha = 0.5;
    self.toolsView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"c.png"]];
//    [UIColor colorWithRed:248 green:239 blue:193 alpha:1.0];
    self.toolsView.layer.cornerRadius = 10;
    self.toolsView.layer.masksToBounds = YES;
    
    self.toolsView.hidden = YES;
    __weak typeof(self) weakSelf = self;
    [self.toolsView setChoseButtonCilick:^(ChoseButtonType type) {
        [weakSelf choseButtonClickWithType:type];
    }];
    [self.view addSubview:self.toolsView];
    
    
  [self loadJson];

    
}





-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    [UIView animateWithDuration:3.0 delay:3.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        if (self.toolsView.hidden == YES) {
            self.toolsView.hidden = NO;
        }else if (self.toolsView.hidden == NO){
            self.toolsView.hidden = YES;
        }
    } completion:^(BOOL finished) {
        
    }];

    
}
-(void)loadJson{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"shici.json" withExtension:nil];

    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];

    
    Model *model = [Model new];


    NSString *num = [NSString stringWithFormat:@"%d",arc4random_uniform(11)];
    
    [model setValuesForKeysWithDictionary:arr[num]];
    
    self.biaoti.text = model.biaoti;
    self.neirong.font = [UIFont fontWithName:@"American Typewriter" size:16];
    self.neirong.text = model.neirong;

    self.zuozhe.text = model.zuozhe;

}



//根据button的类型,执行不同的操作
-(void)choseButtonClickWithType:(ChoseButtonType)type{
    switch (type) {
        case ChoseButtonTypeRefre:
            [self loadJson];
            break;
  
        case ChoseButtonTypeSearch:
            NSLog(@"搜索");
            break;
        case ChoseButtonTypeRandom:
           [self test];
            break;
        default:
            break;
    }
}


-(void)test{
    
    NSString *urlStr = @"http://api.avatardata.cn/TangShiSongCi/Random?key=17407afc146d4425b74540a37bdefaaa";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLSession *sess = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [sess dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        Model *model = [Model new];
        [model setValuesForKeysWithDictionary:result[@"result"]];
        
        //刷新UI
      dispatch_async(dispatch_get_main_queue(), ^{
        #warning 待解决的字符串截取
          self.biaoti.text = model.biaoti;
          
          self.neirong.text = model .neirong;
          
          self.zuozhe.text = model.zuozhe;
          
          

      });
        
    }];
    
    [task resume];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
