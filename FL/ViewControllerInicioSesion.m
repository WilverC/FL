//
//  ViewControllerInicioSesion.m
//  FL
//
//  Created by CIC-IPN-E3 on 21/02/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import "ViewControllerInicioSesion.h"

@interface ViewControllerInicioSesion ()

@property (weak, nonatomic) IBOutlet UITextField *txtUsuario;
@property (weak, nonatomic) IBOutlet UITextField *txtContrasenia;

- (IBAction)btnAceptar:(UIButton *)sender;

@end

@implementation ViewControllerInicioSesion

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

- (IBAction)btnAceptar:(UIButton *)sender {
}
@end
