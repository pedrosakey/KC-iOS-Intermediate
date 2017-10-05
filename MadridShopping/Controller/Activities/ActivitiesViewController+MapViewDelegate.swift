import Foundation
import MapKit
import CoreData

extension ActivitiesViewController: MKMapViewDelegate {
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("Finish loading")
        // MORE anotations
        let activityCds = self.fetchAllActivities()
        //Add pin to Maps
        // let activitiycd : ActivitiyCD = activitiyCds[0]
        for activitycd in activityCds {
            let mapPin = mapActivityIntoMapPin(activity: mapActivityCDIntoActivity(activityCD: activitycd))
            
            if(mapPin != nil){
                self.map.addAnnotation(mapPin!)
            }
        }
        
    }
    
    
    func fetchAllActivities () -> [ActivityCD] {
        var activitiyCDs : [ActivityCD] = []
        
        //Fetch from CD
        // fetch all projects
        let fetchRequest: NSFetchRequest<ActivityCD> = ActivityCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Set a sort key so results get ordered
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            // run the fetch request
            activitiyCDs = try context.fetch(fetchRequest)
            print("Num records: \( activitiyCDs.count )")
            
            
        } catch {
            print("Error \(error.localizedDescription)")
        }
        
        return activitiyCDs
    }
    
    
}

