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

/**
 *  Timer that reposive for changing of images.
 */
@property (nonatomic, strong)   NSTimer *timer;

/**
 *  Index of the current selected image in imageView.
 */
@property (nonatomic, readonly) NSInteger index;

/**
 *  What kind of animation is currently is used for image.
 */
@property (nonatomic, readonly) NSUInteger animationState;

/**
 *  What time interval used for every image animation.
 */
@property (nonatomic)           IBInspectable CGFloat timePerImage;

/**
 *  What time interval used for animation changing of images.
 */
@property (nonatomic)           IBInspectable CGFloat changeImageTime;

/**
 *  `YES` if indexes of images are stops to change. And currently just change `animationState` for same image.
 */
@property (nonatomic, getter=isIndexPause) BOOL indexPause;


/**
 *  Delegate, that will be used for calls in `KBImageViewDelegate`.
 */
@property (nonatomic, weak)     IBOutlet id<KBImageViewDelegate> delegate;

@end
