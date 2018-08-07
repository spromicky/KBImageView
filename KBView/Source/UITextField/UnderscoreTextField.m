#import "UnderscoreTextField.h"

@implementation UnderscoreTextField

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1.f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextMoveToPoint(ctx, 0, rect.size.height);
    CGContextAddLineToPoint(ctx, rect.size.width, rect.size.height);
    CGContextStrokePath(ctx);
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
    NSDictionary *drawAttributes = @{NSFontAttributeName: self.font,
                                     NSForegroundColorAttributeName : [UIColor lightGrayColor]};
    if (@available(iOS 11, *)) {
    } else {
        CGSize textSize = [[self placeholder] sizeWithAttributes:@{NSFontAttributeName : self.font}];
        rect.origin.y = (self.frame.size.height - textSize.height) / 2;        
    }
    [[self placeholder] drawInRect:rect withAttributes:drawAttributes];
}

@end
