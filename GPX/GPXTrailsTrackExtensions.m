//
//  GPXTrailsTrackExtensions.m
//  GPX
//
//  Created by Jan Weitz on 27.04.2015
//
//

#import "GPXTrailsTrackExtensions.h"
#import "GPXElementSubclass.h"

NSString *const kElementActivity = @"trailsio:activity";
NSString *const kTrackExtensionsTagName = @"trailsio:TrackExtension";

@interface GPXTrailsTrackExtensions ()

@end

@implementation GPXTrailsTrackExtensions

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent {
    self = [super initWithXMLElement:element parent:parent];
    
    if (self) {
        _activityTypeString = [self textForSingleChildElementNamed:kElementActivity xmlElement:element];
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

+ (NSString *)tagName {
    return kTrackExtensionsTagName;
}

#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel {
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_activityTypeString tagName:kElementActivity indentationLevel:indentationLevel];
}

@end
