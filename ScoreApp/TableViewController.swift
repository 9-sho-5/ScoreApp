//
//  TableViewController.swift
//  ScoreApp
//
//  Created by Kusunose Hosho on 2022/08/05.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var subjectList = ["現代文", "数学", "化学", "物理", "英語", "世界史"]
    
    var selectedCellIndex: Int!
    
    // ユーザーデフォルト
    let data: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        let emptyArray = [Double]()
        for i in 0..<subjectList.count {
            data.set(emptyArray, forKey: subjectList[i])
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = subjectList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCellIndex = indexPath.row
        
        self.performSegue(withIdentifier: "toChart", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toChart"){
            let nextVC = segue.destination as? ChartViewController
            nextVC!.subjectName = subjectList[selectedCellIndex]
        }
   }
    

}
