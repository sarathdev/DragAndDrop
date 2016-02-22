//
//  DragAndDropViewController.m
//  born_Test
//
//  Created by Sarath on 09/07/15.
//  Copyright (c) 2015 SpurTree. All rights reserved.
//

#import "DragAndDropViewController.h"

@interface DragAndDropViewController ()
{
    float oldX, oldY; BOOL dragging;
     CGRect oldLoc;
    
}

@end

@implementation DragAndDropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    shoeImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(46,222, 51 , 51)];
    shoeImageView1.image = [UIImage imageNamed:@"shoe.png"];

    shoeImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(150,222, 51 , 51)];
    shoeImageView2.image = [UIImage imageNamed:@"shoe1.png"];
    
    shoeImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(225,222, 51 , 51)];
    shoeImageView3.image = [UIImage imageNamed:@"shoe2.png"];

    
     addTOCart = [[UIImageView alloc]initWithFrame:CGRectMake(132,400, 80, 80)];
    addTOCart.image = [UIImage imageNamed:@"basket.png"];
    [self.view addSubview:addTOCart];
    
    imageViewArray = [[NSMutableArray alloc]initWithObjects: shoeImageView1,shoeImageView2 ,shoeImageView3,nil];
    


    for (int i=0; i<imageViewArray.count; i++) {
        
        [self.view addSubview:[imageViewArray objectAtIndex:i]];
        [[imageViewArray objectAtIndex:i]setUserInteractionEnabled:YES];

    }
    
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
for(int i=0 ; i< imageViewArray.count; i++)
{

    CGPoint pt = [[touches anyObject]locationInView:self.view];
    
    startLocation = pt;

    
    newtemp = [imageViewArray objectAtIndex:i];
    
    UITouch* bTouch = [touches anyObject];
    
    if ([bTouch.view isEqual:newtemp])
    {
        firstTouchPoint = [bTouch locationInView:[self view]];
        oldX = firstTouchPoint.x - [[bTouch view]center].x;
        oldY = firstTouchPoint.y - [[bTouch view]center].y;
    }

}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(int i=0 ; i< imageViewArray.count; i++)
    {
    newtemp = [imageViewArray objectAtIndex:i];
    
        //oldLoc = newtemp.frame;
        

    if (CGRectContainsPoint(addTOCart.frame , newtemp.frame.origin))
    {
        NSLog(@"touched");
               dragging = NO;

        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Cart" message:@"Added to Cart" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [[imageViewArray objectAtIndex:i] setImage:[UIImage imageNamed:@""]];

    
        [imageViewArray removeObjectAtIndex:i];
        
        [alert show];
        
        
        break;
        
    }
        
    else
    {
        //[newtemp setCenter:CGPointMake(startLocation.x-oldX, startLocation.y-oldY)];
    }
       // self.view.userInteractionEnabled= NO;
       
    }
    

    dragging = NO;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch* mTouch = [touches anyObject];
    CGPoint cp = [mTouch locationInView:[self.view superview]];
    
    //Move view only if it is kindOfClass UIImageView
    if ([mTouch.view isKindOfClass:[UIImageView class]]) {
        
        
        
        CGPoint points = CGPointMake(cp.x-oldX, cp.y-oldY);
        //Check if image view going outside of window bounds
        if (points.x > 30 && points.x < self.view.frame.size.width && points.y < self.view.frame.size.height && points.y > 60) {
            
            //Add animation effect to dragable imageView
            [UIView animateWithDuration:.3
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^ {
                                 
                                 
                                 [[mTouch view]setCenter:CGPointMake(cp.x-oldX, cp.y-oldY)];                         }
                             completion:^(BOOL finished) {}];
        }
        
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
