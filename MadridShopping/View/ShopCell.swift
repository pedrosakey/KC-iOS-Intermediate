import UIKit


class ShopCell: UICollectionViewCell {
    var shop: Shop?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func refresh(shop: Shop) {
        self.shop = shop
        
        self.label.text = shop.name
        self.shop?.logo.loadImageCache(into: imageView)
    }
}
