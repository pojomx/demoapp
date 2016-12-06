//
//  ViewController.swift
//  AppDemo
//
//  Created by AdminUTM on 05/12/16.
//  Copyright © 2016 cursodeios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
DetalleViewControllerDelegate {
    
    @IBOutlet weak var btnBoton: UIButton!
    @IBAction func btnPresionado(_ sender: Any) {
        print("botón presionado")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Vista cargada")
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: DetalleView Delegates
    func numeroCambiado(numero: Int) {
        print("Numero cambiado: \(numero)")
        datos[numero].1 = datos[numero].1 + 1
    }
 
    

    // MARK: - TableViewDelegates

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let proto = (indexPath.row % 2 == 0) ? "proto1" : "proto2"
        
        let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! FilaTableViewCell
        
        if indexPath.row % 2 == 0
        {
            vista.lblIzquierda.text = datos[indexPath.row].0
            vista.lblDerecha.text = "\(datos[indexPath.row].1)"
            
        } else {
            vista.lblDerecha.text = datos[indexPath.row].0
            vista.lblIzquierda.text = "\(datos[indexPath.row].1)"
            
        }
        
        
        return vista
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        filaSeleccionada = indexPath.row
        
        performSegue(withIdentifier: "Detalle Segue", sender: self)
        
    }
    
    // MARK: - UIView Delegates
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! DetalleViewController
        
        view.numeroFila = filaSeleccionada
        view.dato = datos[filaSeleccionada].0
        view.datoNumero = datos[filaSeleccionada].1
        
        view.delegado = self
        
    }
    
    //MARK : - Declaraciones
    var filaSeleccionada = -1
    
    var datos = [("Alan", 30), ("Bety",29),("Carlos",28), ("Denisse",27),("Enrique",26)]
    
}

