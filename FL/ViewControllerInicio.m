//
//  ViewController.m
//  FL
//
//  Created by Alberto Garcia on 24/01/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import "ViewControllerInicio.h"
#import "ViewControllerInicioSesion.h"
#import "ViewControllerRegistro.h"

@interface ViewControllerInicio ()

-(IBAction)btnSoyEmpresa:(id)sender;
-(IBAction)btnSoyNuevo:(id)sender;

@end

@implementation ViewControllerInicio

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hello world");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Probando{
    NSLog(@"Hola");
}

//muestra la ventana de iniciar sesion
-(IBAction)btnSoyEmpresa:(id)sender{
    ViewControllerInicioSesion *vcis = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerInicioSesion"];
    
    [self presentViewController:vcis animated:YES completion:^{}];
}

//muestra la venta de registro nuevo
-(IBAction)btnSoyNuevo:(id)sender{
    ViewControllerRegistro *vcr = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerRegistro"];
    [self presentViewController:vcr animated:YES completion:^{}];
}




@end
