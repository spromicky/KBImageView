#import <UIKit/UIKit.h>

@class KBImageView;
@protocol KBImageViewDelegate <NSObject>

- (NSUInteger)numberOfImagesInImageView:(KBImageView *)imageView;
- (UIImage *)imageView:(KBImageView *)imageView imageForIndex:(NSUInteger)index;

@end

@interface KBImageView : UIImageView

@property (nonatomic, strong)   NSTimer *timer;
@property (nonatomic, readonly) NSInteger index;
@property (nonatomic, readonly) NSUInteger animationState;
@property (nonatomic)           IBInspectable CGFloat timePerImage;
@property (nonatomic)           IBInspectable CGFloat changeImageTime;
@property (nonatomic, getter=isIndexPause) BOOL indexPause;

@property (nonatomic, weak)     IBOutlet id<KBImageViewDelegate> delegate;

@end
