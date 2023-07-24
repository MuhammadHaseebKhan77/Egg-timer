
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    //  let softTime=5
    //let mediumTime=8
  //  let hardTime=12
    let eggTimes=["Soft":20,"Medium":150,"Hard":300]// dictionary
    var timer=Timer()
    var totalTime=0
    var secondsPassed=0
    @IBAction func hardnessSelected(_  sender:UIButton) {
        
        timer.invalidate() //This line stops the timer if it is currently running. This is necessary to reset the timer when a new hardness button is selected.
      
        // print(sender.currentTitle!) this will tell us about the title of the button pressed
        let hardness = sender.currentTitle!
        totalTime=eggTimes[hardness]! //ask
        
        progressBar.progress=0.0
        secondsPassed=0
        titleLable.text=hardness
        
       timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){  //This line declares the updateTimer function, which will be called by the timer every second. The @objc attribute is used because the function is referenced using #selector.
        if secondsPassed<totalTime{
            secondsPassed+=1// this will subtract the 1 second from the timer each time second printed untill it reaches the desired declared seconds.
            progressBar.progress=Float(secondsPassed)/Float(totalTime)
            print(Float(secondsPassed)/Float(totalTime))
           
        }else{
           // timer.invalidate()
            titleLable.text="Done"
        }
    }
}


//timeInterval: This parameter specifies the time interval, in seconds, between each firing of the timer. In this case, the interval is set to 1.0, which means the timer will fire every 1 second.
//target: This parameter specifies the target object that the timer should call the selector on. In this case, self refers to the current instance of the ViewController class, indicating that the updateTimer method should be called on the view controller itself.
//selector: This parameter specifies the method to be called when the timer fires. It uses the #selector syntax to refer to the updateTimer method. The updateTimer method should be marked with the @objc attribute to indicate that it can be accessed using a selector.
//userInfo: This parameter allows you to pass any additional information to the method being called by the timer. In this case, it is set to nil as there is no specific user information being passed.
//repeats: This parameter determines whether the timer should repeat or fire only once. Setting it to true means the timer will continue to repeat indefinitely until invalidated.
//In summary, the line of code creates a timer that will call the updateTimer method on the current view controller every 1 second. This allows the view controller to update the progress bar and perform any other necessary actions at regular intervals
