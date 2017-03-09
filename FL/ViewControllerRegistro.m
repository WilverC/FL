//
//  ViewControllerRegistro.m
//  FL
//
//  Created by CIC-IPN-E3 on 07/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import "ViewControllerRegistro.h"
#import "RegistroEmpresaViewController.h"
#import "RegistroProfesionalViewController.h"

@interface ViewControllerRegistro ()

@property (weak, nonatomic) IBOutlet UISwitch *opcionEmPro;

-(IBAction)btnSiguiente:(id)sender;

@end

@implementation ViewControllerRegistro

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(IBAction)btnSiguiente:(id)sender{
    RegistroProfesionalViewController *rpvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistroProfesionalViewController"];
    RegistroEmpresaViewController *revc= [self.storyboard instantiateViewControllerWithIdentifier:@"RegistroEmpresaViewController"];
    
    if(self.opcionEmPro.isOn){
        [self presentViewController:revc animated:YES completion:^{}];
    }else{
        [self presentViewController:rpvc animated:YES completion:^{}];
    }
}

@end
