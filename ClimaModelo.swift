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
    let Humedad : Int
    var condicionClima: String{
        switch condicionID {
        case 200...232:
            return "tormenta.png"
        case 300...531:
            return "lluvia.png"
        case 600...622:
            return "nieve.png"
        case 701...781:
            return "tornado.png"
        case 800:
            return "sol.png"
        case 801...804:
            return "nube-removebg-preview.png"
        default:
            return "41wkG24yDkL.png"
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
    var humedad: String {
        return String(Humedad)
    }
    
}
