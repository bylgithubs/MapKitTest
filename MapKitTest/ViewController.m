//
//  ViewController.m
//  MapKitTest
//
//  Created by Civet on 2019/4/25.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>

@property(nonatomic) CLLocationManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MKMapView *map = [[MKMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:map];
    //设置地图类型
    //map.mapType = MKMapTypeHybridFlyover;
    //设置地图中心位置和比例尺
    //map.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(39.26, 116.3), MKCoordinateSpanMake(1.8, 2.05));
    
    //是否显示用户位置
    map.showsUserLocation = YES;
    //用户位置的追踪模式
    map.userTrackingMode = MKUserTrackingModeFollow;
    
    //添加大头针标签
    MKPointAnnotation *ann = [[MKPointAnnotation alloc]init];
    ann.coordinate = CLLocationCoordinate2DMake(39.26, 116.3);
    ann.title = @"我的位置";
    ann.subtitle = @"中华人民共和国北京";
    [map addAnnotation:ann];
    //自定义大头针代理
    map.delegate = self;
    
    
//    //下面是C的语法，创建一个结构体数组
//    CLLocationCoordinate2D *coor;
//    coor = malloc(sizeof(CLLocationCoordinate2D)*5);
//    for (int i = 0; i < 5; i++){
//        CLLocationCoordinate2D po = CLLocationCoordinate2DMake(33.23 + i * 0.01, 113.112 + (i % 2) * 0.01);
//        coor[i] = po;
//    }
//    //创建一个折线对象
//    MKPolyline *line = [MKPolyline polylineWithCoordinates:coor count:5];
//    //释放指针
//    free(coor);
//    coor=nil;
//    [map addOverlay:line];
    
    
    //添加圆形覆盖物
    MKCircle *cirle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(34.23, 113.122) radius:500];
    [map addOverlay:cirle];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"id"];
    view.image = [UIImage imageNamed:@"image"];
    //设置开启详情视图
    view.canShowCallout = YES;
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    view1.backgroundColor = [UIColor redColor];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 50)];
    view2.backgroundColor = [UIColor blueColor];
    
    //设置左右辅助视图
    view.leftCalloutAccessoryView = view1;
    view.rightCalloutAccessoryView = view2;
    //设置拖拽，可以通过点击不放进行拖曳
    view.draggable = YES;
    return view;
//    view.pinTintColor = [UIColor purpleColor];
//    return  view;
}

//覆盖物绘制的代理
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    //折线覆盖物提供类
    MKCircleRenderer *render = [[MKCircleRenderer alloc]initWithCircle:overlay];
    //设置线宽
    render.lineWidth = 3;
    //填充颜色
    render.fillColor = [UIColor greenColor];
    //设置颜色
    render.strokeColor = [UIColor redColor];
    return  render;
}



////覆盖物绘制的代理
//- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
//    //折线覆盖物提供类
//    MKPolylineRenderer *render = [[MKPolylineRenderer alloc]initWithPolyline:overlay];
//    //设置线宽
//    render.lineWidth = 3;
//    //设置颜色
//    render.strokeColor = [UIColor redColor];
//    return  render;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
