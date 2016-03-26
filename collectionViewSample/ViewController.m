//
//  ViewController.m
//  collectionViewSample
//
//  Created by KenlaSystems on 24/03/16.
//  Copyright (c) 2016 KenlaSystems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *collectionImages;
    NSArray *foodItemNames;
    NSIndexPath *selectedCellIndex;
    BOOL isDetailView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    collectionImages = [NSArray arrayWithObjects:@"image1.png",@"image2.png",@"image3.png",@"image4.png",@"image5.png",@"image6.png",@"image7.png",@"image8.png", @"image9.png",@"image10.png",@"image11.png",nil];
    foodItemNames = [NSArray arrayWithObjects:@"Finger Chips",@"Burgur",@"Bread Omlet",@"Pizza",@"Sanwich",@"Finger Chips",@"Omlet",@"Bread stufing",@"Noodles",@"Sweat Paniyaram",@"Corns", nil];
    isDetailView = TRUE;
}

#pragma mark -
#pragma mark Data Source Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return collectionImages.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    
    collectionImageView.image = [UIImage imageNamed:[collectionImages objectAtIndex:indexPath.row]];
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:cell.bounds];
    backgroundView.backgroundColor = [UIColor whiteColor];
    UIButton *del=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    del.frame= CGRectMake(backgroundView.frame.origin.x+20,backgroundView.frame.origin.y+20, 100, 40);
    [del setTitle:[NSString stringWithFormat:@"%@ %ld",@"Food Item",(long)indexPath.row+1] forState:UIControlStateNormal];
    [backgroundView addSubview:del];
    UIButton *cancel=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancel.frame= CGRectMake(backgroundView.frame.origin.x+20, backgroundView.frame.origin.y+80, 100, 45);
    [cancel setTitle:[foodItemNames objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [backgroundView addSubview:cancel];
    cell.selectedBackgroundView = backgroundView;
    //[cell bringSubviewToFront:cell.selectedBackgroundView];
    return cell;
    
}

#pragma mark -
#pragma mark Delegate methods

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell1 = [collectionView cellForItemAtIndexPath:indexPath];
    
    if(selectedCellIndex!=NULL)
    {
        UICollectionViewCell *cell2 = [collectionView cellForItemAtIndexPath:selectedCellIndex];
        [UIView transitionFromView:cell2.selectedBackgroundView toView:cell2.contentView duration:0.5 options:UIViewAnimationOptionCurveLinear |UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    }

    if([selectedCellIndex isEqual:indexPath] && isDetailView)
    {
        [cell1 setSelected:NO];
        [UIView transitionFromView:cell1.selectedBackgroundView toView:cell1.contentView duration:0.5 options:UIViewAnimationOptionCurveLinear |UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
        isDetailView = FALSE;
    }
    else{
        [UIView transitionFromView:cell1.contentView toView:cell1.selectedBackgroundView duration:0.5 options:UIViewAnimationOptionCurveLinear |UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
        isDetailView = TRUE;
    }
    
    selectedCellIndex=indexPath;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
