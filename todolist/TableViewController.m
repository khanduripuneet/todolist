//
//  TableViewController.m
//  todolist
//
//  Created by Puneet Khanduri on 10/15/13.
//  Copyright (c) 2013 Puneet Khanduri. All rights reserved.
//

#import "TableViewController.h"
#import "DefaultCell.h"

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *tasks;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)addTask:(id)sender{
    NSString *task = @"new task";
    [self.tasks addObject:task];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTask:)];
    self.navigationItem.leftBarButtonItem = addButtonItem;
    
    UINib *defaultNib = [UINib nibWithNibName:@"DefaultCell" bundle:Nil];
    [self.tableView registerNib:defaultNib forCellReuseIdentifier:@"Cell"];
    
    [self loadTaskData];

//    UITapGestureRecognizer * dismiss = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//    
//    dismiss.delegate = self;
//    
//    [self.tableView addGestureRecognizer:dismiss];
    
    
}
-(void)dismissKeyboard {
    [self.tableView endEditing:YES];
    [self saveTaskData];
}
-(void) saveTaskData {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.tasks];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"tasks"];
}

-(void) loadTaskData {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"tasks"];
    self.tasks = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (self.tasks == Nil) {
        self.tasks = [[NSMutableArray alloc] init];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    DefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.description.text = [self.tasks objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


@end
