
import UIKit

class CalculateViewController: UIViewController {

 
    var bmiValue:String = "0.0"
    
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
        
        //BMI = Weight / (Height ^2)
        let bmi = Float(weight) / pow(Float(height), 2.0)
        bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    //whenever .performSegue is called we need to override this function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //check we are on the right segue
        if(segue.identifier == "goToResults"){
            /* create new reference to resultsViewController
                    * Forcing destiination to a resultViewController
                    * Downcasting from UIViewController to resultViewController
                    */
            let destinationVC = segue.destination as! resultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
}

