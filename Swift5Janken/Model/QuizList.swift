//
//  QuizList.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/13.
//

import Foundation

class QuizList{
    
    var list = [QuizModel]()
    
    init(){
        
        list.append(QuizModel(quizName: "お酢に卵を殻ごといれると卵はどうなるでしょう？", currentAnswer: "透明な卵になる"))
        list.append(QuizModel(quizName: "リンカーンは大統領になる前は何をしていたでしょうか？", currentAnswer: "レスラー"))
        list.append(QuizModel(quizName: "飛行機の中で食べるように作られた野菜があります。その野菜はどれでしょう？", currentAnswer: "ミニトマト"))
        list.append(QuizModel(quizName: "しゃっくりはある調味料をなめると止まります。ある調味料とはなんでしょう？", currentAnswer: "砂糖"))
        list.append(QuizModel(quizName: "甘くて美味しい羊羹ですが、羊羹はもともとあるものを煮込んだスープのことでした。あるスープとはなんでしょう？", currentAnswer: "羊の肉"))
        list.append(QuizModel(quizName: "おぼうさんが木魚をたたく意味はなんでしょう？", currentAnswer: "眠くならないようにするため"))
        list.append(QuizModel(quizName: "「アホウドリ」の名前の由来はなんでしょう？", currentAnswer: "人間にすぐつかまるから"))
        list.append(QuizModel(quizName: "氷が長持ちする作り方はなんでしょう？", currentAnswer: "沸騰したお湯をいれて氷を作る"))
        list.append(QuizModel(quizName: "有名な作曲家「ベートーベン」の癖はなんだったでしょう？", currentAnswer: "念入りに手を洗う"))
        list.append(QuizModel(quizName: "ドジョウは人間と同じようにあることをします。あることとはどれでしょう？", currentAnswer: "おなら"))
        list.append(QuizModel(quizName: "豚のくるくる巻いてあるしっぽが、あるときは伸びてまっすぐになります。あるときとは、いつでしょう？", currentAnswer: "眠っている時"))
        list.append(QuizModel(quizName: "ナメクジは塩で溶けますが、他にもある調味料で溶けます。ある調味料とはなんでしょう？", currentAnswer: "砂糖"))
        list.append(QuizModel(quizName: "植物にも人間と同じようにあるものがあります。あるものとはなんでしょう？", currentAnswer: "血液型"))
        list.append(QuizModel(quizName: "四つ葉のクローバーはあるものに形が似ているから、見つけたら「幸福・幸せ」と言われています。ある物の形とはなんでしょう？", currentAnswer: "十字架"))
        list.append(QuizModel(quizName: "大根おろしはあるすり方をすると、辛くなります。そのすり方とはなんでしょう？", currentAnswer: "早くする"))

        
    }
    
}
