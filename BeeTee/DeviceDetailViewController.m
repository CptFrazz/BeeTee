//
//  DeviceDetailViewController.m
//  BluetoothScanner
//
//  Created by Michael Dorner on 12.10.13.
//  Copyright (c) 2013 Michael Dorner. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "MDBluetoothDevice.h"

@interface DeviceDetailViewController ()

@property (retain, nonatomic) NSArray* attributeNames;
@property (retain, nonatomic) NSArray* deviceAttributes;

@end


@implementation DeviceDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.attributeNames = [[NSArray alloc] initWithObjects:@"Name", @"Address", @"Major Class", @"Minor Class", @"Type", @"Battery", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBluetoothDevices:(MDBluetoothDevice*)device
{
    NSString* name = [NSString stringWithFormat:@"%@", device.name];
    NSString* address = [NSString stringWithFormat:@"%@", device.address];
    NSString* majorClass = [NSString stringWithFormat:@"%lu", (unsigned long)device.majorClass];
    NSString* minorClass = [NSString stringWithFormat:@"%lu", (unsigned long)device.minorClass];
    NSString* type = [NSString stringWithFormat:@"%ld", (long)device.type];
    NSString* supportsBatteryLevel = device.supportsBatteryLevel ? @"Yes" : @"No";

    self.deviceAttributes = [[NSArray alloc] initWithObjects:name, address, majorClass, minorClass, type, supportsBatteryLevel, nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView
    numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.attributeNames count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentifier = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.attributeNames[indexPath.row];
    cell.detailTextLabel.text = self.deviceAttributes[indexPath.row];

    return cell;
}

@end
