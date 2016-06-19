//
//  LocationController.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 15/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
import ObjectMapper

class LocationController: UIViewController, UIGestureRecognizerDelegate {

    //MARK: Properties
    @IBOutlet var cityDropdownView: UIView!
    @IBOutlet var areaDropdownView: UIView!
    @IBOutlet var chosenCity: UILabel!
    @IBOutlet var chosenArea: UILabel!
    let areaDropdown = DropDown()
    var chosenPackagingCentreId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.POST,
            R.string.routes.api_root_path() +
            R.string.routes.get_cities(),
            parameters: JsonProvider.getAnonymousJson())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let cities:[City] = Mapper<City>().mapArray(value["data"])!
                        self.chosenCity.text = cities.first!.name
                        
                        self.areaDropdown.anchorView = self.areaDropdownView
                        self.areaDropdown.width = self.areaDropdownView.frame.size.width
                        self.areaDropdown.dataSource = []
                        for area in cities.first!.areas {
                            self.areaDropdown.dataSource.append(area.name)
                        }
                        self.areaDropdown.selectionAction =  { [unowned self] (index: Int, item: String) in
                            Cache.selectedArea = cities.first!.areas[index]
                            self.chosenArea.text = Cache.selectedArea?.name
                            self.chosenPackagingCentreId = Cache.selectedArea?.packagingCentreId
                            print("PackagingCentreId: "+String(self.chosenPackagingCentreId))
                            
                            self.performSegueWithIdentifier(R.segue.locationController.mainTabBarControllerSegue, sender: self)
                        }
                        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LocationController.onClickAreaDropdown))
                        tapGesture.delegate = self
                        self.areaDropdownView.addGestureRecognizer(tapGesture)
                    }
                    
                case .Failure(let error):
                    print(error)
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onClickAreaDropdown() {
        areaDropdown.show()
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as? MainTabBarController
        let comboNavigationController = destinationViewController!.viewControllers!.first as? UINavigationController
        let comboController = comboNavigationController!.viewControllers.first as? ComboController
        comboController!.packagingCentreId = self.chosenPackagingCentreId
    }

}
