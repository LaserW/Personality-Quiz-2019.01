//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Denis Bystruev on 15/01/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var answers: [Answer]? {
        didSet {
            print(#function, answers ?? "nil")
        }
    }
    
    var north : Int = 0
    var west : Int = 0
    var south : Int = 0
    var east : Int = 0
    var neutral : Int = 0
    var who : String = "Север"
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var description2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print (answers?.count)
        
        count()
        
        print(north, west, south, east)
        
        description2.text = chose()
        
        result.text = "Вы - " + who + "!"
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func count() {
        var temp: Int = Int((answers?.count)!) - 1
        for index in 0...temp {
            //print (answers?[index].type )
            switch (answers?[index].type)
            {
            case (AnimalType.north)? : north += 1
            case (AnimalType.west)? : west += 1
            case (AnimalType.south)? : south += 1
            case (AnimalType.east)? : east += 1
            case (AnimalType.neutral)? : neutral += 1
            default : break
                
            }
        }
    }
    
    func chose() -> String {
        if (north >= west) && (north >= south) && (north >= east) {
            who = "Север"
            return AnimalType.north.definition
        }
        if (west >= north) && (west >= south) && (west >= east) {
            who = "Запад"
            return AnimalType.west.definition
        }
        if (south >= north) && (south >= west) && (south >= east) {
            who = "Юг"
            return AnimalType.south.definition
        }
        if (east >= north) && (east >= west) && (east >= south) {
            who = "Восток"
            return AnimalType.east.definition
        }
        return ""
    }
    
    
}
