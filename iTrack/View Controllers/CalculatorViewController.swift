//
//  CalculatorViewController.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 16/02/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

enum SelectedField: Int {
    case none = 0, sourceTextField, destinationTextField
}


class CalculatorViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate, UITextFieldDelegate, PlaceSearchControllerDelegate {

    @IBOutlet weak var sourceTextfield: UITextField!
    @IBOutlet weak var destinationTextfield: UITextField!
    
    var places: [Place] = [Place]()
    var searchController: UISearchController?
    var resultsController: PlaceSearchController?
    var selectedField: SelectedField = .none
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializeview()
        // Do any additional setup after loading the view.
    }
    func initializeview() {
        self.setupSearchController()
    }
    
    fileprivate func setupSearchController() {
        self.resultsController = PlaceSearchController()
        self.resultsController?.delegate = self
        self.searchController = UISearchController(searchResultsController: resultsController)
        self.resultsController?.places = self.places
        self.searchController?.searchResultsUpdater = self
        self.searchController?.searchBar.tintColor = UIColor.white
        self.searchController?.searchBar.barTintColor = self.navigationController?.navigationBar.barTintColor
        self.searchController?.searchBar.sizeToFit()
        self.searchController?.searchBar.delegate = self
        self.searchController?.searchBar.isHidden = true
        self.view.addSubview((self.searchController?.searchBar)!)
        self.definesPresentationContext = true
        self.searchController?.searchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ReachabilityListener.shared.isReachable() ? self.startEditing(textField) : Util.showAlert(self, message: "Unable to connect to Internet. Make sure you have an active connection.")
    }
    
    fileprivate func startEditing(_ textField: UITextField) {
        textField == self.sourceTextfield ? self.enterSource() : self.enterDestination()
    }
    
    func setSearchBarFrame() {
        self.searchController?.searchBar.frame = CGRect(x: 0, y: 0, width:self.view.frame.size.width, height: 44)
    }
    
    fileprivate func enterSource() {
        self.selectedField = .sourceTextField
        self.searchController?.searchBar.text = ""
        self.searchController?.searchBar.becomeFirstResponder()
        self.searchController?.searchBar.isHidden = false
        self.searchController?.searchBar.placeholder = "Source..."
        self.setSearchBarFrame()
    }
    
    
    fileprivate func enterDestination() {
        self.selectedField = .destinationTextField
        self.searchController?.searchBar.text = ""
        self.searchController?.searchBar.becomeFirstResponder()
        self.searchController?.searchBar.isHidden = false
        self.searchController?.searchBar.placeholder = "Destination..."
        self.setSearchBarFrame()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        MyGooglePlacesHelpers.getPlaces(searchController.searchBar.text ?? "", callback: { (places) -> Void in
            self.places = places
            self.resultsController?.places = places
        })
    }
    
    func placeSearchController(_ placeSearchController: PlaceSearchController, didSelectPlace place: Place) {
        self.searchController!.dismiss(animated: true) { () -> Void in
            func getPlaceDetails(_ place:Place,selectedTextField:SelectedField){
                let isSourceSelected = selectedTextField == SelectedField.sourceTextField
                place.getDetails({ (placeDetail: PlaceDetails) in
                    isSourceSelected ? self.sourceSelected(place, placeDetail: placeDetail) : self.destinationSelected(place, placeDetail: placeDetail)
                    self.dismissSearchBar()
                })
                
            }
            getPlaceDetails(place, selectedTextField: self.selectedField)
        }
    }
    
    func dismissSearchBar() {
        self.searchController?.searchBar.isHidden = true
        self.searchController?.searchBar.resignFirstResponder()
    }
    
    func placeSearchControllerHeightForRow() -> CGFloat {
        return 44
    }
    
    fileprivate func sourceSelected(_ place: Place, placeDetail: PlaceDetails) {
        let placeDesc = place.description
        let shortDesc = place.shortDesc
        self.sourceTextfield.text = shortDesc as String
    }
    
    fileprivate func destinationSelected(_ place: Place, placeDetail: PlaceDetails) {
        let placeDesc = place.description
        let shortDesc = place.shortDesc
        self.destinationTextfield.text = shortDesc as String
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
