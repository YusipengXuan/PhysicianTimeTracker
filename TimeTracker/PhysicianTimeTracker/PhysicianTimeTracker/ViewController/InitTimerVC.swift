//
//  InitTimerVC.swift
//  PhysicianTimeTracker
//
//  Created by Ray Xuan on 4/10/18.
//  Copyright © 2018 ShippertLLC. All rights reserved.
//

import UIKit



class InitTimerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TimerTable: UITableView!
    @IBOutlet weak var StartTimer: UIButton!
    @IBOutlet weak var TimerType: UIPickerView!
    @IBOutlet weak var ProcedureType: UIPickerView!
    @IBOutlet weak var TimerTypeLabel: UILabel!
    @IBOutlet weak var ProcedureTypeLabel: UILabel!
    
    let TimerData = ["Critical Care","Procedural","Overtime"]
    let ProcedureData = ["31235","31236","31237","31238","31239","31240","31241"]
    let Procedures = ["0700-0830    11/24/1017    P00134","0700-0830    11/24/1017    P00134","0700-0830    11/24/1017    P00134","0700-0830    11/24/1017    P00134","0700-0830    11/24/1017    P00134","0700-0830    11/24/1017    P00134","0700-0830    11/24/1017    P00134","0700-0830    11/24/1017    P00134",]
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ScreenWidth = view.frame.width
        let ScreenHeight = view.frame.height
        
        StartTimer.frame = CGRect(x: 0.1*ScreenWidth, y: 0.15*ScreenHeight, width: 0.8*ScreenWidth, height: 0.12*ScreenHeight)
        StartTimer.layer.cornerRadius = 8
        StartTimer.backgroundColor = UIColor(red: 0.1529, green: 0.8392, blue: 0, alpha: 1.0)
        
        TimerType.delegate = self
        TimerType.dataSource = self
        TimerType.frame = CGRect(x: 0, y: 0, width: ScreenWidth*0.35, height: 200)
        TimerType.center = CGPoint(x:view.center.x - ScreenWidth*0.25, y:view.center.y)
        TimerTypeLabel.center = CGPoint(x:TimerType.center.x , y:TimerType.center.y - 100)
        
        ProcedureType.delegate = self
        ProcedureType.dataSource = self
        ProcedureType.frame = CGRect(x: 0, y: 0, width: ScreenWidth*0.35, height: 200)
        ProcedureType.center = CGPoint(x:view.center.x + ScreenWidth*0.25, y:view.center.y)
        ProcedureTypeLabel.center = CGPoint(x:ProcedureType.center.x , y:ProcedureType.center.y - 100)
        
        TimerTable.delegate = self
        TimerTable.dataSource = self
        TimerTable.layer.borderColor = UIColor(red: 0.9098, green: 0.9098, blue: 0.9098, alpha: 1.0).cgColor
        TimerTable.layer.borderWidth = 1
        TimerTable.frame = CGRect(x: -1, y: 0.65*ScreenHeight, width: ScreenWidth+2, height: 0.35*ScreenHeight+1)
        TimerTable.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: ScreenWidth, height: 1))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == TimerType {
            return TimerData.count
        } else {
            return ProcedureData.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == TimerType {
            return TimerData[row]
        } else {
            return ProcedureData[row]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Procedures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TimerTable.dequeueReusableCell(withIdentifier: "TimerTableCell", for: indexPath) as! TimerTableCell
        cell.ProcedureInfo.text = Procedures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TimerTable.deselectRow(at: indexPath, animated: true)
    }
}
