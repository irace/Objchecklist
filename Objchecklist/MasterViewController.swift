import UIKit

class MasterViewController: UITableViewController {
    var issues: [Issue] = []

    // MARK: - UIViewController
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "objc.io"
        
        issues = DataService.latestIssues()
        
        tableView.registerClass(IssueCell.self, forCellReuseIdentifier: IssueCell.reuseIdentifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Would be cool to drive this off of bindings instead
        updateVisibleCellReadStates()
    }
    
    // MARK: - Private

    func updateVisibleCellReadStates() {
        if let visibleIndexPaths = tableView.indexPathsForVisibleRows() as [NSIndexPath]? {
            for indexPath in visibleIndexPaths {
                if let cell = tableView.cellForRowAtIndexPath(indexPath) as IssueCell? {
                    updateCellForReadState(cell, indexPath: indexPath)
                }
            }
        }
    }
    
    func updateCellForReadState(cell: IssueCell, indexPath: NSIndexPath) {
        let issue = issues[indexPath.row]
        
        cell.read = issue.read
        cell.detailTextLabel?.text = "\(issue.readCount)/\(issue.articles.count)"
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let issue = issues[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(IssueCell.reuseIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(issue.number): \(issue.title)"
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        updateCellForReadState(cell as IssueCell, indexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.showDetailViewController(IssueViewController(issue: issues[indexPath.row]), sender: nil)
    }
}
