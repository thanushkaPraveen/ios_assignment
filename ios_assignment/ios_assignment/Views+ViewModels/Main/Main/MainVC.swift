//
//  MainVC.swift
//  ios_assignment
//
//  Created by Thanushka on 4/24/20.
//  Copyright © 2020 thanushka. All rights reserved.
//


import UIKit
import SwiftyJSON
import FBSDKLoginKit

class MainVC: UIViewController,  UITableViewDataSource , UITableViewDelegate, LoadingIndicatorDelegate  {

    var hotel:[Hotel] = []
    var sigleHotel:Hotel?

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotelRequest()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //set user detail
        setUserDetails()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell:MainTVC = tableView.dequeueReusableCell(withIdentifier: "MainTVC", for: indexPath) as? MainTVC {
            cell.configureCell(hotel: hotel[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "MainVCToHotelInfoVC", sender: hotel[indexPath.row])
    }

    // fuction to get hotel detalils
    func hotelRequest() {
                self.startLoading()
                hotelNetworkRequest(completion: { success, statusCode, message in
                    self.stopLoading()
                    if success {
                        // Hadle function after login
                        //ApplicationServiceProvider.shared.manageUserDirection()
                        self.tableView.reloadData()
                        print("user logn sucess")
                    } else {
                        switch statusCode {
                        case 503:
                            AlertProvider(vc: self).showAlert(title: errorTitle , message: message, action: AlertAction(title: dismissAction))
                        default:
                            AlertProvider(vc: self).showAlert(title: errorTitle , message: message, action: AlertAction(title: dismissAction))
                        }
                    }
                })

    }
    
    
    func hotelNetworkRequest(completion: @escaping completionHandler) {
        // Check internet connection

        guard Reachability.isInternetAvailable() else {
            completion(false, 503, "InternetConnectionOffline")
            return
        }
        
               
           ApiControler(urlEndPoint: WebService.hotel .rawValue, method: .get, header: .Main).apiRequest { (result) in
               switch result {
               case .Success(let data):
                   print(data)
//                   let rasponse:BaseResponse = Hotel().getHotel(data: data)
                   let json = JSON(data)
                   self.hotel = Hotel.mapHotelData(json: json)
                   print(self.hotel.first?.image?.small)
//                   self.hotel = rasponse.data!
                   completion(true, 200, "You have logged in successfully.")
                case .Invalid(let message):
                    print(message)
                   completion(false, 404, message)
                case .Failure(let error):
                   print(error)
                break
                   
               }
           }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "MainVCToHotelInfoVC" {
            let destination = segue.destination as! HotelnfoVC
            destination.hotel = sender as? Hotel
        }
    }
    
    @IBAction func taoOnLogout(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logOut()
        ConfigureService.shared.manageUserDirection()
    }
    
    func setUserDetails()  {
         let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id,name , first_name, last_name , email"], tokenString: AccessToken.current?.tokenString, version: nil, httpMethod: HTTPMethod(rawValue: "GET"))
           graphRequest.start(completionHandler: { (test, result, error) in
           guard let Info = result as? [String: Any] else { return }
           
            if let userName = Info["name"] as? String
            {
                self.userNameLbl.text = userName
                
            }
            
            if let email = Info["email"] as? String
            {
                self.emailLbl.text = email
                
            }
        })
    }
    
}

