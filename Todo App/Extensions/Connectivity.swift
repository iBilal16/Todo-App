//
//  Connectivity.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.

import UIKit
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
