//
//  CardView.swift
//  NaturallyNatural
//
//  Created by JunHyuk Lim on 6/12/2022.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    var plant : Plant
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            
            HStack{
                VStack {
                    Image(plant.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(maxWidth:250, maxHeight: 300, alignment: .center)
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2)

                    
                    
                    HStack {
                        
                        Text(plant.plantName)
                        
                        Spacer()
                        
                        Text("$\(plant.price)")

                    }
                    .padding(.vertical, 20)
                    .frame(maxWidth: 200)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}

//MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(plant:plantsData[0])
    }
}
