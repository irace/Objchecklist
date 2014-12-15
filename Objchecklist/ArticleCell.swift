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
        
        self.textLabel?.numberOfLines = 0
        self.textLabel?.lineBreakMode = .ByWordWrapping
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
