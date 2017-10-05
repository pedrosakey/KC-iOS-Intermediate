import UIKit


class ActivityCell: UICollectionViewCell {
    var activity: Activity?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    func refresh(activity: Activity) {
        self.activity = activity
        
        self.label.text = activity.name
        self.activity?.logo.loadImageCache(into: imageView)
    }
}

