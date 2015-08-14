//
//  DragAndDropViewController.h
//  born_Test
//
//  Created by Sarath on 09/07/15.
//  Copyright (c) 2015 SpurTree. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DragAndDropViewController : UIViewController
{
    UIImageView * shoeImageView1;
    UIImageView *shoeImageView2;
    UIImageView *shoeImageView3;
    UIImageView * addTOCart ;
    CGPoint firstTouchPoint;
    
    NSMutableArray *imageViewArray;
    
    CGPoint startLocation;
    UIImageView *newtemp;
    

    
}
@end
