//
//  CallListVC.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//

import UIKit
import Alamofire

class BuyListVC: UIViewController {
    
    @IBOutlet weak var table_View: UITableView!
    
    var buyListArray: BuyListModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Connectivity.isConnectedToInternet{
            self.getApiData()
        }else{
            print("error")
        }    }
    
    
    @IBAction func backButton () {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:  API Request
    
    func getApiData(){
        
        AF.request("https://my-json-server.typicode.com/imkhan334/demo-1/buy", method: .get, parameters: nil, headers: nil).responseDecodable(of: BuyListModel.self) { (response) in
            switch response.result{
            case .success(let data):
                print(data)
                self.buyListArray = data
                self.table_View.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
        
        
    }
}


//MARK: Table View

extension BuyListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyListArray?.name?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("BuyListCell", owner: self, options: nil)?.first as! BuyListCell
        
        cell.nameLbl.text = buyListArray?.name ?? ""
        cell.priceLabel.text = "\(String(describing: buyListArray?.price)) ?? 0"
        cell.qtyLabel.text = "\(String(describing: buyListArray?.quantity)) ?? 0"

        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
