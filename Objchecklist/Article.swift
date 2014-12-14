import Foundation

struct Article {
    // TODO: Date
    // TODO: Author links
    
    let permalink: NSURL?
    let title: NSString
    let author: NSString?
    var read: Bool;
    
    mutating func toggleReadState() {
        read = !read
    }
    
    static func fromDictionary(dictionary: Dictionary<String, AnyObject>) -> Article {
        return Article(
            permalink: NSURL(string: "http://objc.io".stringByAppendingPathComponent((dictionary["permalink"] as NSString))),
            title: dictionary["title"] as NSString,
            author: dictionary["author"] as NSString?,
            read: false);
    }
}
