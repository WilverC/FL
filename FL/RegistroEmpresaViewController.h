//
//  RegistroEmpresaViewController.h
//  FL
//
//  Created by CIC-IPN-E3 on 07/03/17.
//  Copyright © 2017 Alberto Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistroEmpresaViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *estadoPicker;

@end
