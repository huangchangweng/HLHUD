//
//  ViewController.m
//  HLHUD
//
//  Created by JJB_iOS on 2022/5/25.
//

#import "ViewController.h"
#import "HLHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Private Method

- (void)hideHUD
{
    [HLHUD hide];
}

#pragma mark - Response Event

- (IBAction)showSuccessAction:(UIButton *)sender {
    [HLHUD showSuccessMsg:@"成功HUD"];
}

- (IBAction)showTextAction:(UIButton *)sender {
    [HLHUD showMsg:@"纯文字HUD"];
}

- (IBAction)showLodingAcrion:(UIButton *)sender {
    [HLHUD showLoading:nil];
    [self performSelector:@selector(hideHUD) withObject:nil afterDelay:5];
}

@end
