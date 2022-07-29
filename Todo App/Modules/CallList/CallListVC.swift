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
    
   // var callListArray: CallListData?
    var responseArray:RandomUser?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        getApiData()
        
//        if Connectivity.isConnectedToInternet{
//            self.getApiData()
//        }else{
//            print("Slow Internet Connection")
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
                print(response)
                self.responseArray = data
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
        return responseArray?.results?.count ?? 0

       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("CallListCell", owner: self, options: nil)?.first as! CallListCell
        
        cell.nameLabel.text = responseArray?.results?[indexPath.row].name?.first ?? ""
        cell.numberLabel.text = responseArray?.results?[indexPath.row].phone ?? ""
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    
}



    
    
