//
//  KIBaseFetchedResultsController.h
//  Kijiji
//
//  Created by Alejandro Rodriguez on 2/13/15.

//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface KIBaseFetchedResultsController : UIViewController <NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) BOOL suspendAutomaticTrackingOfChangesInManagedObjectContext;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property BOOL debug;


-(id) initWithFetchedResultsController: (NSFetchedResultsController *) aFetchedResultsController;

- (void)performFetch;

@end
