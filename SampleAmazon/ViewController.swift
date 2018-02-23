//
//  ViewController.swift
//  SampleAmazon
//
//  Created by JJ Guo on 2/22/18.
//  Copyright © 2018 JJ Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var products: [Product] = []
    var eName = ""
    var numVariable: Int = 0
    var prodDescription = ""
    var url = ""
    
    // Add feature for user to
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.url(forResource: "SmallAmazon", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                let success: Bool = parser.parse()
                print(success)
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        print(products.count)
        for i in products {
            print(i.descr())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let product = products[indexPath.row]
        cell.descr.text = product.url
        cell.url.text = product.description
//        let URL_IMAGE = URL(string: product.description)
//        let session = URLSession(configuration: .default)
//
//        //creating a dataTask
//        let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
//
//            //if there is any error
//            if let e = error {
//                //displaying the message
//                print("Error Occurred: \(e)")
//
//            } else {
//                //in case of now error, checking wheather the response is nil or not
//                if (response as? HTTPURLResponse) != nil {
//
//                    //checking if the response contains an image
//                    if let imageData = data {
//
//                        //getting the image
//                        let image = UIImage(data: imageData)
//
//                        //displaying the image
//                        cell.img.image = image
//
//                    } else {
//                        print("Image file is currupted")
//                    }
//                } else {
//                    print("No response from server")
//                }
//            }
//        }
//        cell.num.text = "\(String(product.ASIN))"
        return cell
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        eName = elementName
//        if elementName == "ASIN" {
//            numVariable = 0
//        }
        if elementName == "ItemLink" {
            prodDescription = ""
            url = ""
        }
//        if elementName == "SwatchImage" {
//            prodDescription = ""
//        } else if elementName == "Height" {
//            let keys = attributeDict.keys
//            for i in keys {
//                prodDescription += attributeDict[i]!
//            }
//        }
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == "ASIN" {
//
//            let amazonProduct = Product()
//            amazonProduct.ASIN = numVariable
//
//            products.append(amazonProduct)
//        }
        if elementName == "ItemLink" {
            let item = Product()
            item.description = prodDescription
            item.url = url
            products.append(item)
        }
//        if elementName == "SwatchImage" {
//            let item = Product()
//            item.description = prodDescription
//            products.append(item)
//        }
        
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
//        if (!data.isEmpty) {
//            if eName == "ASIN" {
//                numVariable = Int(data)!
//            }
//        }
        if (!data.isEmpty) {
            if eName == "Description" {
                prodDescription += data
            } else if eName == "URL" {
                url += data
            }
         }
//        if (!data.isEmpty) {
//            if eName == "URL" {
//                prodDescription += data
//            } else if eName == "Height" {
//                prodDescription += data
//            }
//         }
    }
    
    
}

