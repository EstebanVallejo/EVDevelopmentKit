import Foundation
import CoreLocation

public extension CLLocationCoordinate2D {
  
  public typealias coordinateComponentRange = (min: Double, max: Double)
  
  public static func random(latitudeRange: coordinateComponentRange, longitudeRange: coordinateComponentRange) -> CLLocationCoordinate2D {
    
    let latitude = Double(arc4random()) / Double(UINT32_MAX) * abs(latitudeRange.max - latitudeRange.min) + min(latitudeRange.max, latitudeRange.min)
    let longitude = Double(arc4random()) / Double(UINT32_MAX) * abs(longitudeRange.max - longitudeRange.min) + min(longitudeRange.max, longitudeRange.min)
    
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
  
  public static func random(center: CLLocationCoordinate2D, radius: Double) -> CLLocationCoordinate2D {
    
    let randomDistance = Double(arc4random_uniform(UInt32(radius)))
    let randomDegrees = Double(arc4random_uniform(360))
    
    return self.init(coord: center, distance: randomDistance, bearingDegrees: randomDegrees)
  }
  
  public init(coord: CLLocationCoordinate2D, distance: Double, bearingDegrees: Double) {
    
    func radiansFrom(degrees: Double) -> Double {
      return degrees * (.pi / 180)
    }
    
    func degreesFrom(radians: Double) -> Double {
      return radians * (180 / .pi)
    }
    
    let distanceRadians = (distance/1000) /* Kms */ / 6371.0
    let bearingRadians = radiansFrom(degrees: bearingDegrees)
    let fromLatRadians = radiansFrom(degrees: coord.latitude)
    let fromLonRadians = radiansFrom(degrees: coord.longitude)
    
    let toLatRadians = asin( sin(fromLatRadians) * cos(distanceRadians)
      + cos(fromLatRadians) * sin(distanceRadians) * cos(bearingRadians) )
    var toLonRadians = fromLonRadians + atan2(sin(bearingRadians)
      * sin(distanceRadians) * cos(fromLatRadians), cos(distanceRadians)
        - sin(fromLatRadians) * sin(toLatRadians))
    
    // adjust toLonRadians to be in the range -180 to +180...
    toLonRadians = fmod((toLonRadians + 3 * .pi), (2 * .pi)) - .pi
    
    let resultLatDegrees = degreesFrom(radians: toLatRadians)
    let resultLonDegrees = degreesFrom(radians: toLonRadians)
    
    self.init(latitude: resultLatDegrees, longitude: resultLonDegrees)
  }
  
}
