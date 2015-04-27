//
//  GPXTrailsTrackPointExtensions.m
//  GPX
//
//  Created by Jan Weitz on 27.04.2015
//
//

#import "GPXTrailsTrackPointExtensions.h"
#import "GPXElementSubclass.h"

@interface GPXTrailsTrackPointExtensions ()

@property (nonatomic, strong) NSString *horizontalAccuracyString;
@property (nonatomic, strong) NSString *verticalAccuracyString;

@end

@implementation GPXTrailsTrackPointExtensions

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent {
    self = [super initWithXMLElement:element parent:parent];
    
    if (self) {
        _horizontalAccuracyString = [self textForSingleChildElementNamed:@"trailsio:hacc" xmlElement:element];
        _verticalAccuracyString = [self textForSingleChildElementNamed:@"trailsio:vacc" xmlElement:element];
    }
    
    return self;
}

#pragma mark - Public methods
- (void)setHorizontalAccuracy:(NSNumber *)horizontalAccuracy {
    _horizontalAccuracyString = [NSString stringWithFormat:@"%f", [horizontalAccuracy doubleValue]];
}

- (void)setVerticalAccuracy:(NSNumber *)verticalAccuracy {
    _verticalAccuracyString = [NSString stringWithFormat:@"%f", [verticalAccuracy doubleValue]];
}

- (NSNumber *)horizontalAccuracy {
    if (!_horizontalAccuracyString.length) {
        return nil;
    }
    
    return [NSNumber numberWithFloat:[GPXType decimal:_horizontalAccuracyString]];
}

- (NSNumber *)verticalAccuracy {
    if (!_verticalAccuracyString.length) {
        return nil;
    }
    
    return [NSNumber numberWithFloat:[GPXType decimal:_verticalAccuracyString]];
}

#pragma mark - tag

+ (NSString *)tagName {
    return @"trailsio:TrackPointExtension";
}

#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel {
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_horizontalAccuracyString tagName:@"trailsio:hacc" indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_verticalAccuracyString tagName:@"trailsio:vacc" indentationLevel:indentationLevel];
}

@end
