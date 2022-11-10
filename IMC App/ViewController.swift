//
//  ViewController.swift
//  IMC App
//
//  Created by Raul de Medeiros on 09/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var ShowHeightLable: UILabel!
    @IBOutlet weak var SexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ShowWeightLabel: UILabel!
    
    var personDefinition : (height : Float, weight : Float, genre : Genre, name : String) = (1.40, 50.0, .men, "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureLayout()
        // Do any additional setup after loading the view.
    }
    @IBAction func HeightSlider(_ sender: UISlider) {
        ConfigureText()
    }
    
    @IBAction func WeightSlider(_ sender: UISlider) {
        ConfigureText()
    }
    
    @IBAction func CalcButtonPressed(_ sender: Any) {
        let nextScreen = ConfigureNextView()
        
        
        self.present(nextScreen, animated: true)
    }
    
    @IBAction func genreSegmentedControl(_ sender: UISegmentedControl) {
      ConfigureLayout()
    }
    
    func ConfigureNextView() -> ResultViewController{
        ConfigurePerson()
        let person = Person(height: personDefinition.height, weight: personDefinition.weight, genre: personDefinition.genre, name: personDefinition.name)
        let storyboard : UIStoryboard = UIStoryboard(name: "ResultScreen", bundle: nil)
        let nextScreen = storyboard.instantiateViewController(withIdentifier: "ResultScreen") as! ResultViewController
        
        nextScreen.person = person
        nextScreen.modalPresentationStyle = .fullScreen
        
        return nextScreen
    }
    
    func ConfigurePerson(){
        personDefinition.height = heightSlider.value / 100
        personDefinition.weight = weightSlider.value
        personDefinition.name = nameTextField.text ?? "Pessoa"
        
        switch SexSegmentedControl.selectedSegmentIndex{
        case 0: personDefinition.genre = .men
        case 1: personDefinition.genre = .women
        default: personDefinition.genre = .men
        }
        
    }
    
    func ConfigureText(){
        var formatted = "\(String(format: "%.1f", weightSlider.value))kg"
        ShowWeightLabel.text = formatted
        formatted = "\(String(format: "%.2f", heightSlider.value / 100.0))m"
        ShowHeightLable.text = formatted
    }
    
    func ConfigureLayout(){
        switch SexSegmentedControl.selectedSegmentIndex{
        case 0:background.image = UIImage(named: "menBackground")
            heightSlider.maximumTrackTintColor = UIColor.systemBlue
            heightSlider.minimumTrackTintColor = UIColor.systemCyan
            heightSlider.thumbTintColor = UIColor.cyan
            weightSlider.maximumTrackTintColor = UIColor.systemBlue
            weightSlider.minimumTrackTintColor = UIColor.systemCyan
            weightSlider.thumbTintColor = UIColor.cyan
            symbolImage.image = UIImage(named: "menSymbol")
            heightSlider.setValue(173, animated: true)
            weightSlider.setValue(69.4, animated: true)
            
            
        case 1:background.image = UIImage(named: "womenBackground")
            heightSlider.maximumTrackTintColor = UIColor.systemPink
            heightSlider.minimumTrackTintColor = UIColor.systemPurple
            heightSlider.thumbTintColor = UIColor.systemPurple
            weightSlider.maximumTrackTintColor = UIColor.systemPink
            weightSlider.minimumTrackTintColor = UIColor.systemPurple
            weightSlider.thumbTintColor = UIColor.systemPurple
            symbolImage.image = UIImage(named: "womenSymbol")
            heightSlider.setValue(161, animated: true)
            weightSlider.setValue(57.8, animated: true)
            
        default:
            print("error")
        }
        ConfigureText()
    }
}

