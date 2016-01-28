//
//  sendWeiboViewController.m
//  lyingWeibo
//
//  Created by 小木木 on 15/8/30.
//  Copyright (c) 2015年 小木木. All rights reserved.
//

#import "SendWeiboViewController.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MBProgressHUD+MJ.h"
#import "UIViewController+MMDrawerController.h"
#import "ThemeButton.h"


@interface SendWeiboViewController (){
    
    UITextView *textView;
    UIView *editorBar;
    UIImage *sendImage;
    UIImageView *imageView;
    CLLocationManager *_locationManager;
    NSString *address;
}

@end

@implementation SendWeiboViewController

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.title = @"发微博";
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    }
    return  self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self _createEditorViews];
    
    [textView becomeFirstResponder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendWeibo:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss:)];

}

-(void)_createEditorViews{
    //1 文本编辑视图
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, kWidth, 150)];
    textView.font = [UIFont systemFontOfSize:20];
    textView.editable = YES;
    
    
    textView.layer.cornerRadius = 10;
    textView.layer.borderWidth = 2;
    textView.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.view addSubview:textView];
    
    //工具栏
    editorBar = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight, kWidth, 55)];
    editorBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:editorBar];
    //新建多个编辑按钮
    NSArray *imgs = @[
                      @"compose_toolbar_1.png",
                      @"compose_toolbar_4.png",
                      @"compose_toolbar_3.png",
                      @"compose_toolbar_5.png",
                      @"compose_toolbar_6.png"
                      ];
    for (int i = 0; i<imgs.count; i++) {
        ThemeButton *button = [[ThemeButton alloc] initWithFrame:CGRectMake(15+kWidth/5*i, 20, 40, 33)];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10+i;
        button.normalImgName = imgs[i];
        [editorBar addSubview:button];
    }
}

-(SinaWeibo *)sinaweibo{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}

//发送微博
-(void)sendWeibo:(UIBarButtonItem *)button{
    SinaWeibo *sinaweibo = [self sinaweibo];
    NSString *text = textView.text;
    NSString *error = nil;
    if(text.length == 0){
        error = @"微博内容为空";
    }
    if (text.length > 140) {
        error = @"微博内容大与140字符";
    }
    if (error != nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:error delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:text forKey:@"status"];
    
        [sinaweibo requestWithURL:@"statuses/update.json" params:params httpMethod:@"POST" delegate:self];
        
//         NSData *data = UIImageJPEGRepresentation(sendImage, 1);
//        if (data.length > 1024*1024*2) {
//            
//            data = UIImageJPEGRepresentation(sendImage, 0.5);
//        }
//
//        
//        [params setObject:text forKey:@"status"];
//        [params setObject:data forKey:@"pic"];
//        [sinaweibo requestWithURL:@"statuses/upload.json" params:params httpMethod:@"POST" delegate:self];
        
        /*
         //02 带图片
         NSData *data = UIImageJPEGRepresentation(image, 1);
         
         //如果大于2M 则压缩
         if (data.length > 1024*1024*2) {
         
         data = UIImageJPEGRepresentation(image, 0.5);
         }
         NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];
         [dataDic setObject:data forKey:@"pic"];
         */
        
    }
}



//返回键
-(void)dismiss:(UIBarButtonItem *)button{

    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)buttonAction:(ThemeButton *)btn{
    if(btn.tag == 10){
        //选择照片
        [self _selectPhoto];
    }
    if (btn.tag == 13) {
        NSLog(@"btn.tag = %li",btn.tag);
        [self _location];
    }
    
    
}

#pragma mark - 键盘弹出通知

-(void)keyBoardWillShow:(NSNotification *)notification{
   
    //1 取出键盘frame
    NSValue *boundsValue = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect frame = [boundsValue CGRectValue];
    
    //2 键盘高度
    CGFloat height = frame.size.height;
    
    //3 调整视图高度
    //textView.height = kHeight-height-editorBar.height;
    editorBar.bottom = kHeight-height;
    
}

#pragma mark - 选择照片
-(void)_selectPhoto{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
    
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIImagePickerControllerSourceType sourceType;
    //选择相机 或者相册
    if(buttonIndex == 0){
        sourceType = UIImagePickerControllerSourceTypeCamera;
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if(!isCamera){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"摄像头无法使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alert show];
            return;
        }
    }else if(buttonIndex == 1){
        //选择相册
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }else{
        return;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
}

//照片选择代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //弹出相册控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //2 取出照片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, textView.bottom+10, 80, 80);
    [self.view addSubview:imageView];
    
    sendImage = image;
}

-(void)_location{
    
    /*  修改 info.plist 增加以下两项
    NSLocationWhenInUseUsageDescription  BOOL YES
    NSLocationAlwaysUsageDescription         string “提示描述”
    */
   
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        
        float str = [UIDevice currentDevice].systemVersion.floatValue;
        
        if (str > 8.0){
            // 获取授权使用地理位置服务
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];//设置定位精确度
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    //停止定位
    [_locationManager stopUpdatingLocation];
    //取得位置信息
    CLLocation *location = [locations lastObject];
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"经度 %lf,纬度 %lf",coordinate.longitude,coordinate.latitude);
    
    
    //地理位置反编码，通过坐标信息获取  位置详情
    
    NSString *coordinateStr = [NSString stringWithFormat:@"%f,%f",coordinate.longitude,coordinate.latitude];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:coordinateStr forKey:@"coordinate"];


    SinaWeibo *sinaWeibo = [self sinaweibo];
    
    [sinaWeibo requestWithURL:@"location/geo/geo_to_address.json" params:params
                   httpMethod:@"GET" delegate:self];
}



//发送成功
-(void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    
    NSLog(@"%@",result);
    NSArray *geos = [result objectForKey:@"geos"];
    if (geos.count > 0) {
        NSDictionary *geo = [geos lastObject];
        address = [geo objectForKey:@"address"];
        NSLog(@"address  %@",address);
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 330, kWidth-20, 50)];
    label.text = address;
    label.backgroundColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
    
//    [textView resignFirstResponder];
//    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//发送失败
-(void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    
    
    NSLog(@"%@",error);
}
@end
