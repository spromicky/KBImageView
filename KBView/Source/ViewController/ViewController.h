#import <UIKit/UIKit.h>
#import "KBImageView.h"

@interface ViewController : UIViewController <KBImageViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet KBImageView *imageView;
@property (nonatomic, strong) IBOutlet UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;

- (IBAction)hideKeyboard:(id)sender;

@end

