//
//  ViewController.m
//  pmeo
//
//  Created by 两好三坏 on 16/2/25.
//  Copyright © 2016年 qinakun. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *biaoti;
@property (weak, nonatomic) IBOutlet UILabel *neirong;
@property (weak, nonatomic) IBOutlet UILabel *zuozhe;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
/**
 *  	Copperplate,
	Heiti SC,
	Iowan Old Style,
	Kohinoor Telugu,
	Thonburi,
	Heiti TC,
	Courier New,
	Gill Sans,
	Apple SD Gothic Neo,
	Marker Felt,
	Avenir Next Condensed,
	Tamil Sangam MN,
	Helvetica Neue,
	Gurmukhi MN,
	Times New Roman,
	Georgia,
	Apple Color Emoji,
	Arial Rounded MT Bold,
	Kailasa,
	Kohinoor Devanagari,
	Kohinoor Bangla,
	Chalkboard SE,
	Sinhala Sangam MN,
	PingFang TC,
	Gujarati Sangam MN,
	Damascus,
	Noteworthy,
	Geeza Pro,
	Avenir,
	Academy Engraved LET,
	Mishafi,
	Futura,
	Farah,
	Kannada Sangam MN,
	Arial Hebrew,
	Arial,
	Party LET,
	Chalkduster,
	Hoefler Text,
	Optima,
	Palatino,
	Lao Sangam MN,
	Malayalam Sangam MN,
	Al Nile,
	Bradley Hand,
	PingFang HK,
	Trebuchet MS,
	Helvetica,
	Courier,
	Cochin,
	Hiragino Mincho ProN,
	Devanagari Sangam MN,
	Oriya Sangam MN,
	Snell Roundhand,
	Zapf Dingbats,
	Bodoni 72,
	Verdana,
	American Typewriter,
	Avenir Next,
	Baskerville,
	Khmer Sangam MN,
	Didot,
	Savoye LET,
	Bodoni Ornaments,
	Symbol,
	Menlo,
	Bodoni 72 Smallcaps,
	Papyrus,
	Hiragino Sans,
	PingFang SC,
	Euphemia UCAS,
	Telugu Sangam MN,
	Bangla Sangam MN,
	Zapfino,
	Bodoni 72 Oldstyle,
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  

}





-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    http://api.avatardata.cn/TangShiSongCi/Search?key=17407afc146d4425b74540a37bdefaaa&keyWord=秋兴
    [self loadJson];
    
}
-(void)loadJson{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"shici.json" withExtension:nil];

    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    Model *model = [Model new];

    int number =arc4random_uniform(11);
    NSString *num = [NSString stringWithFormat:@"%d",number];
    
    NSLog(@"%d",number);
    
    [model setValuesForKeysWithDictionary:arr[num]];
    
    self.biaoti.text = model.biaoti;
    
    self.neirong.text = model.neirong;
    

    self.zuozhe.text = model.zuozhe;

    

    
    
    
}


//-(void)test{
//    
//    NSString *urlStr = @"http://api.avatardata.cn/TangShiSongCi/Random?key=17407afc146d4425b74540a37bdefaaa";
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSURLSession *sess = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [sess dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        Model *model = [Model new];
//        [model setValuesForKeysWithDictionary:result[@"result"]];
//        
//        
//        self.biaoti.text = model.biaoti;
//        
//        self.neirong.text = model .neirong;
//        
//        NSLog(@"%@",result);
//        self.zuozhe.text = model.zuozhe;
//        
//        
//        
//    }];
//    
//    [task resume];
//    
//
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
