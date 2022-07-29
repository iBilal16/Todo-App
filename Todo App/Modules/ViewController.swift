//
//  ViewController.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Buttons outlets
    @IBOutlet weak var callListBtn: UIButton!
    @IBOutlet weak var buyListBtn: UIButton!
    @IBOutlet weak var sellListBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callListBtnPressed(_ sender: UIButton) {
        let vc = CallListVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func buyListBtnPressed(_ sender: UIButton) {
        let vc = BuyListVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func sellListBtnPressed(_ sender: UIButton) {
        let vc = SellListVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

