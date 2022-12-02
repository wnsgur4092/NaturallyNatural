//
//  BaseViewModel.swift
//  NaturallyNatural
//
//  Created by JunHyuk Lim on 2/12/2022.
//

import SwiftUI

class BaseViewModel : ObservableObject {
    
    //MARK: - TAB BAR
    @Published var currentTab : Tab = .Home
    
}

// Enum for Tab Items
enum Tab: String{
    case Home = "home"
    case Heart = "heart"
    case ClipBoard = "clipboard"
    case Person = "person"
}
