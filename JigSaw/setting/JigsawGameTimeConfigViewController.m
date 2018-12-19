//
//  JigsawGameTimeConfigViewController.m
//  JigSaw
//
//  Created by jianfang zhang on 2018/12/12.
//  Copyright © 2018 jianfang zhang. All rights reserved.
//

#import "JigsawGameTimeConfigViewController.h"

#define TIME_PICKER_VIEW_HEIGHT 200
#define TIME_PICKER_ROW_HEIGHT 20

@interface JigsawGameTimeConfigViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *timePickerSourceArr;
}
@property (nonatomic, strong) UIPickerView *timePicker;

@end

@implementation JigsawGameTimeConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    timePickerSourceArr = @[@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"];
    [self.view addSubview:self.timePicker];
    
    // Do any additional setup after loading the view.
}

#pragma mark - inner methods

- (UIPickerView *)timePicker
{
    if (nil == _timePicker)
    {
        _timePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,
                                                                     CGRectGetHeight(self.view.bounds) - TIME_PICKER_VIEW_HEIGHT,
                                                                     CGRectGetWidth(self.view.bounds),
                                                                     TIME_PICKER_VIEW_HEIGHT)];
        _timePicker.delegate = self;
        _timePicker.dataSource = self;
    }
    return _timePicker;
}

#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return timePickerSourceArr.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return TIME_PICKER_ROW_HEIGHT;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                             0,
                                                             CGRectGetWidth(self.view.bounds),
                                                             TIME_PICKER_ROW_HEIGHT)];
    lbl.text = [timePickerSourceArr objectAtIndex:row];
    lbl.textAlignment = NSTextAlignmentCenter;
    return lbl;
}

@end
