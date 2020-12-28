
import UIKit

class CalculateViewController: UIViewController {

 
    var calculatorBrain = CalculatorBrain()
    
    /*these are for the TEXT that diplays height & weight*/
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    /*these are to store the VALUE when slider is moved*/
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        
        let height = String(format:"%.2f", sender.value)
        heightLabel.text =  height + "m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        
        let weight = String(format:"%.0f", sender.value)
        weightLabel.text = weight + "Kg"
    }
    
    /*ADDING SECOND VIEW ONCE THIS BUTTON IS PRESSED**/
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height, weight)
        
        //Will immediatly go to prepare function, thus it must be overwrittern
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    //this function call will change the UI for resultViewController to show appropiate things.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //check we are on the right segue
        if(segue.identifier == "goToResults"){
            /* create new reference to resultsViewController
                    * Forcing destiination to a resultViewController
                    * Downcasting from UIViewController to resultViewController
                    */
            let destinationVC = segue.destination as! resultViewController
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

