//
//  CallListVC.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//

import UIKit
import Alamofire

class CallListVC: UIViewController {
    
    @IBOutlet weak var table_View: UITableView!
    
    var callListArray: CallListData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if Connectivity.isConnectedToInternet{
            self.getApiData()
            self.table_View.reloadData()
        }else{
            print("Slow Internet Connection")
        }
    }
    
    
    @IBAction func backButton () {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:  API Request
    
    func getApiData(){
        
        AF.request(API_Manager.callList_Api, method: .get, parameters: nil, headers: API_Manager.header()).responseDecodable(of: CallListData.self) { (response) in
            switch response.result{
            case .success(let data):
                print(response)
                self.callListArray = data
                self.table_View.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
        
        
    }
    
}


    //MARK: Table View

extension CallListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callListArray?.name?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("CallListCell", owner: self, options: nil)?.first as! CallListCell
        
        cell.nameLabel.text = callListArray?.name ?? ""
        cell.numberLabel.text = callListArray?.number ?? ""
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    
}


