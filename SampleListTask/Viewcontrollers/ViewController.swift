//
//  ViewController.swift
//  SampleListTask
//
//  Created by Narendra Biswa on 02/04/20.
//  Copyright © 2020 Narendra Biswa. All rights reserved.
//

import UIKit
import Nuke


class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    let tableViews = UITableView() // view
    var refreshControl = UIRefreshControl()
    var getStoresArray = [AnyObject]()
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bindViewmodel()
        
        view.backgroundColor = .white
        
        view.addSubview(tableViews)
        
        
        
        tableViews.translatesAutoresizingMaskIntoConstraints = false
        tableViews.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableViews.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableViews.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableViews.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableViews.dataSource = self
        tableViews.delegate = self
        
        
        tableViews.estimatedRowHeight = 100
        tableViews.rowHeight = UITableView.automaticDimension
        
        // Refreshconrol
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tableViews.addSubview(refreshControl)
        
        tableViews.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomtableviewCell")
        //        // Service implementation
        viewModel.serviceCalling();
    }
    func bindViewmodel()
    {
        viewModel.viewcontroller = self
    }
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        viewModel.serviceCalling()
        
    }
    
    
    
    
}


extension ViewController:UITableViewDataSource
{
    
    //  Mark Tableview Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getStoresArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomtableviewCell", for: indexPath) as! CustomTableViewCell
        let dict: NSDictionary = getStoresArray[indexPath.row] as! NSDictionary
        
        cell.rowTitleLabel.text = (dict["title"] ?? "") as? String
        cell.rowDescriptionLabel.text = (dict["description"] ?? "") as? String
        if let string = (dict["imageHref"]  as? String)
        {
            let url:URL = URL.init(string:string)!
            print("url = \(url)");
            
            //  cell.rowImageView.loadImageWithUrl(url)
            Nuke.loadImage(
                with: url,
                options: ImageLoadingOptions(
                    placeholder: UIImage.init(named: "placeHolder_icon"),
                    transition: .fadeIn(duration: 0.33)
                ),
                into: cell.rowImageView
            )
            
        }
        else
        {
            cell.rowImageView.image =   UIImage.init(named: "placeHolder_icon")
        }
        return cell;
        
    }
}


extension ViewController:UITableViewDelegate
{
    // Mark Tableview Delgate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}
