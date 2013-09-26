
#import "XMLParser.h"

@implementation XMLParser

@synthesize barttrains,currenttrain,parser;

static int i;

-(id) initwithXMLbyURL:(NSString *) urlString{
    
    barttrains = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
    
    
    
    return self; 
}
NSString *currentKey;
NSMutableString *currentValue;
bool update,update1,update2;
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    currentKey=nil;
    currentValue=nil;
   
    if([elementName isEqualToString:@"etd"]){
        currenttrain =[[bart alloc] init];
        update = YES;
        update1 = YES;
        update2 = YES;
    }
    if([elementName isEqualToString:@"minutes"] && update1 == YES){
            currentKey = @"minutes";
           
    }
    if([elementName isEqualToString:@"platform"] && update2 == YES){
        currentKey = @"platform";
        
    }
    if([elementName isEqualToString:@"destination"] && update == YES){
        currentKey = @"destination";
        update = NO;
    }    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(currentKey){
        if(!currentValue){
            currentValue = [[NSMutableString alloc] initWithCapacity:100];
            }
        [currentValue appendString:string];
      //  NSLog(@"%@",currentValue);
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{ 
    
    if([elementName isEqualToString:@"minutes"] && update1 == YES){
        currenttrain.timeleft = currentValue;
         update1 = NO;
    }
    if([elementName isEqualToString:@"platform"] && update2 == YES){
        currenttrain.platform = currentValue;
         update1 = NO;
    }
    if([elementName isEqualToString:@"destination"]){
        currenttrain.destination = currentValue;
    }    
    if([elementName isEqualToString:@"etd"]){
        [barttrains addObject:currenttrain];
        currenttrain = nil;
        i++;
    }    
}
@end
