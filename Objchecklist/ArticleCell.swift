import UIKit

class ArticleCell : UITableViewCell {
    var read: Bool = false {
        didSet {
            contentView.alpha = read ? 0.25 : 1
        }
    }
    
    class var reuseIdentifier: NSString {
        return "ArticleCell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: "Article")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
