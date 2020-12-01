//
//  ViewController.swift
//  Clima
//
//  Created by Mac4 on 23/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegate {
    func actualizarClima(clima: ClimaModelo) {
        print(clima.descripcionClima)
        print(clima.temperaturaDecimal)
        
    
        DispatchQueue.main.async {
            self.temperaturaLabel.text = clima.temperaturaDecimal
            self.DescLabel.text = clima.descripcionClima
            self.TempMinLabel.text = clima.temperaturaMinima
            self.TempMaxLabel.text = clima.temperaturaMaxima
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
    override func viewDidLoad() {
        super.viewDidLoad()
        climaManager.delegado = self
        buscarTextField.delegate = self
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
}

