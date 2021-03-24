//
//  QuestionViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/11.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var btnRed: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnyellow: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    let quizList = QuizList()
    let resultList = ResultList()
    
    var QuizCount = 0
    var array:[Int] = []
    var result:[Int] = []
    var answerArray = [String]()
    var correctAnswer = String()
    var buttonArray = [UIButton]()
    var correctCount = 0
    var wrongCount = 0
    var averageCount = 0.0
    var averageTotal = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonArray = [btnRed, btnBlue, btnGreen, btnyellow]
        for i in 0..<buttonArray.count{
            buttonArray[i].titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            buttonArray[i].titleLabel?.numberOfLines = 3
            buttonArray[i].titleLabel?.textAlignment = .center
        }
        
        questionLabel.text = "問題\(QuizCount + 1)"
        textView.text = quizList.list[QuizCount].quizText
        answerArray = [resultList.resultList[QuizCount].result1Text,resultList.resultList[QuizCount].result2Text,resultList.resultList[QuizCount].result3Text,resultList.resultList[QuizCount].result4Text]
        nextBtn.isHidden = true
        
        setBtton()
        
    }
    
    //画面戻ってきた時に発動するメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        correctCount = 0
        wrongCount = 0
        QuizCount = 0
        
        textView.text = quizList.list[QuizCount].quizText
        answerArray = [resultList.resultList[QuizCount].result1Text,resultList.resultList[QuizCount].result2Text,resultList.resultList[QuizCount].result3Text,resultList.resultList[QuizCount].result4Text]
        questionLabel.text = "問題\(QuizCount + 1)"
        resultLabel.font = resultLabel.font.withSize(40)
        resultLabel.text = "結果発表"
        nextBtn.isHidden = true
        setBtton()
        for i in 0..<buttonArray.count{
            buttonArray[i].isHidden = false
        }
        
    }
    
    //正解表示後２回目のボタンが押せなくなるようにするメソッド
    func resultIsEnabled(){
        
        for i in 0..<buttonArray.count{
            if i == buttonArray[i].tag - 1{
                buttonArray[i].isEnabled = false
            }
        }
        
    }
    
    //正解だけを表示するメソッド
    func resultHidden(){
        for i in 0..<buttonArray.count{
            if buttonArray[i].currentTitle != correctAnswer{
                buttonArray[i].isHidden = true
            }
        }
        lastQuiz()
    }
    
    @IBAction func answer(_ sender: Any) {
        
        let intArray = [1,2,3,4]
        for r in 0..<intArray.count{
            if (sender as AnyObject).tag == intArray[r]{
                if correctAnswer == (sender as AnyObject).currentTitle{
                    resultLabel.text = "正解"
                    correctCount += 1
                    nextBtn.isHidden = false
                    resultIsEnabled()
                    resultHidden()
                }else{
                    wrongCount += 1
                    resultLabel.font = resultLabel.font.withSize(20)
                    resultLabel.text = "正解：\(quizList.list[QuizCount].answer)"
                    for i in 0...3{
                        if i != (sender as AnyObject).tag - 1{
                            buttonArray[i].isHidden = true
                        }
                    }
                    resultIsEnabled()
                    nextBtn.isHidden = false
                    lastQuiz()
                }
            }
        }
    }
    
    //ボタンをシャッフルして表示
    func setBtton(){
        for e in 0..<buttonArray.count {
            array.append(e)
        }
        for i in 0..<array.count{
            let idx = Int(arc4random() % UInt32(array.count))
            result.append(array[idx])
            array.remove(at: idx)
        }
        
        btnyellow.setTitle(answerArray[result[0]], for: .normal)
        btnBlue.setTitle(answerArray[result[1]], for: .normal)
        btnRed.setTitle(answerArray[result[2]], for: .normal)
        btnGreen.setTitle(answerArray[result[3]], for: .normal)
        correctAnswer = quizList.list[QuizCount].answer
    }
    
    //最後の問題の時に発動するメソッド
    func lastQuiz(){
        if QuizCount == quizList.list.count - 1{
            questionLabel.text = "問題終了"
            nextBtn.isHidden = true
            averageCount = Double(correctCount) / Double(quizList.list.count)
            averageTotal = averageCount * 100.0
            performSegue(withIdentifier: "result", sender: nil)
        }
    }
    
    //画面遷移時、値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.correctedCount = correctCount
            resultVC.wornCount = wrongCount
            resultVC.averageCount = Int(averageTotal)
        }
    }
    
    //次の問題に移るためのメソッド
    func nextQuiz(){
        
        if QuizCount < quizList.list.count - 1{
            QuizCount += 1
            
            //問題を表示させる
            textView.text = quizList.list[QuizCount].quizText
            
            //ボタンのテキストを表示させるための配列
            answerArray = [resultList.resultList[QuizCount].result1Text,resultList.resultList[QuizCount].result2Text,resultList.resultList[QuizCount].result3Text,resultList.resultList[QuizCount].result4Text]
            questionLabel.text = "問題\(QuizCount + 1)"
        }
        
    }
    //次の問題へボタンを押下時、発動する
    @IBAction func next(_ sender: Any) {
        
        nextQuiz()
        setBtton()
        
        //消えたボタンと押せなくなったボタンを再度使えるようにする
        for i in 0..<buttonArray.count{
            buttonArray[i].isHidden = false
            buttonArray[i].isEnabled = true
        }
        resultLabel.font = resultLabel.font.withSize(40)
        resultLabel.text = "結果発表"
        nextBtn.isHidden = true
    }
    

    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
