//
//  ViewController.m
//  RudderStackIOSSample
//
//  Created by Harshitha Maddina on 07/12/22.
//

#import "ViewController.h"
#import "RudderCleverTapIntegration.h"
#import <Rudder/Rudder.h>
#import <RudderCleverTapFactory.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *WRITE_KEY = @"2HtPC6cEL4flNNepisbjN3ccXKZ";
    NSString *DATA_PLANE_URL = @"https://clevertaprqui.dataplane.rudderstack.com";
    
    RSConfigBuilder *builder = [[RSConfigBuilder alloc] init];
    [builder withDataPlaneUrl:DATA_PLANE_URL];
    [builder withLoglevel:RSLogLevelDebug];
    [builder withFactory:[RudderCleverTapFactory instance]];
    [builder withTrackLifecycleEvens:true];
    [RSClient getInstance:WRITE_KEY config:[builder build]];
}

- (IBAction)pushUserIdentity:(id)sender
{
    NSDate *date= [NSDate date];
    NSNumber *egFloat = [NSNumber numberWithFloat: 120.4f];
    NSNumber *egDouble = [NSNumber numberWithDouble: 333.6020814126];
    NSNumber *egInt = [NSNumber numberWithInteger: 333];
    NSNumber *egLong = [NSNumber numberWithLong: 1234L];
    NSNumber *egBoolean = [NSNumber numberWithBool:true];
    NSString *name = @"Harshitha";
    
    
    [[RSClient sharedInstance] identify:@"test_user_id1"
                                         traits:@{@"name":name,
                                                  @"pincode": @"578900",
                                                  @"email": @"tstharsh@gmail.com",
                                                  @"state" : @"Maharastra",
                                                  @"city" : @"Mumbai",
                                                  @"country": @"India",
                                                  @"phone": @"+915555555555",
                                                  @"gender": @"F",
                                                  @"birthday": date,
                                                  @"float ObjC":egFloat,
                                                  @"double ObjC":egDouble,
                                                  @"Integer ObjC":egInt,
                                                  @"Long ObjC": egLong,
                                                  @"Boolean ObjC": egBoolean
                                            }
            ];
}

- (IBAction)pushEventWithEventProperties:(id)sender
{
    [[RSClient sharedInstance] track:@"Event Pushed" properties:@{
              @"App" : @"IOS",
              @"Language":@"ObjC"
          }];
}

- (IBAction)orderCompleted:(id)sender
{
    //Add OrderCompleteEventcode
    [[RSClient sharedInstance] track:@"Order Completed" properties:@{
            @"Amount" : @100,
            @"orderId" : @"199",
            @"currency" : @"USD",
            @"products" : @[
                    @{
                        @"productId" : @"12",
                        @"name": @"Book",
                        @"price" : @22,
                        @"quantity" : @3
                    },
                    @{
                        @"product_id" : @"13",
                        @"name": @"Shoes",
                        @"price" : @50,
                        @"quantity" : @1
                    }
            ]
        }];
}


@end
