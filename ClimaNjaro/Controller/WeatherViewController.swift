//
//  WeatherViewController.swift
//  ClimaNjaro
//
//  Created by Hüsamettin  Eyibil on 29.12.2019.
//  Copyright © 2019 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var cellArray = [CellModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
        
        var newCell = CellModel()
        newCell.cityName = "İstanbul"
        cellArray.append(newCell)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        var textField = UITextField()
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Şehir adı girin"
            textField = alertTextField
        }
        let action = UIAlertAction(title: "Ekle", style: .default) { (action) in
            if textField.text != "" {
                var cell = CellModel()
                cell.cityName = textField.text!
                let _ = getWeatherData(cell)
                self.cellArray.append(cell)
                self.tableView.reloadData()
            }
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WeatherViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        let currentCell = cellArray[indexPath.row]
        cell.cityLabel.text = currentCell.cityName
        cell.degreeLabel.text = "\(currentCell.degree)°"
        cell.timeLabel.text = currentCell.forecastTime
        //cell.stateImageView.image = UIImage(named: currentCell.stateImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}
