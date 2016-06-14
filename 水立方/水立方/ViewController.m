//
//  ViewController.m
//  水立方
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView_transition;
@property (nonatomic , strong)CATransition * picTransition;

@property (nonatomic , strong)UISwipeGestureRecognizer * to_Rightrecognizer;
@property (nonatomic , strong)UISwipeGestureRecognizer * to_Leftrecognizer;
@property (nonatomic , strong)UISwipeGestureRecognizer * to_Toprecognizer;
@property (nonatomic , strong)UISwipeGestureRecognizer * to_Bottomrecognizer;
@property (nonatomic , strong)NSArray<NSString *> * imageNameArr;
@end

@implementation ViewController
- (NSArray<NSString *> *)imageNameArr
{
    if (!_imageNameArr) {
        _imageNameArr = @[@"1-121116141Q8",@"91Z9IEV67V13",@"99C343D908B1",@"120414144943121",@"LKKPHOUP9RWV",@"MHM42Z50KMBL"];
    }

    return _imageNameArr;


}


- (UISwipeGestureRecognizer *)to_Toprecognizer
{
    if (!_to_Toprecognizer) {
        _to_Toprecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe :)];
        
        _to_Toprecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    }

    return _to_Toprecognizer;
}
- (UISwipeGestureRecognizer *)to_Leftrecognizer
{
    if (!_to_Leftrecognizer) {
        _to_Leftrecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe :)];
        
        _to_Leftrecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    }
    
    return _to_Leftrecognizer;
}
- (UISwipeGestureRecognizer *)to_Bottomrecognizer
{
    if (!_to_Bottomrecognizer) {
        _to_Bottomrecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe :)];
        
        _to_Bottomrecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    }
    
    return _to_Bottomrecognizer;
}
- (UISwipeGestureRecognizer *)to_Rightrecognizer
{
    if (!_to_Rightrecognizer) {
        _to_Rightrecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
        
        _to_Rightrecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        _to_Rightrecognizer.numberOfTouchesRequired =1;
    }
    
    return _to_Rightrecognizer;
}

- (CATransition *)picTransition
{
    if (!_picTransition) {
        _picTransition = [CATransition animation];
        
        _picTransition.type = @"cube";
        
        _picTransition.duration = 1.0f;
    }

    return  _picTransition;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ImageView_transition.image = [UIImage imageNamed:@"LKKPHOUP9RWV"];
    
    [self.view addGestureRecognizer:self.to_Rightrecognizer];
    [self.view addGestureRecognizer:self.to_Toprecognizer];
    [self.view addGestureRecognizer:self.to_Leftrecognizer];
    [self.view addGestureRecognizer:self.to_Bottomrecognizer];
    
    
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)swipe : (UISwipeGestureRecognizer *)recognizer
{
    
// self.ImageView_transition.image = [UIImage imageNamed:@"MHM42Z50KMBL"];
    [self transitionAnimateWithDirection:recognizer.direction];

}

-(void) transitionAnimateWithDirection : (NSInteger)direction{

    switch (direction) {
        case UISwipeGestureRecognizerDirectionDown:
        {
            self.picTransition.subtype = kCATransitionFromBottom;
        
        }
            break;
        case UISwipeGestureRecognizerDirectionLeft:
        {
            
             self.picTransition.subtype = kCATransitionFromRight;
        }
            break;
        case UISwipeGestureRecognizerDirectionUp:
        {
            self.picTransition.subtype = kCATransitionFromTop;
            
        }
            break;
        case UISwipeGestureRecognizerDirectionRight:
        {
            
             self.picTransition.subtype = kCATransitionFromLeft;
        }
            break;
            
        default:
            break;
    }
    
    self.ImageView_transition.image = [UIImage imageNamed:self.imageNameArr[arc4random_uniform(5)]];
    [self.ImageView_transition.layer addAnimation:self.picTransition forKey:nil];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
