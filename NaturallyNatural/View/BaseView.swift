//
//  BaseView.swift
//  NaturallyNatural
//
//  Created by JunHyuk Lim on 2/12/2022.
//

import SwiftUI

struct BaseView: View {
    //MARK: - PROEPERTIES
    
    @StateObject var baseVM = BaseViewModel()
    
    //Hiding Tab bar
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    //MARK: - BODY
    var body: some View {
        TabView(selection: $baseVM.currentTab) {
            
            HomeView()
                .environmentObject(baseVM)
                .frame(maxWidth:.infinity,maxHeight: .infinity)
                .background(Color.black.opacity(0.1))
                .tag(Tab.Home)
            
            Text("heart")
                .tag(Tab.Heart)
            
            Text("Clipboard")
                .tag(Tab.ClipBoard)
            
            Text("Person")
                .tag(Tab.Person)
        } //: TAB VIEW
        .overlay(
            //Tab Bar
            HStack(spacing: 0) {
                TabButton(Tab: .Home)
                TabButton(Tab: .Heart)
                    .offset(x:-10)
                
                //Centre Curved Button
                Button {
                    
                } label: {
                    Image("cart")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .offset(x:-1)
                        .padding(18)
                        .background(Color("MainColor"))
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: -5)
                }
                .offset(y:-30)
                
                TabButton(Tab: .ClipBoard)
                    .offset(x:10)
                TabButton(Tab: .Person)
            } //: HSTACK
                .background(Color.white.clipShape(CustomCurveShape())
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                    .ignoresSafeArea(.container, edges: .bottom)
                )
            
            ,alignment: .bottom
        ) //: OVERLAY
        
    }
    
    //MARK: - VIEW BUILDER
    @ViewBuilder
    func TabButton(Tab: Tab)-> some View{
        Button {
            withAnimation {
                baseVM.currentTab = Tab
            }
        } label: {
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(baseVM.currentTab == Tab ? Color("MainColor") : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
        
    }
}

//MARK: - PREVIEW
struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
