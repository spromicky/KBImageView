#import <QuartzCore/QuartzCore.h>
#import "KBImageView.h"

static const NSTimeInterval kKBDefaultTimePerImage    = 21.0f;
static const NSTimeInterval kKBDefaultChangeImageTime = 1.0f;

@implementation KBImageView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.timePerImage = self.timePerImage ? : kKBDefaultTimePerImage;
    self.changeImageTime = self.changeImageTime ? : kKBDefaultChangeImageTime;
    _index = -1;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timePerImage - self.changeImageTime
                                                  target:self
                                                selector:@selector(changeImage)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer fire];
}

- (void)dealloc
{
    [self.timer invalidate];
}

- (void)changeImage
{
    if (self.delegate && !self.indexPause) {
        _index = (_index + 1) % [self.delegate numberOfImagesInImageView:self];
        
        [self setImage:[self.delegate imageView:self imageForIndex:self.index]];
        
        CATransition *transition = [CATransition animation];
        transition.duration = self.changeImageTime;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        [self.layer addAnimation:transition forKey:nil];
    }
    
    [self animateLayerWithDuration:self.timePerImage changeState:YES];
}

- (void)animateLayerWithDuration:(NSTimeInterval)duration changeState:(BOOL)changeState
{
    CGFloat scale = 0;
    CGFloat moveX = 0;
    CGFloat moveY = 0;
    
    if (changeState) {
        _animationState = (_animationState + 1) % 4;
    }
    
    switch (_animationState) {
        case 0:
            scale = 1.25f;
            moveX   = -(self.frame.size.width * (scale - 1.0f));
            moveY   = -(self.frame.size.height * (scale - 1.0f));
            break;
            
        case 1:
            scale = 1.10f;
            moveX   = -(self.frame.size.width * (scale - 1.0f));
            moveY   = (self.frame.size.height * (scale - 1.0f));
            break;
            
        case 2:
            scale = 1.15f;
            moveX   = (self.frame.size.width * (scale - 1.0f));
            moveY   = -(self.frame.size.height * (scale - 1.0f));
            break;
            
        case 3:
            scale = 1.20f;
            moveX   = (self.frame.size.width * (scale - 1.0f));
            moveY   = (self.frame.size.height * (scale - 1.0f));
            break;
            
        default:
            scale = 1;
            moveX   = -(self.frame.size.width * (scale - 1.0f));
            moveY   = -(self.frame.size.height * (scale - 1.0f));
            break;
    }
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    CAKeyframeAnimation *translationXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CAKeyframeAnimation *translationYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    
    scaleAnimation.values = @[[self.layer.presentationLayer valueForKeyPath:@"transform.scale"] ? : @(self.layer.transform.m11), @(scale)];
    translationXAnimation.values = @[[self.layer.presentationLayer valueForKeyPath:@"transform.translation.x"] ? : @(self.layer.transform.m14), @(moveX / 2)];
    translationYAnimation.values = @[[self.layer.presentationLayer valueForKeyPath:@"transform.translation.y"] ? : @(self.layer.transform.m24), @(moveY / 2)];
    
    scaleAnimation.fillMode =
    translationXAnimation.fillMode =
    translationYAnimation.fillMode = kCAFillModeForwards;
    
    scaleAnimation.removedOnCompletion =
    translationXAnimation.removedOnCompletion =
    translationYAnimation.removedOnCompletion = NO;
    
    scaleAnimation.duration =
    translationXAnimation.duration =
    translationYAnimation.duration = duration;
    
    scaleAnimation.timingFunction =
    translationXAnimation.timingFunction =
    translationYAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:scaleAnimation forKey:@"transform"];
    [self.layer addAnimation:translationXAnimation forKey:@"transformTranslation"];
    [self.layer addAnimation:translationYAnimation forKey:@"transformTranslationY"];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    [super layoutSublayersOfLayer:layer];
    [self animateLayerWithDuration:[[self.timer fireDate] timeIntervalSince1970] - [[NSDate date] timeIntervalSince1970] changeState:NO];
}

@end
