//
//  CallListVC.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//

import UIKit

class SellListVC: UIViewController {
    
    @IBOutlet weak var table_View: UITableView!
    
    var sellerData = [ItemToSell]()
    var sname : UITextField!
    var sprice : UITextField!
    var sqty : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_View.reloadData()
    }
    
    
    @IBAction func backButton () {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewData(_sender : Any) {
        
        let dialogueMsg = UIAlertController(title: "Add Data", message: "Enter name, price & quantity", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newName = self.sname.text!
            let newPrice = self.sprice.text!
            let newQty = self.sqty.text!
            
            let dh = DatabaseHandler()
            dh.saveData(name: newName, price: Int(newPrice) ?? 0, quantity: Int(newQty) ?? 0)
            self.sellerData = dh.fetchData()
            self.table_View.reloadData()
            
        }
        
        let cancelAction =  UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel the operation")
            
        }
        
        dialogueMsg.addAction(okAction)
        dialogueMsg.addAction(cancelAction)
        dialogueMsg.addTextField { (textfield) in
            self.sname = textfield
            self.sname.placeholder = "Type name"
            
            
        }
        
        dialogueMsg.addTextField { (textfield) in
            self.sprice = textfield
            self.sprice.placeholder = "Type price"
            
        }
        
        dialogueMsg.addTextField { (textfield) in
            self.sqty = textfield
            self.sqty.placeholder = "Type quantity"
            
        }
        
        self.present(dialogueMsg, animated: true, completion: nil)
    }
    
}


//MARK: Table View

extension SellListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellerData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("BuyListCell", owner: self, options: nil)?.first as! BuyListCell
        
        cell.nameLbl.text = sellerData[indexPath.row].name ?? ""
        cell.priceLabel.text = "\(String(describing: sellerData[indexPath.row].price))"
        cell.qtyLabel.text = "\(String(describing: sellerData[indexPath.row].quantity))"
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
