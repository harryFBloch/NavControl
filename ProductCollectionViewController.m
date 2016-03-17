//
//  ProductCollectionViewController.m
//  NavCtrl
//
//  Created by harry bloch on 3/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "MyCell.h"
#import "WebSitViewController.h"
#import "MyDataController.h"
#import "AddProductViewController.h"

@interface ProductCollectionViewController ()

@end

@implementation ProductCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    self.view.backgroundColor = [UIColor purpleColor];
    // Do any additional setup after loading the view.
    [self addButtons];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_patterns_lines_shadow_43860_1920x1080.jpg"]];
    
    self.installsStandardGestureForInteractiveMovement = true;
}
-(void)addButtons{
    self.addButton = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(addRow)];
    [self.addButton setTintColor:[UIColor redColor]];
    self.undoButton = [[UIBarButtonItem alloc] initWithTitle:@"Undo" style:UIBarButtonItemStylePlain target:self action:@selector(undoButtonHandle)];
    [self.undoButton setEnabled:NO];
    [self.undoButton setTintColor:[UIColor clearColor]];
    self.saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonHandle)];
    [self.saveButton setTintColor:[UIColor redColor]];
    self.deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteButtonHandle)];
    [self.deleteButton setTintColor:[UIColor redColor]];
    [self.editButtonItem setTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    
    
    NSArray *tempButtonArray = [[NSArray alloc]initWithObjects:self.deleteButton,self.addButton,self.undoButton,self.saveButton,self.editButtonItem, nil];
    self.navigationItem.rightBarButtonItems = tempButtonArray;
}
-(void)deleteButtonHandle{
    if (!self.editing) {
    if (self.deletingInt%2==0) {
        [self.undoButton setEnabled:YES];
        [self.undoButton setTintColor:[UIColor redColor]];
        [self.editButtonItem setEnabled:NO];
        [self.editButtonItem setTintColor:[UIColor clearColor]];
        self.deleteButton.title = @"Done";
        self.isDeleting = true;
        [self.editButtonItem setEnabled:YES];
        [self.editButtonItem setTintColor:[UIColor redColor]];
    }else{
        self.deleteButton.title = @"Delete";
        self.isDeleting = false;
    }
    
    self.deletingInt++;
    }
}
-(void)viewDidAppear:(BOOL)animated{
    [self.collectionView reloadData];
}
-(void)undoButtonHandle{
    MyDataController *coredata = [MyDataController sharedManager];
    self.currentCompany = [coredata productUndo:self.currentCompany.index];
    [self.collectionView reloadData];
}
-(void)saveButtonHandle{
    MyDataController *temp1 = [MyDataController sharedManager];
    [temp1 saveChanges];
}
-(void)addRow{
    AddProductViewController *add = [[AddProductViewController alloc]init];
    add.title = @"Add a Product";
    add.currentCompany = self.currentCompany;
    [add autorelease];
    [self presentViewController:add animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+(id)sharedManager{
    static ProductCollectionViewController *viewManager = nil;
    @synchronized(self) {
        if (viewManager == nil) {
            viewManager = [[self alloc]init];
        }
    }
    return viewManager;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.currentCompany.productObjectArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    self.tempProduct = self.currentCompany.productObjectArray[indexPath.row];
    // Configure the cell
    cell.cellLabel.text = self.tempProduct.productName;
    cell.cellLabel.textColor = [UIColor whiteColor];
    cell.cellLogo.image =[UIImage imageNamed: self.tempProduct.productImg];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isDeleting == true) {
        MyDataController *tempDC = [MyDataController sharedManager];
        Dao *data = [Dao sharedManager];
        Product *deletedProduct = self.currentCompany.productObjectArray[indexPath.row];
        [self.currentCompany.productObjectArray removeObjectAtIndex:indexPath.row];
        [data.companyList replaceObjectAtIndex:self.currentCompany.Pk withObject:self.currentCompany];
        [tempDC deleteProduct:self.currentCompany product:deletedProduct];
        [self.collectionView reloadData];
        return;
    }
    if (self.editing == YES) {
        NSLog(@"editing Mode Entered");
        AddProductViewController *pushController = [[AddProductViewController alloc]init];
        pushController.title = @"edit a Product";
        pushController.currentProduct = self.currentCompany.productObjectArray[indexPath.row];
        pushController.currentCompany = self.currentCompany;
        [self presentViewController:pushController animated:YES completion:nil];
        
    }else{
        Product *temp = self.currentCompany.productObjectArray[indexPath.row];
        WebSitViewController *detailViewController = [[WebSitViewController alloc]init];
        detailViewController.websiteUrl = [[NSURL alloc]initWithString:temp.productURL];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}
#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    MyDataController *tempDC = [MyDataController sharedManager];
    Product *temp = self.currentCompany.productObjectArray[sourceIndexPath.row];
    [self.currentCompany.productObjectArray insertObject:temp atIndex:destinationIndexPath.row];
    [self.currentCompany.productObjectArray removeObjectAtIndex:sourceIndexPath.row];
    [tempDC ProductRearrange:self.currentCompany];
    [self.undoButton setEnabled:YES];
    [self.undoButton setTintColor:[UIColor redColor]];
}

@end
