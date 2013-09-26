
#import "ViewController.h"
#import "bart.h"
@implementation ViewController
@synthesize xml,timeleft,platform,destination,table,map;




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"------%d", [xml.barttrains count]);
    return [self.xml.barttrains count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    bart *train;

    train = [xml.barttrains objectAtIndex:indexPath.row];
  
    
    cell.textLabel.text = train.destination;
    cell.detailTextLabel.text = train.timeleft;
   // cell.detailTextLabel.text = train.timeleft;
    
     
    
    return cell;
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	//[xml.barttrains addObject:@selector(timeleft)];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)getResult:(id)sender {
    //xml = [XMLParser alloc];
   xml = [[XMLParser alloc] initwithXMLbyURL:@"http://api.bart.gov/api/etd.aspx?cmd=etd&orig=12th&key=MW9S-E7SL-26DU-VV8V"];
    bart *train;
    train = [xml.barttrains objectAtIndex:0];
    //NSLog(@"%@",xml.)
    timeleft.text = train.timeleft;
    platform.text = train.platform;
    destination.text = train.destination;
    [table reloadData];
    
    
}
@end
