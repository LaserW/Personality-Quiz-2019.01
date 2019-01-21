//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Denis Bystruev on 15/01/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var questionIndex = 0
    
    var questions: [Question] = [
        
        Question(
            text: "Допустим, вы стоите на остановке в ожидании автобуса. Глядя в приложение Яндекс-транспорт, вы понимаете, что дойдёте до требуемого места, почти одновременно или быстрее ожидаемого транспорта. Вы предпочтёте идти пешком?",
            type: .multiple,//.single,
            answers: [
                Answer(text: "Лучше подождать.", type: .south),
                Answer(text: "Пройдусь, если недалеко.", type: .neutral),
                Answer(text: "Движение – жизнь!", type: .north),
                Answer(text: "Лучше идти, чем ждать и нервничать", type: .north),
            ]
        ),

        Question(
            text: "Вам иногда кажется, что происходящие события идут слишком медленно и вам приходится пробиваться и пытаться ускорить их ход?",
            type: .single,
            answers: [
                Answer(text: "Меня раздражает медлительность.", type: .north),
                Answer(text: "Я не тороплюсь, всему есть своё время.", type: .neutral),
                Answer(text: "Это так! Поторапливаю других.", type: .north),
                Answer(text: "Нет, я не успеваю за событиями.", type: .south),
                ]
        ),

        Question(
            text: "Вам легко переключаться с одной задачи на другую?",
            type: .ranged,
            answers: [
                Answer(text: "Легко", type: .north),
                Answer(text: "Терпимо", type: .neutral),
                Answer(text: "Напрягает", type: .neutral),
                Answer(text: "С трудом", type: .south),
                ]
        ),
        
        Question(
            text: "Вы верите в то, что силой своего воображения вы можете приблизить желаемую цель?",
            type: .multiple,
            answers: [
                Answer(text: "Да, это так, окружающий мир податлив.", type: .west),
                Answer(text: "Я не мечтатель, я работаю.", type: .east),
                Answer(text: "Чушь какая-то!", type: .neutral),
                Answer(text: "Не знаю.", type: .neutral),
                ]
        ),
        
        Question(
            text: "Когда в первый раз вы смотрели мультфильм .Ёжик в тумане., он полностью погрузил вас в свой мир, вызвав умиление?",
            type: .single,
            answers: [
                Answer(text: "Интересно, но не жизненно.", type: .neutral),
                Answer(text: "Не интересно.", type: .east),
                Answer(text: "Я сопереживал героям мультфильма.", type: .west),
                Answer(text: "Я не смотрел этот мультфильм.", type: .neutral),
                ]
        ),
        
        Question(
            text: "Вы часто надеетесь, что в вашей жизни появится кто-то, кто обратит на вас внимание, изменит жизнь, быть может, решит проблему?",
            type: .ranged,
            answers: [
                Answer(text: "Да, надеюсь.", type: .west),
                Answer(text: "Это возможно.", type: .neutral),
                Answer(text: "Надежды мало.", type: .neutral),
                Answer(text: "И кому это нужно?", type: .east),
                ]
        ),
        
        Question(
            text: "Кажется, вы переносите холод легче чем многие другие?",
            type: .multiple,
            answers: [
                Answer(text: "Стараюсь сесть под кондиционер.", type: .south),
                Answer(text: "Московское лето слишком жаркое.", type: .south),
                Answer(text: "Мёрзну ожидая автобус.", type: .north),
                Answer(text: "Нет, я обычный человек.", type: .neutral),
                ]
        ),
        
        Question(
            text: "Вы не любите перемен, готовы мириться с неудобствами лишь бы всё оставалось по-привычному, но как только внешние события толкают в новое, малоизвестное направление, вы достигаете не меньших успехов?",
            type: .single,
            answers: [
                Answer(text: "Кто знает, что будет на новом месте.", type: .south),
                Answer(text: "Легко меняю место работы.", type: .north),
                Answer(text: "Это правда.", type: .south),
                Answer(text: "Бывает по-разному.", type: .neutral),
                ]
        ),
        
        Question(
            text: "Вам кажется, что другие люди часто пользуются вами, используя вашу работоспособность и знания?",
            type: .ranged,
            answers: [
                Answer(text: "Не отказываю в помощи", type: .south),
                Answer(text: "Стараюсь помочь.", type: .west),
                Answer(text: "Нет.", type: .east),
                Answer(text: "Пресекаю на корню.", type: .north),
                ]
        ),
        
        Question(
            text: "Вам неприятны двусмысленные фразы?",
            type: .single,
            answers: [
                Answer(text: "Это неаккуратность или спешка.", type: .east),
                Answer(text: "Это порождает хаос.", type: .east),
                Answer(text: "Вовсе нет, это довольно забавно.", type: .west),
                Answer(text: "Не предаю особого значения.", type: .neutral),
                ]
        ),
        
        Question(
            text: "Вам интересно наблюдать за людьми, природой, животными? Во всём этом, вы успеваете подметить все делали происходящего?",
            type: .single,
            answers: [
                Answer(text: "Именно так.", type: .east),
                Answer(text: "Да, но эстетика важнее.", type: .west),
                Answer(text: "Любуюсь природой.", type: .neutral),
                Answer(text: "Я не наблюдателен.", type: .north),
                ]
        ),
        
        
        
        
        

    ]
    
    var answersChosen = [Answer]()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let question = questions[questionIndex]
        let answers = question.answers
        let progress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = question.text
        questionLabel.numberOfLines = 0
        progressView.setProgress(progress, animated: true)
        
        switch question.type {
        case .single:
            updateSingleStack(with: answers)
        case .multiple:
            updateMultipleStack(with: answers)
        case .ranged:
            updateRangedStack(with: answers)
        }
    }
    
    func updateSingleStack(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        //            for i in 0..<singleButtons.count {
        //                singleButtons[i].setTitle(answers[i].text, for: .normal)
        //            }
        guard singleButtons.count <= answers.count else { return }
        singleButtons.enumerated().forEach {
            $0.element.setTitle(answers[$0.offset].text, for: .normal)
        }
    }
    
    func updateMultipleStack(with answers: [Answer]) {
        multipleStackView.isHidden = false
        guard multiLabels.count <= answers.count else { return }
        multiLabels.enumerated().forEach { $0.element.text = answers[$0.offset].text }
    }
    
    func updateRangedStack(with answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    

    
//     MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        
        if let sendAnswers: ResultsViewController  = segue.destination as? ResultsViewController {
            sendAnswers.answers = answersChosen
        }
        
    }
 
    
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        
        guard let index = singleButtons.index(of: sender) else { return }
        
        let answer = answers[index]
        
        answersChosen.append(answer)
        print(#function, answer)
        print()
        
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed() {
        let answers = questions[questionIndex].answers
        
        multiSwitches.enumerated().forEach {
            if $0.element.isOn {
                let answer = answers[$0.offset]
                answersChosen.append(answer)
                print(#function, answer)
            }
        }
        
        print()
        
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed() {
        let answers = questions[questionIndex].answers
        
        let index = Int(round(rangedSlider.value * Float(answers.count - 1)))
        
        let answer = answers[index]
        answersChosen.append(answer)
        
        print(answer)
        print()
        
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
}
