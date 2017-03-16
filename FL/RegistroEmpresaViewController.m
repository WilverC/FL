//
//  RegistroEmpresaViewController.m
//  FL
//
//  Created by CIC-IPN-E3 on 07/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import "RegistroEmpresaViewController.h"

@interface RegistroEmpresaViewController ()

@end

@implementation RegistroEmpresaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //this part of code, is from picker to use in state
    
    UIPickerView * pickerestado= [UIPickerView new];
    pickerestado.delegate = self;
    pickerestado.dataSource = self;
    pickerestado.showsSelectionIndicator = YES;
    [self.view addSubview:pickerestado];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)NumeroDeComponentesDelPicker:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    switch (row) {
        case 1:
            title =@"Ciudad de Mèxico";
            break;
        case 2:
            title=@"Estado de Mèxico";
            break;
        default:
            break;
    }
    return title;
}

@end
