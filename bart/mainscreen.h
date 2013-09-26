
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface mainscreen : UIViewController

@property (strong ,nonatomic) IBOutlet UITextField *Username;
@property (strong ,nonatomic) IBOutlet UITextField *Password;
@property (strong,nonatomic) NSMutableArray *userArray;
@property (strong,nonatomic) NSMutableArray *passwordArray;

-(IBAction)authenticateUser:(id)sender;
-(IBAction)cancel:(id)sender;

@end
