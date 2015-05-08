//
//  GPXExtensions.m
//  GPX Framework
//
//  Created by NextBusinessSystem on 12/04/06.
//  Copyright (c) 2012 NextBusinessSystem Co., Ltd. All rights reserved.
//

#import "GPXExtensions.h"
#import "GPXElementSubclass.h"
#import "GPXTrailsTrackExtensions.h"
#import "GPXTrailsTrackPointExtensions.h"

@implementation GPXExtensions

#pragma mark - Instance

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent
{
    self = [super initWithXMLElement:element parent:parent];
    if (self) {
        _garminExtensions = (GPXTrackPointExtensions *)[self childElementOfClass:[GPXTrackPointExtensions class] xmlElement:element];
        _trailsTrackExtensions = (GPXTrailsTrackExtensions *)[self childElementOfClass:[GPXTrailsTrackExtensions class] xmlElement:element];
        _trailsTrackPointExtensions = (GPXTrailsTrackPointExtensions *)[self childElementOfClass:[GPXTrailsTrackPointExtensions class] xmlElement:element];
    }
    return self;
}

#pragma mark - Public methods


#pragma mark - tag

+ (NSString *)tagName
{
    return @"extensions";
}


#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel
{
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    
}

@end
