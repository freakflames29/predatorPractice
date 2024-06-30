//
//  SingleDinoView.swift
//  JPXHomeViewAPP
//
//  Created by sourav das on 30/06/24.
//

import SwiftUI

struct SingleDinoView: View {
    let prad : NewDinoModel
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        GeometryReader{ geo in
            
            ScrollView{
                //img
                // dino img
                ZStack(alignment: .bottomTrailing){
                    Image(prad.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            if colorScheme == .dark
                            {
                                LinearGradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.8),
                                    
                                    Gradient.Stop(color: .black, location: 1)
                                
                                ], startPoint: .top, endPoint: .bottom)
                            }
                            else {
                                LinearGradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.8),
                                    
                                    Gradient.Stop(color: .white, location: 1)
                                
                                ], startPoint: .top, endPoint: .bottom)
                            }
                        }
                    
                    
                    Image(prad.img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/2, height: geo.size.height/3)
                        .scaleEffect(x:-1)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x:10,y:4)
                        .offset(y:20)
                }
                
                //text
                
                VStack (alignment: .center){
                    Text(prad.name)
//                        .font(.system(size: 50))
                        .font(.custom("NewsflashBB", size: 60))
                        .bold()
                        .foregroundStyle(.orange)
                        .padding(.vertical,10)
                }
                VStack(alignment: .leading){
                    Text("Movie appearence")
                        .font(.title2)
                        .bold()
                    
                    ForEach(prad.movies, id:\.self) { movie in
                        Text("👉 " + movie)
                        
                    }
                    
                    Text("Movie Scenes")
                        .padding(.vertical,10)
                        .font(.title2)
                        .bold()
                    
                    ForEach(prad.movieScenes) { moviescene in
                        Text(moviescene.movie)
                            .font(.title3)
                            .foregroundStyle(Color.orange)
                            .padding(.vertical,3)
                        Text(moviescene.sceneDescription)
                        
                    }
                    
                    
                    
                        
                    
                }.padding()
                .frame(width: geo.size.width,alignment: .leading)
                
                Link("Read More →",destination:  URL(string: prad.link)!)
                    .bold()
                    .padding(.all,10)
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .frame(width: .infinity,alignment: .center)
                    .padding()
                
                // movie scens
               
                
                // movie descriptions
                
                // link
            }
            
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    SingleDinoView(prad: NewDinoController().alldinos[10])
}
