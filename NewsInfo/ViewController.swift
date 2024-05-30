//
//  ViewController.swift
//  NewsInfo
//
//  Created by Praveen on 16/05/24.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableViewInfo: UITableView!
    var ApiData = [ApiModel]()
    var photosArr: [Photos] = []
    
   
       

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromAapi()
        
    }
    
    
    
    
    func fetchDataFromAapi() {
        
        let url = URL(string: "https://api.slingacademy.com/v1/sample-data/photos")
        
        let task = URLSession.shared.dataTask(with: url!) { data, _ , error in
            let decoder = JSONDecoder()
            if let data = data {
                let userData = try? decoder.decode(ApiModel.self, from: data)
                print (userData as Any)
                self.ApiData.append(userData!)
                //MARK: - reloadtbldata
         
                guard let pht = userData?.photos?.count, pht > 0 else {
                    return
                }
                for i in 0..<(userData?.photos?.count ?? 0) {
                    self.photosArr.append((userData?.photos?[i])!)
                }
                print(self.photosArr)
                DispatchQueue.main.async {
                    self.tableViewInfo.reloadData()
                }
            } else {
                print (error as Any)
            }
        }
        
        task.resume()
        
    }
    
    
}
extension ViewController :  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.photosArr.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableViewInfo.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ApiTableViewCell
        
        let item = self.photosArr[indexPath.row]
        cell.lblTittle.text = item.title
        
        if let imageURL = URL(string: item.url ?? "") {
            cell.userImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholderImage"))
        }
        
        
 //       let likeButtonTitle = item.isLike
//
//
//     //   cell.likeButtonAction = { [weak self] in
//             //self?.item[indexPath.row].isLike.toggle()
//            self?.tableViewInfo.reloadRows(at: [indexPath], with: .none)
//
//        }
        
        return cell
    }
    
}


