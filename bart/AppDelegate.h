
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) NSMutableArray *username;
@property (strong,nonatomic) NSMutableArray *password;


- (void) initializeUsernamePassword;


@end
