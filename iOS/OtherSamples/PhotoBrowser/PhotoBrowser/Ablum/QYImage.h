#import <UIKit/UIKit.h>
@interface QYImage : NSObject
+ (UIImage *)fixOrientation:(UIImage*)aImage;
+ (UIImage *)fixImageOrientation:(UIImage*)aImage;
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
+ (UIImage *)cropThumbnail:(UIImage *)image;
@end
