

#import "mainscreen.h"
#import "ViewController.h"

@implementation mainscreen

@synthesize Username,Password,userArray,passwordArray;
AppDelegate *delegate;


-(IBAction)authenticateUser:(id)sender{
    NSString *name=Username.text ;//= [[NSString alloc] initWithString:[Username text]];
    NSString *pass=Password.text ;//= [[NSString alloc] initWithString:[Password text]];
    
    
    userArray = [delegate username];
    passwordArray = [delegate password];
    
       
    
   
    int index;
     NSLog(@"name%@",name);
    
    for(index = 0 ; index < [userArray count] ; index ++)
    {
//        NSLog(@"name%@",[userArray objectAtIndex:index]);
//         NSLog(@"pass%@",[passwordArray objectAtIndex:index]);
        
        if([name isEqualToString:[userArray objectAtIndex:index]])
        {
            break;
            
        }
    }
    
    if(index == [userArray count]){
        
        UIAlertView *alert = [[UIAlertView alloc ] initWithTitle:@"Alert" message:@"username or password not found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    else {
        if([pass isEqualToString:[passwordArray objectAtIndex:index]]){
            NSLog(@"name%@",[userArray objectAtIndex:index]);
            NSLog(@"pass%@",[passwordArray objectAtIndex:index]);   
            UIStoryboard *story = self.storyboard;
            ViewController *viewvc = [story instantiateViewControllerWithIdentifier:@"viewVC"];
            [self.navigationController pushViewController:viewvc animated:YES] ;
            
            
        }
        
        
    }
    Username.text = nil;
    Password.text = nil;
    
    
    
}



-(IBAction)cancel:(id)sender{
    [Username resignFirstResponder];
    [Password resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
     UIApplication *app = [UIApplication sharedApplication];
     delegate = app.delegate;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
