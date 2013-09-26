

#import <UIKit/UIKit.h>
#import "XMLParser.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) XMLParser *xml;
@property (strong,nonatomic) IBOutlet UILabel *timeleft;
@property (strong,nonatomic) IBOutlet UILabel *platform;
@property (strong,nonatomic) IBOutlet UILabel *destination;
@property (strong,nonatomic) IBOutlet UITableView *table;
@property (strong,nonatomic) IBOutlet UIButton *map;
- (IBAction)getResult:(id)sender;

@end
