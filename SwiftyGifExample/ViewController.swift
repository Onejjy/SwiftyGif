//
//  ViewController.swift
//  SwiftyGifManager
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let gifManager = SwiftyGifManager(memoryLimit:120)
    let images = ["img1", "img2", "img3", "img4", "img5", "img6"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if let detailController = segue.destinationViewController as? DetailController {
            let indexPath = self.tableView.indexPathForSelectedRow
            detailController.gifName = images[indexPath!.row]
        }
    }

    // MARK: - TableView Datasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! Cell
        let gifImage = UIImage(gifName: images[indexPath.row])
        cell.gifImageView.setGifImage(gifImage, manager: gifManager, loopTime: -1)
        return cell
    }

    // MARK: - TableView Delegate

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

}
