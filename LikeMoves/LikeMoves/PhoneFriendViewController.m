//
//  PhoneFriendViewController.m
//  LikeMoves
//
//  Created by 粒橙Leo on 14-10-9.
//  Copyright (c) 2014年 Licheng Yang. All rights reserved.
//

#import "PhoneFriendViewController.h"

@interface PhoneFriendViewController ()

@end

@implementation PhoneFriendViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _bl=[[LMContactBL alloc] init];
    _bl.delegate=self;
    
    [_phoneInput becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)searchFriend:(id)sender {
    NSString* phone= _phoneInput.text;
    [_bl addFriendByPhone:phone];
    
}
#pragma mark - ContactBLDelegate
-(void)addFriendByPhoneSuccess:(NSInteger)status{
        if (status==6201) {
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:nil message:@"好友请求已成功发送"  delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];

    } else if(status==6000){
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:nil message:@"找不到此用户"  delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];

    }

}

@end