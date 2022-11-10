#  DISSERTATIVAS

#01
O que é uma segue?

#02
Considere que no meu app possuo uma ViewController chamada ResultViewController.

Dentro da HomeViewController possuo o seguinte evento para um tap num button:

@IBAction calculateResultButtonPressed(_ sender: UIButton) {
    
        let storyboard : UIStoryboard = UIStoryboard(name: "ResultScreen", bundle: nil)
        let nextScreen = storyboard.instantiateViewController(withIdentifier: "ResultScreen") as! ResultViewController
        
        nextScreen.person = person
        nextScreen.modalPresentationStyle = .fullScreen
        
        self.present(nextScreen, animated: true)
        
        
} RESPOSTA: ResultScreen é o nome da Storyboard que desejo ir e a tag da mesma. ResultViewController é a classe da ViewController que está linkada a esta storyboard

O que tenho que escrever no evento do botão para exibir em tela o conteúdo de ResultViewController?

OBS: considere que nenhuma configuração de segue foi feita.

#03
De que forma podemos passar dados de uma view controller para outra? Escreva códigos para exemplificar seu uso.

RESPOSTA

Minha ResultViewController possuí uma variavel do tipo Person.

Podemos usar o seguinte código:  
        let storyboard : UIStoryboard = UIStoryboard(name: "ResultScreen", bundle: nil)
        let nextScreen = storyboard.instantiateViewController(withIdentifier: "ResultScreen") as! ResultViewController
        nextScreen.person = Person(height: 1.77, weight: 70.0) //AQUI SETAMOS A PERSON DA RESULTVIEWCONTROLLER

#04
Como podemos fazer para apresentar uma tela que ocupe o dispositivo inteiro?
 Setando o modalPresentationStyle como fullscreen
