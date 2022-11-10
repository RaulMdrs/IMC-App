//
//  ResultViewController.swift
//  IMC App
//
//  Created by Raul de Medeiros on 10/11/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var ResultLabel: UILabel!
    var person : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureLayout()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    func ConfigureLayout(){
        let imcResult = person!.CalcIMC()
        var typeBackgound : String = ""
        ResultLabel.text! =  "Olá, \(person!.name)\nSeu IMC é: \n\n\(String(format: "%.1f", person!.imcResult!))\n\nVocê está\n"
        
        if person!.genre == .men{
            switch imcResult{
            case ..<20.7: ResultLabel.text! += "Abaixo do Peso\n"
                typeBackgound = "warning"
            case 20.7...26.4:  ResultLabel.text! += "Peso ideal\n"
                typeBackgound = "safe"
            case 26.5...27.8: ResultLabel.text! += "Pouco acima do peso\n"
                typeBackgound = "warning"
            case 27.9...31.1: ResultLabel.text! += "Acima do Peso\n"
                typeBackgound = "warning"
            case 31.2...: ResultLabel.text! += "Obeso\n"
                typeBackgound = "danger"
            default: ResultLabel.text = "Erro"
                }
            }
        else{
            switch person!.CalcIMC(){
            case ..<19.1: ResultLabel.text! += "Abaixo do Peso\n"
                typeBackgound = "warning"
            case 19.1...25.8:  ResultLabel.text! += "Peso ideal\n"
                typeBackgound = "safe"
            case 25.9...27.3: ResultLabel.text! += "Pouco acima do peso\n"
                typeBackgound = "warning"
            case 27.4...32.3: ResultLabel.text! += "Acima do Peso\n"
                typeBackgound = "warning"
            case 32.3...: ResultLabel.text! += "Obesa\n"
                typeBackgound = "danger"
            default: ResultLabel.text = "Erro"
                }
        }
        
        background.image = UIImage(named: "\(typeBackgound)Background")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
