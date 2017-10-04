import UIKit
import Kingfisher

extension String {
    func loadImage(into imageView: UIImageView) {
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data) {
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }
        }
    }
    
    func loadImageCache(into imageView: UIImageView) {
        if let url = URL(string: self) {
            imageView.kf.setImage(with: url)
        }
    }
     
}
