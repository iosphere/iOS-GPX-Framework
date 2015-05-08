//
//  GPXTrailsTrackExtensions.h
//  GPX
//
//  Created by Jan Weitz on 27.04.2015
//
//

#import "GPXElement.h"

@interface GPXTrailsTrackExtensions : GPXElement

/* see: https://trails.io/GPX/1/0/trails_1.0.xsd */
@property (nonatomic) NSString *activityTypeString;

@end
