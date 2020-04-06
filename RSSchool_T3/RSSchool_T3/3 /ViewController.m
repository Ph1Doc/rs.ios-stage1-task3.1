#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *labelResultColor;
@property (nonatomic, strong) UILabel *labelRed;
@property (nonatomic, strong) UILabel *labelBlue;
@property (nonatomic, strong) UILabel *labelGreen;

@property (nonatomic, strong) UITextField *textFieldRed;
@property (nonatomic, strong) UITextField *textFieldGreen;
@property (nonatomic, strong) UITextField *textFieldBlue;

@property (nonatomic, strong) UIButton *buttonProcess;

@property (nonatomic, strong) UIView *viewResultColor;

@end

@implementation ViewController


#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];

    UIColor *color = [UIColor blackColor];

    double viewWidth = self.view.bounds.size.width;

    self.view.accessibilityIdentifier = @"mainView";

    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 100, 30)];
    self.labelResultColor.text = @"Color";
    [self.view addSubview:_labelResultColor];
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";

    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 200, 30)];
    self.viewResultColor.backgroundColor = color;
    [self.view addSubview:self.viewResultColor];
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";

    self.labelRed = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, 70, 30)];
    self.labelRed.text = @"RED";
    [self.view addSubview:self.labelRed];
    self.labelRed.accessibilityIdentifier = @"labelRed";

    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 250, 30)];
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    [self.textFieldRed addTarget:self action:@selector(tapTextField) forControlEvents:UIControlEventAllTouchEvents];
    [self.view addSubview:self.textFieldRed];
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";

    self.labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 70, 30)];
    self.labelGreen.text = @"GREEN";
    [self.view addSubview:self.labelGreen];
    self.labelGreen.accessibilityIdentifier = @"labelGreen";

    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 250, 30)];
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    [self.textFieldGreen addTarget:self action:@selector(tapTextField) forControlEvents:UIControlEventAllTouchEvents];
    [self.view addSubview:self.textFieldGreen];
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";

    self.labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 70, 30)];
    self.labelBlue.text = @"BLUE";
    [self.view addSubview:self.labelBlue];
    self.labelBlue.accessibilityIdentifier = @"labelBlue";

    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(100, 250, 250, 30)];
    self.textFieldBlue.placeholder = @"0..255";
    self.textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    [self.textFieldBlue addTarget:self action:@selector(tapTextField) forControlEvents:UIControlEventAllTouchEvents];
    [self.view addSubview:self.textFieldBlue];
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";


    self.buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(viewWidth / 2 - 35, 300, 70, 30)];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.buttonProcess addTarget:self action:@selector(process) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonProcess];
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";

    // todo

}


- (void)process {

    NSString *red = self.textFieldRed.text;
    NSString *green = self.textFieldGreen.text;
    NSString *blue = self.textFieldBlue.text;

    if (([red intValue] > 255) || ([green intValue] > 255) || ([blue intValue] > 255)
        || ([red intValue] < 0) || ([green intValue] < 0) || ([blue intValue] < 0)
        || [red isEqualToString:@""] || [green isEqualToString:@""] || [blue isEqualToString:@""]
        || (![ViewController stringIsNumeric:red]) || (![ViewController stringIsNumeric:green]) || (![ViewController stringIsNumeric:blue])
        ){
        self.labelResultColor.text = @"Error";
    } else {
        UIColor *color = [UIColor colorWithRed:[red doubleValue]/255
                                         green:[green doubleValue]/255
                                          blue:[blue doubleValue]/255
                                         alpha:1];

        self.viewResultColor.backgroundColor = color;
        self.labelResultColor.text = [ViewController hexStringFromColor:color];
    }

    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
}

- (void)tapTextField {
    self.labelResultColor.text = @"Color";
}

+ (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);

    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];

    return [NSString stringWithFormat:@"0x%02X%02X%02X",
            (int)(r * 255),
            (int)(g * 255),
            (int)(b * 255)];
}

+ (BOOL) stringIsNumeric:(NSString *) str {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:str];
    [formatter release];
    return !!number;
}

@end
