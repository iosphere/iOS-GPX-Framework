//
//  GPXTrackPointExtensions.m
//  GPX
//
//  Created by Felix Schneider on 29.09.2014.
//
//

#import "GPXTrackPointExtensions.h"
#import "GPXElementSubclass.h"

@interface GPXTrackPointExtensions ()

@property (nonatomic, strong) NSString *heartRateString;
@property (nonatomic, strong) NSString *cadenceString;
@property (nonatomic, strong) NSString *speedString;
@property (nonatomic, strong) NSString *courseString;

@end

@implementation GPXTrackPointExtensions

- (id)initWithXMLElement:(GPXXMLElement *)element parent:(GPXElement *)parent
{
    self = [super initWithXMLElement:element parent:parent];
    if (self) {
        _heartRateString = [self textForSingleChildElementNamed:@"gpxtpx:hr" xmlElement:element];
        _cadenceString = [self textForSingleChildElementNamed:@"gpxtpx:cad" xmlElement:element];
        _speedString = [self textForSingleChildElementNamed:@"gpxtpx:speed" xmlElement:element];
        _courseString = [self textForSingleChildElementNamed:@"gpxtpx:course" xmlElement:element];
    }
    return self;
}

#pragma mark - Public methods
- (void)setHeartRate:(NSNumber *)heartRate
{
    _heartRateString = [NSString stringWithFormat:@"%f", [heartRate doubleValue]];
}

- (void)setCadence:(NSNumber *)cadence
{
    _cadenceString = [NSString stringWithFormat:@"%ud", [cadence unsignedIntValue]];
}

- (void)setSpeed:(NSNumber *)speed
{
    _speedString = [NSString stringWithFormat:@"%f", [speed doubleValue]];
}

- (void)setCourse:(NSNumber *)course
{
    _courseString = [NSString stringWithFormat:@"%f", [course doubleValue]];
}

- (NSNumber *)heartRate {
    if (!_heartRateString.length) {
        return nil;
    }
    return [NSNumber numberWithDouble:[GPXType decimal:_heartRateString]];
}

- (NSNumber *)cadence {
    if (!_cadenceString.length) {
        return nil;
    }
    return [NSNumber numberWithInteger:[GPXType nonNegativeInteger:_cadenceString]];
}

- (NSNumber *)speed {
    if (!_speedString.length) {
        return nil;
    }
    return [NSNumber numberWithDouble:[GPXType decimal:_speedString]];
}

- (NSNumber *)course {
    if (!_courseString.length) {
        return nil;
    }
    return [NSNumber numberWithDouble:[GPXType decimal:_courseString]];
}

#pragma mark - tag

+ (NSString *)tagName
{
    return @"gpxtpx:TrackPointExtension";
}

#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel
{
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_heartRateString tagName:@"gpxtpx:hr" indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_cadenceString tagName:@"gpxtpx:cad" indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_speedString tagName:@"gpxtpx:speed" indentationLevel:indentationLevel];
    [self gpx:gpx addPropertyForValue:_courseString tagName:@"gpxtpx:course" indentationLevel:indentationLevel];
}


@end
