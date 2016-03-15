//
//  MYCollectionViewController.m
//  NavCtrl
//
//  Created by harry bloch on 3/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "MYCollectionViewController.h"
#import "MyCell.h"
#import "ADDCompanyViewController.h"


@interface MYCollectionViewController ()

@end

@implementation MYCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    UIBarButtonItem *undoButton = [[UIBarButtonItem alloc] initWithTitle:@"Undo" style:UIBarButtonItemStylePlain target:self action:@selector(undoButtonHandle)];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonHandle)];
    self.deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteButtonHandle)];
    
    NSArray *temp = [[NSArray alloc]initWithObjects:undoButton,saveButton,self.editButtonItem,self.deleteButton, nil];
    self.navigationItem.rightBarButtonItems = temp;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow)];
    self.navigationItem.leftBarButtonItem = addButton ;
    self.data = [Dao sharedManager];
    [_data createCompanies];
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    
    // Do any additional setup after loading the view.
    self.data = [Dao sharedManager];
    MyDataController *temp1 = [MyDataController sharedManager];
    self.installsStandardGestureForInteractiveMovement = true;
    
    [temp1 saveChanges];
    
     self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_patterns_lines_shadow_43860_1920x1080.jpg"]];
    
}
-(void)deleteButtonHandle{
    
    if (self.deletingInt%2==0) {
        self.deleteButton.title = @"Done";
        self.isDeleting = true;
    }else{
    self.deleteButton.title = @"Delete";
        self.isDeleting = false;
    }
   
    self.deletingInt++;
}
-(void)viewDidAppear:(BOOL)animated{
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)undoButtonHandle{
    MyDataController *coredata = [MyDataController sharedManager];
    [coredata undoButton];
    [self.collectionView reloadData];
}
-(void)addRow{
    ADDCompanyViewController *add = [[ADDCompanyViewController alloc]init];
    add.title = @"Add a Company";
    [add autorelease];
    [self.navigationController
     pushViewController:add
     animated:YES];
}
-(void)saveButtonHandle{
    MyDataController *temp1 = [MyDataController sharedManager];
    [temp1 saveChanges];
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

    return self.data.companyList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
   
    Company * temp = self.data.companyList[indexPath.row];
    cell.cellLabel.text = temp.companyName;
    cell.cellLabel.textColor = [UIColor whiteColor];
    cell.cellLogo.image =[UIImage imageNamed:temp.companyImg];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

// Uncomment this method to specify if the specified item should be highlighted during tracking
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//	return YES;
//}



// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isDeleting) {
        self.coreData = [MyDataController sharedManager];
        [self.data.companyList removeObjectAtIndex:indexPath.row];
        [self.coreData DeleteCompany:indexPath.row];
        [self.collectionView reloadData];
        return;
    }
    
    if (self.editing == YES) {
        NSLog(@"editing Mode Entered");
        ADDCompanyViewController *editCompany = [[ADDCompanyViewController alloc] init];
        editCompany.title = @"Edit a Company";
        editCompany.currentCompany = [self.data.companyList objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:editCompany animated:YES];
        return;
    } else{
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(200, 200);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    ProductCollectionViewController *temp = [[ProductCollectionViewController alloc]initWithCollectionViewLayout:layout];
    temp.currentCompany = self.data.companyList[indexPath.row];
    [self.navigationController pushViewController:temp animated:YES];
    }
}

// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
   
  
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [self beginInteractiveMovementForItemAtIndexPath:sourceIndexPath];
    self.coreData = [MyDataController sharedManager];
    Company *tempString = [self.data.companyList objectAtIndex:sourceIndexPath.row];
    Companies *tempComp = self.coreData.companies[sourceIndexPath.row];
    [self.coreData.companies removeObjectAtIndex:sourceIndexPath.row];
    [self.coreData.companies insertObject:tempComp atIndex:destinationIndexPath.row];
    [self.data.companyList removeObjectAtIndex:sourceIndexPath.row];
    [self.data.companyList insertObject:tempString atIndex:destinationIndexPath.row];
    [self.coreData companyRearrange];
    
    
}
- (BOOL)beginInteractiveMovementForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}



@end
