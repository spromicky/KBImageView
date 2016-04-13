#import <UIKit/UIKit.h>

@class KBImageView;
@protocol KBImageViewDelegate <NSObject>

/**
 *  Asks delegate to return the number of images in slide show.
 *
 *  @param imageView An object that required a number of images.
 *
 *  @return The number of images in slide show.
 */
- (NSUInteger)numberOfImagesInImageView:(KBImageView *)imageView;

/**
 *  Asks delegate to return the image for given index.
 *
 *  @param imageView An object that required a number of images.
 *  @param index     An index number identifying image positin in slide show.
 *
 *  @return An image for current index.
 */
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
