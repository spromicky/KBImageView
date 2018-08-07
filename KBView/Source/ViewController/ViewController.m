#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.visualEffectView.layer.cornerRadius = 8.f;
    self.loginButton.layer.cornerRadius = 4.f;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardAnimationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    self.centerConstraint.constant = -fabs(self.view.frame.size.height - keyboardRect.origin.y) / 2.f;
    
    [UIView animateWithDuration:keyboardAnimationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return !CGRectContainsPoint(self.visualEffectView.frame, [gestureRecognizer locationInView:self.view]);
}

- (IBAction)hideKeyboard:(id)sender
{
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - KBImageViewDelegate
- (NSUInteger)numberOfImagesInImageView:(KBImageView *)imageView
{
    return 7;
}

- (UIImage *)imageView:(KBImageView *)imageView imageForIndex:(NSUInteger)index
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg", index + 1]];
}

@end
