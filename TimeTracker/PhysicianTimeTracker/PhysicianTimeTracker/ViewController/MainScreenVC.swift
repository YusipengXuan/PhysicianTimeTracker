//
//  ViewController.swift
//  PhysicianTimeTracker
//
//  Created by Liam Geoghan on 3/13/18.
//  Copyright © 2018 ShippertLLC. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    //@IBOutlet weak var NavBar: UINavigationBar!
    @IBOutlet weak var MainTable: UITableView!
    @IBOutlet weak var TabBar: UITabBar!
    @IBOutlet weak var TabPatients: UITabBarItem!
    @IBOutlet weak var TabCalendar: UITabBarItem!
    @IBOutlet weak var TabLog: UITabBarItem!
    @IBOutlet weak var AddPatient: UIButton!
    
    var searchController = UISearchController()
    var searchResults = [String]()
    let PatientsIDs = ["Patient 001","Patient 002","Patient 003","Patient 004","Patient 005","Patient 006","Patient 007","Patient 008","Patient 009","Patient 010","Patient 011","Patient 012","Patient 013","Patient 014","Patient 015","Patient 016","Patient 017"]
    let Procedures = ["0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134","0700-0830    \n11/24/1017    \nP00134"]
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubview(toFront: TabBar)
        view.bringSubview(toFront: AddPatient)
        
        AddPatient.layer.cornerRadius = 30
        
        MainTable.delegate = self
        MainTable.dataSource = self
        MainTable.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10, height: 1))
        MainTable.backgroundView?.backgroundColor = .white
        MainTable.backgroundColor = .white
        MainTable.allowsMultipleSelectionDuringEditing = true
        MainTable.allowsSelection = true
        MainTable.backgroundView = UIImageView(image: nil)
        
        // Searchbar Controller
        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            self.definesPresentationContext = true
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            MainTable.tableHeaderView = controller.searchBar
            //controller.searchBar.delegate = self
            controller.searchBar.backgroundColor = UIColor.white
            controller.searchBar.backgroundImage = UIImage()
            controller.searchBar.placeholder = "Search"
            controller.searchBar.textField.layer.borderWidth = 1
            controller.searchBar.textField.layer.borderColor = UIColor(red: 0.9098, green: 0.9098, blue: 0.9098, alpha: 1.0).cgColor
            controller.searchBar.textField.layer.cornerRadius = 5
            controller.searchBar.textField.clipsToBounds = true
            //controller.searchBar.textField.tintColor = UIColor.
            // Make SearchBar's tint color white to get white cancel button.
            controller.searchBar.tintColor = UIColor.lightGray
        controller.hidesNavigationBarDuringPresentation = false
            return controller
        })()
        
        TabBar.delegate = self
        TabBar.selectedItem = TabPatients
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        } else if TabBar.selectedItem == TabPatients {
            return PatientsIDs.count
        } else if TabBar.selectedItem == TabLog {
            return Procedures.count
        } else {
            return 0
        }
    }
    
    // Init Table Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if TabBar.selectedItem == TabPatients {
            let cell = MainTable.dequeueReusableCell(withIdentifier: "PatientsTableCell", for: indexPath) as! PatientsTableCell
            if searchController.isActive {
                cell.PatientID.text = self.searchResults[indexPath.row]
            } else {
                cell.PatientID.text = PatientsIDs[indexPath.row]
            }
            return cell
        } else if TabBar.selectedItem == TabLog {
            let cell = MainTable.dequeueReusableCell(withIdentifier: "LogTableCell", for: indexPath) as! LogTableCell
            if searchController.isActive {
                cell.LogInfo.text = self.searchResults[indexPath.row]
            } else {
                cell.LogInfo.text = Procedures[indexPath.row]
            }
            return cell
        } else {
            let cell = MainTable.dequeueReusableCell(withIdentifier: "PatientsTableCell", for: indexPath) as! PatientsTableCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive {
            searchController.isActive = false
        } else {
        }
        MainTable.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if TabBar.selectedItem == TabLog {
            return 100
        } else {
            return 44
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchResults.removeAll(keepingCapacity: false)
        
        let text = searchController.searchBar.text!.lowercased()
        if TabBar.selectedItem == TabLog {
            searchResults = Procedures.filter { ($0.lowercased().range(of: text) != nil)}
        } else {
            searchResults = PatientsIDs.filter { ($0.lowercased().range(of: text) != nil)}
        }
        
        self.MainTable.reloadData()
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 { // Show Patients page
            navigationItem.title = "Patients"
            AddPatient.isHidden = false
            searchController.isActive = false
            MainTable.reloadData()
            MainTable.backgroundView = UIImageView(image: nil)
        }
        else if item.tag == 2 { // Setting
            navigationItem.title = "Calendar"
            AddPatient.isHidden = true
            searchController.isActive = false
            MainTable.reloadData()
            let backgroundImage = UIImage(named: "CalendarSample.png")
            let imageView = UIImageView(image: backgroundImage)
            imageView.contentMode = .scaleAspectFit
            MainTable.backgroundView = imageView
        } else {
            navigationItem.title = "Log"
            AddPatient.isHidden = false
            searchController.isActive = false
            MainTable.reloadData()
            MainTable.backgroundView = UIImageView(image: nil)
        }
    }
}

