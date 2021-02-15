//
//  QuizModel.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/13.
//

import Foundation

class QuizModel{
    
    let quizText:String
    let answer:String
    
    init(quizName:String, currentAnswer:String){
        
        quizText = quizName
        answer = currentAnswer
        
    }
    
}
