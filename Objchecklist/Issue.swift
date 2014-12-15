import Foundation

// TODO: “Grouping”? (For NSHipster compatibility)
class Issue {
    let title: NSString
    let number: NSString
    let permalink: NSURL?
    let articles: Array<Article>
    
    init(title: NSString, number: NSString, permalink: NSURL?, articles: Array<Article>) {
        self.title = title
        self.number = number
        self.permalink = permalink
        self.articles = articles
    }
    
    var read: Bool {
        return readCount == articles.count
    }
    
    var readCount: Int {
        return articles.reduce(0) {
            $0 + ($1.read ? 1 : 0)
        }
    }
    
    class func fromDictionary(dictionary: Dictionary<String, AnyObject>) -> Issue {
        let JSONTitleKey = "title"
        let JSONNumberKey = "number"
        let JSONPermalinkKey = "permalink"
        let JSONArticlesKey = "articles"
        
        let articleDictionaries = dictionary[JSONArticlesKey] as Array<Dictionary<String, AnyObject>>
        
        return Issue(
            title: dictionary[JSONTitleKey] as NSString,
            number: dictionary[JSONNumberKey] as NSString,
            permalink: NSURL(string: dictionary[JSONPermalinkKey] as NSString),
            articles: articleDictionaries.map(Article.fromDictionary)
        );
    }
}
