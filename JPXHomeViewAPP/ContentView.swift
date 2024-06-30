//
//  ContentView.swift
//  JPXHomeViewAPP
//
//  Created by sourav das on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    let allDions = Predator()
    
    @State var searchText = ""
    
    @State var alphabetical : Bool = false
    
    @State var typeSelected : DinoModel.dinoType = .all
    
    var dinoFiltered : [DinoModel] {
        
        allDions.filter(by: typeSelected)
        allDions.sort(alphabatical: alphabetical)
        
        return allDions.search(self.searchText)
    }
    
    
    var body: some View {
        NavigationStack {
//            List(allDions.dinos) { dino in
            List(dinoFiltered) { dino in
                
                NavigationLink{
                    Image(dino.img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300,height:300)
                        .navigationTitle(dino.name)
                        
                    
                    
                        
                }
                label :{
                    
                    
                    
                    HStack{
                        Image(dino.img)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,height: 80)
                            .shadow(color: .black, radius: 2,x:1)
                        
                        VStack(alignment: .leading){
                            Text(dino.name)
                                .bold()
                            
                            Text(dino.type.rawValue.capitalized)
                                .fontWeight(.semibold)
                                .padding(.horizontal,10)
                                .padding(.vertical,4)
                                .background(dino.type.pillColor)
                                .clipShape(Capsule())
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Apex Predator")
            .searchable(text: $searchText)
            .animation(.bouncy,value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        print("Punka")
                        
                        withAnimation{
                            self.alphabetical.toggle()
                            
                        }
                       
                    }label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce,value: alphabetical)
                    }
                    
                })
                
                ToolbarItem( placement: .topBarTrailing) {
                    
                    Menu{
                        
                        Picker("TypePicker",selection: $typeSelected.animation()){
                         
                            ForEach(DinoModel.dinoType.allCases,id: \.self) { type in
                                    
                                Label(type.rawValue.capitalized,  systemImage: type.icon)
                                
                            }
                            
                        }
                        
                    } label:{
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

