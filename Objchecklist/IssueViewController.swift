import UIKit

class IssueViewController: UITableViewController {
    // Would love to make this non-optional but I don’t know how to do that when I’m forced to override superclass initializers
    var issue: Issue!

    // MARK: - Initialization
    
    init(issue: Issue) {
        super.init(style: .Plain)
        
        self.issue = issue
    }
    
    required init(coder aDecoder: NSCoder) {
        assertionFailure("Use `init(issue: Issue)` instead")
        
        super.init(coder: aDecoder)
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = issue.title
        
        tableView.registerClass(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseIdentifier)
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issue.articles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let article = articleAtIndexPath(indexPath)
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ArticleCell.reuseIdentifier, forIndexPath: indexPath) as ArticleCell
        cell.read = article.read
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.author
        cell.accessoryType = .DetailButton
        
        return cell
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let article = articleAtIndexPath(indexPath)
        article.toggleReadState()

        let cell = tableView.cellForRowAtIndexPath(indexPath) as ArticleCell
        cell.read = article.read
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        if let URL = articleAtIndexPath(indexPath).permalink {
            UIApplication.sharedApplication().openURL(URL)
        }
    }
    
    // MARK: - Private
    
    private func articleAtIndexPath(indexPath: NSIndexPath) -> Article {
        return issue.articles[indexPath.row]
    }
}
