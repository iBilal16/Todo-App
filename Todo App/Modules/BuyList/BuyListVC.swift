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
    
    //var buyListArray: BuyListModel?
    var responseArray:RandomUser?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getApiData()
        //        if Connectivity.isConnectedToInternet{
        //            self.getApiData()
        //        }else{
        //            print("error")
        //        }
        
    }
    
    
    @IBAction func backButton () {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:  API Request
    
    func getApiData(){
        
        AF.request("https://randomuser.me/api/", method: .get, parameters: nil, headers: nil).responseDecodable(of: RandomUser.self) { (response) in
            switch response.result{
            case .success(let data):
                print(data)
                self.responseArray = data
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
        return responseArray?.results?.count ?? 0
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("BuyListCell", owner: self, options: nil)?.first as! BuyListCell
        
        cell.nameLbl.text = responseArray?.results?[indexPath.row].name?.first ?? ""
        cell.priceLabel.text = responseArray?.results?[indexPath.row].phone ?? ""
        cell.qtyLabel.text = "\(responseArray?.results?[indexPath.row].dob?.age ?? 0)"
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
