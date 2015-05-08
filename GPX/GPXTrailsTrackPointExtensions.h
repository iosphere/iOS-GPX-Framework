//
//  GPXTrailsTrackPointExtensions.h
//  GPX
//
//  Created by Jan Weitz on 27.04.2015
//
//

#import "GPXElement.h"

@interface GPXTrailsTrackPointExtensions : GPXElement

/* see: https://trails.io/GPX/1/0/trails_1.0.xsd */
@property (nonatomic) NSNumber *horizontalAccuracy;
@property (nonatomic) NSNumber *verticalAccuracy;
@property (nonatomic) NSNumber *stepCount;

@end
