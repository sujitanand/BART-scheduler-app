
#import <Foundation/Foundation.h>
#import "bart.h"

@interface XMLParser : NSObject<NSXMLParserDelegate>

@property (strong,nonatomic) NSMutableArray *barttrains;
@property (strong,nonatomic) bart *currenttrain;
@property (strong,nonatomic) NSXMLParser *parser;


-(id) initwithXMLbyURL:(NSString *) urlString;    
@end
