//
//  ClimaData.swift
//  Clima
//
//  Created by Mac4 on 24/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation

struct ClimaData: Codable {
    let name : String
    let cod : Int
    let main: Main
    let weather : [Weather]
    let coord : Coord
}
struct Main: Codable {
    let temp : Double
    let temp_min : Double
    let temp_max : Double
    let humidity : Int
}
struct Weather: Codable {
    let id : Int
    let description : String
}
struct Coord: Codable {
    let lon: Double
    let lat: Double
}
