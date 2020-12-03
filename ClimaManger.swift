//
//  ClimaManger.swift
//  Clima
//
//  Created by Mac4 on 24/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation
protocol ClimaManagerDelegate {
    func actualizarClima(clima:ClimaModelo)
    
    func huboError(cualError : Error)
}

struct ClimaManager{
    var delegado: ClimaManagerDelegate?
    let climaUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3e69357dabf1ecf0c20c381e647b594f&units=metric&lang=es"
    
    func fetchClima(nombreCiudad:String){
        let urlString = "\(climaUrl)&q=\(nombreCiudad)"
        print(urlString)
        realizarSolicitd(urlString: urlString)
    }
    func fetchClima(lat: Double, long:Double ){
        let urlString = "\(climaUrl)&lat=\(lat)&lon=\(long)"
        print(urlString)
        realizarSolicitd(urlString: urlString)
    }
    
    func realizarSolicitd(urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            //let tarea = session.dataTask(with: url, completionHandler: handle(data:respuesta:error:))
            let tarea = session.dataTask(with: url){ (data, respuesta, error) in
                if error != nil {
                    self.delegado?.huboError(cualError : error!)
                    print(error!)
                    return
                }
                
                if let datosSeguros = data {
                    if let clima = self.parseJSON(climaData: datosSeguros){
                        self.delegado?.actualizarClima(clima: clima)
                    }
                }
            }
            tarea.resume()
        }
    }
    func parseJSON(climaData: Data) -> ClimaModelo?{
        let decoder = JSONDecoder()
        do{
           let dataDecodificada = try decoder.decode(ClimaData.self, from: climaData)
            let id = dataDecodificada.weather[0].id
            let nombre = dataDecodificada.name
            let descripcion = dataDecodificada.weather[0].description
            let temperatura = dataDecodificada.main.temp
            let tempMin = dataDecodificada.main.temp_min
            let tempMax = dataDecodificada.main.temp_min
            let humedad = dataDecodificada.main.humidity
       
            let ObjClima = ClimaModelo(condicionID: id, nombreCiudad: nombre, descripcionClima: descripcion, temperaturaCelcius: temperatura, TemperaturaMin : tempMin, TemperaturaMax : tempMax, Humedad : humedad)

            return ObjClima
        }catch{
            self.delegado?.huboError(cualError : error)
            print(error)
            return nil
        }
    }

}
