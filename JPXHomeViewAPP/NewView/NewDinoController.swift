//
//  NewDinoController.swift
//  JPXHomeViewAPP
//
//  Created by sourav das on 29/06/24.
//

import Foundation
import SwiftUI

class NewDinoController {
    var dinos : [NewDinoModel ] = []
    var alldinos : [NewDinoModel ] = []
    
    init(){
        decodeTheData()
    }
    
    func decodeTheData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf:  url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                alldinos = try decoder.decode([NewDinoModel].self, from: data)
                dinos = alldinos
                
            }catch{
                print("Error decoding the data \(error)")
            }
        }
        
        
    }
    
    func search(_ searchTerm : String) -> [NewDinoModel]{
        if searchTerm.isEmpty {
            return dinos
        }
        else {
            return dinos.filter { dino in
                dino.name.localizedCaseInsensitiveContains(searchTerm)
                
            }
        }
    }
    
    func sort (by names : Bool) {
        if names {
            dinos.sort(by: { dino1,dino2 in
                dino1.name < dino2.name
            })
        }
        else {
            dinos.sort(by: {dino1,dino2 in
                dino1.id < dino2.id
            })
        }
    }
    
    func filter(selected : NewDinoModel.NewDinoType){
        if selected == .all {
           dinos = alldinos
        }
        else {
            dinos = alldinos.filter({ dino in
                dino.type == selected
            })
        }
    }
}
