import UIKit

class IssueCell : UITableViewCell {
    var read: Bool = false {
        didSet {
            contentView.alpha = read ? 0.25 : 1
        }
    }
    
    class var reuseIdentifier: NSString {
        return "IssueCell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Value1, reuseIdentifier: "Issue")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
