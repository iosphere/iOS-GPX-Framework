//
//  GPXTrailsMetaDataExtensions.m
//  GPX
//
//  Created by Jan Weitz on 27.04.2015
//
//

#import "GPXTrailsMetaDataExtensions.h"
#import "GPXElementSubclass.h"

@interface GPXTrailsMetaDataExtensions ()

@end

@implementation GPXTrailsMetaDataExtensions

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent
{
    self = [super initWithXMLElement:element parent:parent];
    if (self) {
        _activityTypeString = [self textForSingleChildElementNamed:@"trailsio:activity" xmlElement:element];
    }
    return self;
}

#pragma mark - Public methods
- (NSString *)activityTypeString {
    if (!_activityTypeString.length) {
        return nil;
    }
    return _activityTypeString;
}

#pragma mark - tag

+ (NSString *)tagName
{
    return @"trailsio:MetaDataExtension";
}

#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel
{
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_activityTypeString tagName:@"trailsio:activity" indentationLevel:indentationLevel];
}


@end
