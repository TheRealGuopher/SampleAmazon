//
//  Product.swift
//  SampleAmazon
//
//  Created by JJ Guo on 2/22/18.
//  Copyright © 2018 JJ Guo. All rights reserved.
//

import Foundation

class Product {
    var ASIN: Int = 0
//
//    func description() -> String {
//        return "ASIN: \(ASIN)"
//    }
    
    var description: String = ""
    var url: String = ""
    
    func descr() -> String {
        return "Description: \(description) URL: \(url)"
    }
}
