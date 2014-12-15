import Foundation

class Article {
    // TODO: Date
    // TODO: Author links

    let permalink: NSURL?
    let title: NSString
    let author: NSString?
    var read: Bool;
    
    init(permalink: NSURL?, title: NSString, author: NSString?, read: Bool) {
        self.permalink = permalink
        self.title = title
        self.author = author
        self.read = read
    }
    
    func toggleReadState() {
        read = !read
    }
    
    class func fromDictionary(dictionary: Dictionary<String, AnyObject>) -> Article {
        let JSONTitleKey = "title"
        let JSONAuthorKey = "author"
        let JSONPermalinkKey = "permalink"
        
        let URLString = "http://objc.io".stringByAppendingPathComponent((dictionary[JSONPermalinkKey] as NSString))
        
        return Article(
            permalink: NSURL(string: URLString),
            title: dictionary[JSONTitleKey] as NSString,
            author: dictionary[JSONAuthorKey] as NSString?,
            read: false
        );
    }
}
