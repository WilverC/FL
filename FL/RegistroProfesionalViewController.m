//
//  RegistroProfesionalViewController.m
//  FL
//
//  Created by CIC-IPN-E3 on 07/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import "RegistroProfesionalViewController.h"

@interface RegistroProfesionalViewController ()
{
    NSArray *_arrEstado;
    UIDatePicker *fechaPicker;
}

@end

@implementation RegistroProfesionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //this part of code, is from picker to use in state
    _arrEstado=@[@"Aguascalientes",@"Baja California Norte",@"Baja California Sur",@"Campeche",@"Cd. México",@"Chiapas",@"Chihuahua",@"Coahuila",@"Colima",@"Durango",@"Guanajuato",@"Guerrero",@"Hidalgo",@"Jalisco",@"Edo. México",@"Michoacan",@"Morelos",@"Nayarit",@"Nuevo León",@"Oaxaca",@"Puebla",@"Quinta Roo",@"San Luis Potosí",@"Sinaloa",@"Sonora",@"Tabasco",@"Tamaulipas",@"Tlaxcala",@"Veracruz",@"Yucatán",@"Zacatecas"];
    self.estadoPicker.delegate=self;
    self.estadoPicker.dataSource=self;
    
    //hace hacia la fecha con el textfield
    fechaPicker = [[UIDatePicker alloc]init];
    fechaPicker.datePickerMode=UIDatePickerModeDate;
    [self.fecNacRefPicker setInputView:fechaPicker];
    UIToolbar *barrita = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [barrita setTintColor:[UIColor grayColor]];
    UIBarButtonItem *listo= [[UIBarButtonItem alloc]initWithTitle:@"Listo!" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *espacio= [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [barrita setItems:[NSArray arrayWithObjects:espacio,listo,nil]];
    [self.fecNacRefPicker setInputAccessoryView:barrita];
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

//protocolos de el picker
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _arrEstado.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _arrEstado[row];
}

//Esto es para lo de fecha en el textfied
-(void)ShowSelectedDate{
    NSDateFormatter *formato =[[NSDateFormatter alloc]init];
    [formato setDateFormat:@"dd/MMM/YYYY"];
    self.fecNacRefPicker.text=[NSString stringWithFormat:@"%@",[formato stringFromDate:fechaPicker.date]];
    [self.fecNacRefPicker resignFirstResponder];
}

@end
