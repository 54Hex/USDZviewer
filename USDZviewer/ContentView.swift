//
//  ContentView.swift
//  USDZviewer
//
//  Created by Conqueriings on 31/10/21.
// CR: Kavsoft

import SwiftUI
import SceneKit


struct ContentView: View {
    
    var body: some View {
        
        SCView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SCView()
            .preferredColorScheme(.dark)
    }
}


struct SCView : View {
    
    
    @State var models = [
        Model(id: 0, name: "Cookie", modelName: "cookie.usdz"),
        Model(id: 0, name: "Micro:Bit (Front)", modelName: "mbfront.usdz"),
        Model(id: 0, name: "RaspberryPi 4", modelName: "RPIv5.usdz"),
        Model(id: 0, name: "Shark", modelName: "shark.usdz")
    ]
    
    
    @State var index = 0
    
    
    var body: some View{
        
       
            VStack {
                SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
               
     
                
                ZStack{
                    HStack{
                        
                        Button(action: {
                            withAnimation{
                                if index > 0{
                                    index -= 1
                                }
                            }
                            
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 35, weight: .bold))
                                .foregroundColor(.white)
                                .opacity(index == 0 ? 0.3 : 1)
                        })
                            .disabled(index == 0 ? true : false)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                            withAnimation{
                                if index < models.count{
                                    index += 1
                                }
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 35, weight: .bold))
                                .foregroundColor(.white)
                            // disabling button when no other data ....
                                .opacity(index == models.count - 1 ? 0.3 : 1)
                        })
                            .disabled(index == models.count - 1 ? true : false)
                    }
                    
                    Text(models[index].name)
                        .font(.system(size: 25, weight: .semibold))
                }
//                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical,30)

            }
        
    }
}


// Data Model...

struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
}

