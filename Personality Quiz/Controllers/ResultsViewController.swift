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
    
    @IBOutlet weak var result: UILabel!
    
   // @IBOutlet weak var description: UILabel!
    
    @IBOutlet weak var description2: UILabel!
    
    var cat : Int = 0
    var dog : Int = 0
    var rabbit : Int = 0
    var turtle : Int = 0
    var who : String = "Кошка"
    //var temp = answers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (answers?.count)
        var temp: Int = Int((answers?.count)!) - 1
        
     for index in 0...temp {
        //print (answers?[index].type )
        switch (answers?[index].type)
        {
        case (AnimalType.cat)? : cat += 1
        case (AnimalType.dog)? : dog += 1
        case (AnimalType.rabbit)? : rabbit += 1
        case (AnimalType.turtle)? : turtle += 1
            
        default : break
            
        }
    }
        print(cat, dog, rabbit, turtle)
        // Do any additional setup after loading the view.
        if (cat >= dog) && (cat >= rabbit) && (cat >= turtle) {
            who = "Кошка"
            description2.text = AnimalType.cat.definition
        }
        if (dog >= cat) && (dog >= rabbit) && (dog >= turtle) {
            who = "Собака"
            description2.text = AnimalType.dog.definition
        }
        if (rabbit >= cat) && (rabbit >= dog) && (rabbit >= turtle) {
            who = "Кролик"
            description2.text = AnimalType.rabbit.definition
        }
        if (turtle >= cat) && (turtle >= dog) && (turtle >= rabbit) {
            who = "Черепаха"
            description2.text = AnimalType.turtle.definition
        }
        
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

}
