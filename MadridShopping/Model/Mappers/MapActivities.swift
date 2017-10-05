import CoreData
import CoreLocation

func mapActivityCDIntoActivity(activityCD: ActivityCD) -> Activity {
    
    //mapping activitys into activity cd
    let activity = Activity(name: activityCD.name!)
    activity.address = activityCD.address ?? ""
    activity.image = activityCD.image ?? ""
    activity.logo = activityCD.logo ?? ""
    
    activity.latitude = activityCD.latitude
    activity.longitude = activityCD.longitude
    activity.description = activityCD.description_en ?? ""
    activity.openingHours = activityCD.openingHours ?? ""
    
    return activity
    
}

func mapActivityIntoActivityCD(context: NSManagedObjectContext, activity: Activity) -> ActivityCD {
    //mapping activitys into activity cd
    let activityCD = ActivityCD(context: context)
    activityCD.name = activity.name
    activityCD.address = activity.address
    activityCD.image = activity.image
    activityCD.latitude = activity.latitude ?? 0
    activityCD.logo = activity.logo
    activityCD.longitude = activity.longitude ?? 0
    activityCD.openingHours = activity.openingHours
    activityCD.description_en = activity.description
    
    return activityCD
}

func mapActivityIntoMapPin(activity: Activity) -> MapPin? {
    guard let latitude = activity.latitude else { return nil }
    guard let longitude = activity.longitude else { return nil }
    
    let activityLocation : CLLocation = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    let activityMapPin = MapPin(coordinate: activityLocation.coordinate, title: activity.name, subtitle: activity.openingHours)
    
    return activityMapPin
}

