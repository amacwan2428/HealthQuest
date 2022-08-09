//
//  RunningViewController.swift
//  HealthQuest
//
//  Created by Brayan Diaz on 8/8/22.
//

import UIKit
import MapKit
import CoreLocation
import Foundation

class RunningViewController: UIViewController,CLLocationManagerDelegate {

    var seconds = 0
    
    var timer:Timer = Timer()
//    var timeStarted = Bool()
    var count:Int = 0
    var timerCounting:Bool = false
    
//    var activeTimer = SKLabelNode()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnStart: UIButton!
    
    @IBOutlet weak var activeTimer: UILabel!
    @IBOutlet weak var distanceDisplay: UILabel!
    @IBOutlet weak var caloriesDisplay: UILabel!
    @IBOutlet weak var stepsDisplay: UILabel!
    
    let managerLocation = CLLocationManager() // Location Manager
    var lastLocation: CLLocation!  // last location , is used to find Accelelration
    var distance:Double = 0 // Distance
    var step:Double = 0 // steps
    var calories:Double = 0 // calories
    var startedStatus:Bool = true
    var totalDistance:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        managerLocation.delegate = self
        managerLocation.desiredAccuracy = kCLLocationAccuracyBest
        managerLocation.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
                
        //validate last location
        if lastLocation != nil {
            
            if (location.horizontalAccuracy > 0) {
                
                distance += lastLocation.distance(from: locations.last!)
                updateLocationInfo(loc: location,lastLoc: lastLocation)

                
            }
            
            
            
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                
            let myLocation = CLLocationCoordinate2DMake(lastLocation!.coordinate.latitude, lastLocation!.coordinate.longitude)
                
            let region = MKCoordinateRegion(center: myLocation, span: span)
                
            mapView.setRegion(region, animated: true)
            self.mapView.showsUserLocation = true
            
                
            
        }
        lastLocation = locations[0]
        
        
    }
    
    func updateLocationInfo(loc: CLLocation,lastLoc: CLLocation ) {
        
        let _speedToKPH = (loc.speed * 3.6) // convert m/s to km/h
        
            // Checking if speed is less than zero
            if (_speedToKPH > 0) {
                
                // Speed
//                speedDisplay.text = (String(format: "%.2f km/h", _speedToKPH))
//                arraySpeed.append(_speedToKPH)
                
                // distance
                let totalDistance = distance / 1000
                distanceDisplay.text = (String(format: "%.2f Km", totalDistance))

                let totalCalories = totalDistance * 0.97 * 70
                
                caloriesDisplay.text = (String(format: "%.2f Calories", totalCalories))
                
                let totalSteps = totalDistance / 0.000758
                
                stepsDisplay.text = (String(format: "%.0f Steps", totalSteps))
                // high speed
//                let highSpeed = arraySpeed.max()
//                maxSpeedDisplay.text = (String(format: "%.2f km/h", highSpeed!))
                
                // aceleration (currenspeed - lastSpeed) / time
//                let accel:Double = (loc.speed - Double(lastLoc.speed)) / 1
                
//                arrayAcc.append(accel)
//                let maxAccel = arrayAcc.max() // get max acceleration
//                accelDisplay.text = (String(format: "%.3f m/s^2", maxAccel ?? 0))

                // average Speed
//                let speedItems:[Double] = arraySpeed
//                let speedAvg = speedItems.reduce(0, +) / Double(speedItems.count)
//                averageSpeedDisplay.text = (String(format: "%.2f km/h", speedAvg))
                
                // if speed is over than 115
                
                
            } else {
//                speedDisplay.text = "0.00 km/h"
            }
        
    }
    

    @IBAction func startButton_Clic(_ sender: Any) {
        
        if startedStatus {
            activeTimer.text = "00 : 00 : 00"
            
            btnStart.backgroundColor = UIColor.systemRed
            btnStart.setTitle("Stop!", for: .normal)
            startedStatus = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            // start update location
            totalDistance = 0
            distance = 0
            managerLocation.startUpdatingLocation()
            
            
            
        }else{
            btnStart.backgroundColor = UIColor.systemGreen
            btnStart.setTitle("Go!", for: .normal)
            startedStatus = true
            timer.invalidate()
            count = 0
            totalDistance = 0
            distance = 0
            managerLocation.stopUpdatingLocation()
            self.mapView.showsUserLocation = false
        }
        
    }
    
    @objc func timerCounter() -> Void{
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        activeTimer.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int ){
        return ((seconds / 3600),((seconds % 3600)/60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String{
        
        var timeString  = ""
        timeString += String(format: "%02d",hours)
        timeString += " : "
        timeString += String(format: "%02d",minutes)
        timeString += " : "
        timeString += String(format: "%02d",seconds)
        
        return timeString
        
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
