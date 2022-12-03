//
//  HomeView.swift
//  NaturallyNatural
//
//  Created by JunHyuk Lim on 3/12/2022.
//

import SwiftUI

struct HomeView: View {
    //MARK: - PROPERTIES
    
    let customFont = "RobotoCondensed-Regular"
    
    
    //MARK: - BODY
    var body: some View {
        //!! Change ScrollView
        VStack {
            VStack(spacing: 15){
                HeaderView()
                
                SearchView()
                
                //!!Fix Font!!
                HStack{
                    Text("Our Products")
                        .font(.custom(customFont, size: 30))
                        .fontWeight(.bold)

                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 3){
                            Text("Sort by")
                                .font(.custom(customFont, size: 16))
                            
                            Image(systemName:"chevron.down")
                                .font(.caption.bold())
                        }
                        .foregroundColor(.gray)
                    } //: BUTTON

                    PlantsView()
                    
                }//: HSTACK
                .padding(.top, 25)
            } //: VSTACK
            .padding()
            
            Spacer()
        } //: SCROLLVIEW
    }
    
    //MARK: - VIEWBUILDER
    //HeaderView
    @ViewBuilder
    func HeaderView()->some View{
        HStack{
            Button {
                
            } label: {
                Image("menu")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width:25, height: 25)
            } //: BUTTON
            
            Spacer()
            
            //!!Fix image quality!!
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width:150, height:50)
            
            Spacer()

            Button {

            } label: {
                Image(systemName: "bell")
                    .font(.title3)
                    .overlay(alignment: .topTrailing) {
                        Text("1")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(6)
                            .background{
                                Circle().fill(Color.red)
                                
                            }
                            .offset(x: 7, y: -10)
                    }
            } //: BUTTON
        }//: HSTACK
        .foregroundColor(.black)
        .padding(.horizontal,16)
    }
    
    //SearchView
    @ViewBuilder
    func SearchView()->some View{
        HStack(spacing:15){
            HStack(spacing:15){
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width:24, height: 24)

                TextField("Search", text: .constant(""))
                    .font(.custom(customFont, size: 16))
                    .fontWeight(.light)
            }
            .padding(.horizontal,12)
            .padding(.vertical,12)
            .background(Color.white)
            .cornerRadius(16)
        }
        .padding(.top,16)
    }
    
    //PlantsView
    @ViewBuilder
    func PlantsView()->some View{
        VStack(alignment: .leading, spacing: 15) {
            
        }
    }
    
}

//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
