//
//  Predator.swift
//  JPXHomeViewAPP
//
//  Created by sourav das on 28/06/24.
//

import Foundation

class Predator {
    var dinos : [DinoModel] = []
    var allDinos : [DinoModel] = []
    
    init(){
        DinosDecode()
        print(dinos)
    }
    
    func DinosDecode(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allDinos = try decoder.decode([DinoModel].self, from: data)
                dinos = allDinos
            }catch{
                print("Error decodig data bro \(error)")
            }
        }
    }
    
    
    // serach functionality
    func search(_ searchTerm: String ) -> [DinoModel] {
        if searchTerm.isEmpty{
            return dinos
        }
        else {
            return dinos.filter { dino in
                
                dino.name.localizedCaseInsensitiveContains(searchTerm)
                
            }
        }
    }
    
    
    func sort(alphabatical : Bool ) {
        if alphabatical {
            dinos.sort(by: { d1,d2 in
                d1.name < d2.name
                
            })
        }
        else {
            dinos.sort(by: {d1,d2 in
                d1.id < d2.id
            })
        }
    }
    
    
    func filter(by type: DinoModel.dinoType) {
        if type == .all{
            dinos = allDinos
        }
        else {
            dinos = allDinos.filter{ singleDino in
                singleDino.type == type
            }
        }
    }
    
}
