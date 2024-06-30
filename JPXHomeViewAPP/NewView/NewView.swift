//
//  NewView.swift
//  JPXHomeViewAPP
//
//  Created by sourav das on 29/06/24.
//

import SwiftUI

struct NewView: View {
    var dinosOb = NewDinoController()
    @State var searchText = ""
    
    @State var sortByNames : Bool = false
    @State var selectedType : NewDinoModel.NewDinoType = .all
    
    
    
    var dinosFiltered : [NewDinoModel] {
        dinosOb.filter(selected: selectedType)
        
        dinosOb.sort(by: sortByNames)
        return dinosOb.search(searchText)
    }
    
    
    
    var body: some View {
        NavigationStack{
            List(dinosFiltered) { dino in
                NavigationLink{
                  SingleDinoView(prad: dino)
                }label: {
                
                    HStack{
                    //Img
                    Image(dino.img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                    
                    VStack(alignment: .leading){
                        Text(dino.name)
                            .bold()
                        Text(dino.type.rawValue.capitalized)
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(dino.type.backgroundColor)
                            .clipShape(Capsule())
                        
                        
                        
                    }
                }
                }
                
            }
            .navigationTitle("Dinos in Jurassic park")
            .searchable(text: $searchText)
            .animation(.bouncy,value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        withAnimation
                        {
                            self.sortByNames.toggle()
                        }
                        
                    }label: {
                        Image(systemName: sortByNames ? "film" : "textformat")
                            .symbolEffect(.bounce, value: sortByNames)
                    }
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Menu {
                        Picker("Menu Title",selection: $selectedType.animation())
                        {
                            ForEach(NewDinoModel.NewDinoType.allCases,id: \.self) { dinoType in
                                
//
                                Label(dinoType.rawValue.capitalized,systemImage: dinoType.icons)
                            }
                        }
//                        .pickerStyle(WheelPickerStyle())
                    } label:{
                        Image(systemName: "slider.horizontal.3")
                    }
                })
            }
        }
    }
}

#Preview {
    NewView()
}
