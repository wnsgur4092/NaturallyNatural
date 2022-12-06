//
//  Plant.swift
//  NaturallyNatural
//
//  Created by JunHyuk Lim on 3/12/2022.
//

import SwiftUI

struct Plant : Equatable, Identifiable, Codable{
    var id = UUID()
    var plantName : String
    var imageName : String
    var price : String
}

let plantsData : [Plant] = [
    Plant(plantName: "001", imageName: "Gong_gong_1", price: "125,000"),
    Plant(plantName: "002", imageName: "Gong_gong_2", price: "100,000"),
    Plant(plantName: "005", imageName: "Gong_gong_5", price: "75,000"),
    Plant(plantName: "Spring spring Mini", imageName: "Spring_spring_mini", price: "35,000"),
    Plant(plantName: "Spring spring Small", imageName: "Spring_spring_small", price: "115,000"),
    Plant(plantName: "Spring spring Large", imageName: "Spring_spring_large", price: "145,000")
]


