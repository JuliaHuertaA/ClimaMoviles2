//
//  ClimaModelo.swift
//  Clima
//
//  Created by Mac4 on 24/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation

struct ClimaModelo {
    let condicionID: Int
    let nombreCiudad: String
    let descripcionClima: String
    let temperaturaCelcius: Double
    let TemperaturaMin : Double
    let TemperaturaMax : Double
    
    
    var condicionClima: String{
        switch condicionID {
        case 200...232:
            return "tormenta"
        case 700...781:
            return "nublado"
        case 800:
            return "sol"
        default:
            return "41wkG24yDkL"
        }
    }
    var temperaturaDecimal: String {
        return String(format:"%1.f",temperaturaCelcius)
    }
    var temperaturaMinima: String {
        return String(format:"%1.f",TemperaturaMin)
    }
    var temperaturaMaxima: String {
        return String(format:"%1.f",TemperaturaMax)
    }
    
}
