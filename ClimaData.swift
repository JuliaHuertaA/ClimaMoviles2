//
//  ClimaData.swift
//  Clima
//
//  Created by Mac4 on 24/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation

struct ClimaData: Decodable {
    let name : String
    let cod : Int
    let main: Main
    let weather : [Weather]
    let coord : Coord
}
struct Main: Decodable {
    let temp : Double
    let temp_min : Double
    let temp_max : Double
    let humidity : Int
}
struct Weather: Decodable {
    let id : Int
    let description : String
}
struct Coord: Decodable {
    let lon: Double
    let lat: Double
}
