import Foundation

// TODO: “Grouping”? (For NSHipster compatibility)
struct Issue {
    let title: NSString;
    let permalink: NSURL?;
    var articles: Array<Article>;
    
    var read: Bool {
        return articles.reduce(true) {
            $0 && $1.read
        }
    }
    
    static func fromDictionary(dictionary: Dictionary<String, AnyObject>) -> Issue {
        let articleDictionaries = dictionary["articles"] as Array<Dictionary<String, AnyObject>>
        
        return Issue(
            title: dictionary["title"] as NSString,
            permalink: NSURL(string: dictionary["permalink"] as NSString),
            articles: articleDictionaries.map(Article.fromDictionary)
        );
    }
}
