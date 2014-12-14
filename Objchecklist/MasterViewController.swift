 import UIKit

class MasterViewController: UITableViewController {
    var issues: Array<Issue> = []

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
        
        issues = DataService.latestData();
        
        tableView.registerClass(IssueCell.self, forCellReuseIdentifier: IssueCell.reuseIdentifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let visibleIndexPaths = tableView.indexPathsForVisibleRows() as Array<NSIndexPath>?
        
        if let indexPaths = visibleIndexPaths {
            for indexPath in indexPaths {
                updateCellAtIndexPathForReadState(indexPath)
            }
        }
    }
    
    // MARK: - Private

    func updateCellAtIndexPathForReadState(indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as IssueCell
        
        cell.read = issues[indexPath.row].read
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(IssueCell.reuseIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = issues[indexPath.row].title
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.showDetailViewController(IssueViewController(issue: issues[indexPath.row]), sender: nil)
    }
}
