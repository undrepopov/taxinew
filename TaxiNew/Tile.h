//
//  Tile.h
//  TaxiNew
//
//  Created by User on 11/12/14.
//  Copyright (c) 2014 ANDREY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *actionButtonName;

-(NSString *)pickRandomEvent;
//-(NSString *)setActionButton:(NSString *)randomEvent;

@end
