import Foundation

// TODO: “Grouping”? (For NSHipster compatibility)
class Issue {
    let title: NSString
    let number: NSString
    let permalink: NSURL?
    let articles: [Article]
    
    init(title: NSString, number: NSString, permalink: NSURL?, articles: [Article]) {
        self.title = title
        self.number = number
        self.permalink = permalink
        self.articles = articles
    }
    
    var read: Bool {
        return readCount == articles.count
    }
    
    var readCount: Int {
        let readArticles = articles.filter({(article: Article) -> Bool in
            return article.read
        });
        
        return articles.reduce(0, {(sum: Int, article: Article) -> Int in
            sum + (article.read ? 1 : 0)
        })
    }
    
    class func fromDictionary(dictionary: [String: AnyObject]) -> Issue {
        let JSONTitleKey = "title"
        let JSONNumberKey = "number"
        let JSONPermalinkKey = "permalink"
        let JSONArticlesKey = "articles"
        
        let articleDictionaries = dictionary[JSONArticlesKey] as [[String: AnyObject]]
        
        return Issue(
            title: dictionary[JSONTitleKey] as NSString,
            number: dictionary[JSONNumberKey] as NSString,
            permalink: NSURL(string: dictionary[JSONPermalinkKey] as NSString),
            articles: articleDictionaries.map(Article.fromDictionary)
        );
    }
}
