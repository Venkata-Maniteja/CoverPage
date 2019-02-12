//
//  ViewController.swift
//  CoverPage
//
//  Created by Rupika Sompalli on 12/02/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView : UITableView!
    
    @IBOutlet var headerView : UIView?
    var avatarView : UIView?
    var headerHeight :CGFloat = 300
    var avatarFrame = CGRect(x: 20, y: -30, width: 60, height: 60)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        tblView.addSubview(headerView!)
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblView.contentInset = UIEdgeInsets(top:headerHeight, left: 0, bottom: 0, right: 0)
        tblView.contentOffset = CGPoint(x: 0, y: -headerHeight)
        updateHeaderView()
        
        avatarView = UIView(frame: avatarFrame)
        avatarView!.backgroundColor = UIColor.red
        tblView.addSubview(avatarView!)
        
        tblView.bringSubviewToFront(avatarView!)
        
    }
    
    func updateHeaderView(){
        
        var headerRect = CGRect(x: 0, y: -headerHeight, width: view.bounds.size.width, height: headerHeight)
        if tblView.contentOffset.y < -headerHeight{
            headerRect.origin .y = tblView.contentOffset.y
            headerRect.size.height = -tblView.contentOffset.y
        }else{
            headerRect.origin .y = 0
            headerRect.size.height = tblView.contentOffset.y
        }
        headerView?.frame = headerRect
        avatarView?.frame = avatarFrame
       
    }
    
    

}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//
//        return headerView
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return headerHeight
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row < 2{
             cell.textLabel?.text = ""
        }else{
             cell.textLabel?.text = "hi"
        }
       
        return cell
        
    }
    
    
    
}


extension ViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        updateHeaderView()
      
        
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrolled to top")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("begin draggin")
    }
}
