//
//  RegistroProfesionalViewController.h
//  FL
//
//  Created by CIC-IPN-E3 on 07/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistroProfesionalViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *estadoPicker;

@property (weak, nonatomic) IBOutlet UITextField *fecNacRefPicker;


@end
