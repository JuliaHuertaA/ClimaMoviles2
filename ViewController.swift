//
//  ViewController.swift
//  Clima
//
//  Created by Mac4 on 23/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegate, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    func huboError(cualError : Error){
        print(cualError.localizedDescription)
        DispatchQueue.main.async {
            self.ciudadLabel.text = cualError.localizedDescription
            self.temperaturaLabel.text = ""
            self.DescLabel.text = ""
            self.TempMinLabel.text = ""
            self.TempMaxLabel.text = ""
            self.HumedadLabel.text = ""
            self.Descripcion.text = ""
            self.Minima.text = ""
            self.Maxima.text = ""
            self.Humedad.text = ""
            self.centigrados1.text = ""
            self.centigrados2.text = ""
            self.porcentaje.text = ""
            self.TempreaturaCLabel.text = ""
            self.errorImageView.image = UIImage(named:"error.png")
            self.climaImageView.image = UIImage(named: "")
            
        }
        
    }
    
    func actualizarClima(clima: ClimaModelo) {
        print(clima.descripcionClima)
        print(clima.temperaturaDecimal)
        print(clima.humedad)
        print(clima.temperaturaMaxima)
        print(clima.temperaturaMinima)
        
    
        DispatchQueue.main.async {
            self.Descripcion.text = "Descripción:"
            self.Minima.text = "Mínima:"
            self.Maxima.text = "Máxima:"
            self.Humedad.text = "Humedad:"
            self.centigrados1.text = "°C"
            self.centigrados2.text = "°C"
            self.porcentaje.text = "%"
            self.TempreaturaCLabel.text = "°C"
            
            self.ciudadLabel.text = clima.nombreCiudad
            self.temperaturaLabel.text = clima.temperaturaDecimal
            self.DescLabel.text = clima.descripcionClima
            self.TempMinLabel.text = clima.temperaturaMinima
            self.TempMaxLabel.text = clima.temperaturaMaxima
            self.HumedadLabel.text = clima.humedad
            self.climaImageView.image = UIImage(named: clima.condicionClima)
            self.errorImageView.image = UIImage(named: "")
            
        }
    }
    
    
    var climaManager = ClimaManager()

    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var climaImageView: UIImageView!
    @IBOutlet weak var TempMinLabel: UILabel!
    @IBOutlet weak var TempMaxLabel: UILabel!
    @IBOutlet weak var HumedadLabel: UILabel!
    @IBOutlet weak var DescLabel: UILabel!
    
    @IBOutlet weak var errorImageView: UIImageView!
    @IBOutlet weak var TempreaturaCLabel: UILabel!
    @IBOutlet weak var Descripcion: UILabel!
    @IBOutlet weak var Minima: UILabel!
    @IBOutlet weak var Maxima: UILabel!
    @IBOutlet weak var Humedad: UILabel!
    @IBOutlet weak var centigrados1: UILabel!
    @IBOutlet weak var centigrados2: UILabel!
    @IBOutlet weak var porcentaje: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //Solicita el permiso
        locationManager.requestLocation()
        
        climaManager.delegado = self
        buscarTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        print("Se obtuvo la ubicacion")
        if let ubicaciones = locations.last{
            let latitud = ubicaciones.coordinate.latitude
            let longitud = ubicaciones.coordinate.longitude
            climaManager.fetchClima(lat: latitud, long: longitud)
        }
    
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    @objc func tapGestureHandler() {
        buscarTextField.endEditing(true)
    }
    
    //para programar el boton del teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ciudadLabel.text = buscarTextField.text
        return true
    }
    //verificamos el textfield si es vacio
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != ""{
            return true
        }else{
            buscarTextField.placeholder = "Escribe el nombre de una ciudad"
            return false
        }
    }

    @IBAction func buscarButton(_ sender: UIButton) {
        ciudadLabel.text = buscarTextField.text
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
    }
    
    @IBAction func obtenerUbicacion(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}

