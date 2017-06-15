#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>
#import <ImageIO/ImageIO.h>
#import <AVFoundation/AVFoundation.h>
#import "UIImage+Ex.h"

#define  PhotosAlbum [QYPhotoAlbum instance]

typedef void (^QYAssetsListBlock)(NSArray *arrAssets);
typedef void (^QYAblumGroupsBlock)(NSArray *arrGroups);
typedef void (^QYAblumPhotoBlock)(UIImage *fullResolutionImage);

@interface QYPhotoAlbum : NSObject
@property (assign) BOOL isOpening;

+ (instancetype)instance;
- (void)clean;
- (void)cleanPhotosQueue;
- (UIImage*)photoToMin:(UIImage*)photo;

//url获取图片
- (void)getFullImageByAsset:(ALAsset*)asset photoBlock:(QYAblumPhotoBlock)photoBlock failure:(void(^)(NSError *error))failure;
- (void)getFullImageByURL:(NSString*)assetUrl photoBlock:(QYAblumPhotoBlock)photoBlock assetBlock:(void(^)(ALAsset *asset))assetBlock failure:(void(^)(NSError *error))failure;
- (void)getFullImageByAssetList:(NSArray*)list photoBlock:(QYAblumPhotoBlock)photoBlock failure:(void(^)(NSError *error))failure;
- (void)getImagesByAssetList:(NSArray*)list photosBlock:(void(^)(NSArray* listPhotos))photosBlock failure:(void(^)(NSError *error))failure;

//保存
- (void)saveImageToSavePhoto:(UIImage*)image resultBlock:(void(^)(NSString *url, ALAsset *asset))resultBlock failure:(void(^)(NSError *error))failure;
////
- (void)getSavedPhotosBlock:(QYAssetsListBlock)resultBlock failure:(void(^)(NSError *error))failure;
- (void)getSavedPhotosOldFirstBlock:(QYAssetsListBlock)resultBlock failure:(void(^)(NSError *error))failure;

- (void)getPhotosGroupsBlock:(QYAblumGroupsBlock)resultBlock failure:(void(^)(NSError *error))failure;
- (void)getPhotoAssetsByGroup:(ALAssetsGroup *)group resultBlock:(QYAssetsListBlock)resultBlock;


#pragma mark - 检查设置状态
+ (BOOL)checkAlbumAuthorizationStatus;
+ (BOOL)checkCameraAuthorizationStatus;
@end
