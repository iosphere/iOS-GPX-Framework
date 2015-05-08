//
//  GPXTrailsTrackPointExtensions.m
//  GPX
//
//  Created by Jan Weitz on 27.04.2015
//
//

#import "GPXTrailsTrackPointExtensions.h"
#import "GPXElementSubclass.h"

NSString *const kElementHorizontalAcc = @"trailsio:hacc";
NSString *const kElementVerticalAcc = @"trailsio:vacc";
NSString *const kElementSteps = @"trailsio:steps";
NSString *const kTrackPointExtensionsTagName = @"trailsio:TrackPointExtension";

@interface GPXTrailsTrackPointExtensions ()

@property (nonatomic) NSString *horizontalAccuracyString;
@property (nonatomic) NSString *verticalAccuracyString;
@property (nonatomic) NSString *stepCountString;

@end

@implementation GPXTrailsTrackPointExtensions

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent {
    self = [super initWithXMLElement:element parent:parent];
    
    if (self) {
        _horizontalAccuracyString = [self textForSingleChildElementNamed:kElementHorizontalAcc xmlElement:element];
        _verticalAccuracyString = [self textForSingleChildElementNamed:kElementVerticalAcc xmlElement:element];
        _stepCountString = [self textForSingleChildElementNamed:kElementSteps xmlElement:element];
    }
    
    return self;
}

#pragma mark - Public methods
- (void)setHorizontalAccuracy:(NSNumber *)horizontalAccuracy {
    _horizontalAccuracyString = horizontalAccuracy ? [NSString stringWithFormat:@"%.2f", [horizontalAccuracy doubleValue]] : nil;
}

- (void)setVerticalAccuracy:(NSNumber *)verticalAccuracy {
    _verticalAccuracyString = verticalAccuracy ? [NSString stringWithFormat:@"%.2f", [verticalAccuracy doubleValue]] : nil;
}

- (void)setStepCount:(NSNumber *)stepCount {
    _stepCountString = stepCount ? [NSString stringWithFormat:@"%.0f", [stepCount doubleValue]] : nil;
}

- (NSNumber *)horizontalAccuracy {
    if (!_horizontalAccuracyString.length) {
        return nil;
    }
    
    return [NSNumber numberWithDouble:[GPXType decimal:_horizontalAccuracyString]];
}

- (NSNumber *)verticalAccuracy {
    if (!_verticalAccuracyString.length) {
        return nil;
    }

    return [NSNumber numberWithDouble:[GPXType decimal:_verticalAccuracyString]];
}

- (NSNumber *)stepCount {
    if (!_stepCountString.length) {
        return nil;
    }
    
    return [NSNumber numberWithDouble:[GPXType decimal:_stepCountString]];
}

#pragma mark - tag

+ (NSString *)tagName {
    return kTrackPointExtensionsTagName;
}

#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel {
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_horizontalAccuracyString tagName:kElementHorizontalAcc indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_verticalAccuracyString tagName:kElementVerticalAcc indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_stepCountString tagName:kElementSteps indentationLevel:indentationLevel];
}

@end
