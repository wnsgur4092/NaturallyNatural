//
//  HomeView.swift
//  NaturallyNatural
//
//  Created by JunHyuk Lim on 3/12/2022.
//

import SwiftUI


struct HomeView: View {
    //MARK: - PROPERTIES
    
    @State var currentIndex : Int = 0
    @State var plants : [Plant] = []
    
    
    let customFont = "RobotoCondensed-Regular"
    
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            HeaderView()
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    SearchView()
                    
                    MainView()

                    CardView()
                    
//                    IndicatorView()
                    
                }
            }
        }
        
    }
    
    
    //MARK: - VIEWBUILDER
    
    //#1. HeaderView
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
        .frame(maxWidth:.infinity, maxHeight:.infinity, alignment: .top)
        .frame(height:50)
    }
    
    //#2. SearchView
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
        .padding()
        .padding(.top, 12)
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(height:50)
    }
    
    //#3. OurProduct View
    @ViewBuilder
    func MainView()->some View{
        VStack {
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
            }//: HSTACK
            .padding(.top, 12)
        } //: VSTACK
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(height: 50)
        .padding(12)
    }
    
    //#4. Indciator View
//    @ViewBuilder
//    func IndicatorView()->some View{
//        HStack(alignment: .center, spacing: 10){
//            ForEach(plants.indices, id:\.self){ index in
//
//                Circle()
//                    .fill(Color(.black).opacity(currentIndex == index ? 0.5: 0.1))
//                    .frame(width:10, height: 10)
//                    .scaleEffect(currentIndex == index ? 1.4 : 1)
//                    .animation(.spring(), value: currentIndex == index)
//            }
//        }
//    }
    
    //#5. Plants Card View
    @ViewBuilder
    func CardView()->some View{
        VStack {
            SnapCarousel(index: $currentIndex, items: plants) { plant in
                GeometryReader{ proxy in
                    
                    let size = proxy.size
                    
                    Image(plant.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)
                }
            }
            .padding(.vertical, 12)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            for index in 1...6 {
                plants.append(Plant(imageName:"plant\(index)"))
            }
            
        }
    }
    
}

//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


