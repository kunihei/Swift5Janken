//
//  ResultList.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/14.
//

import Foundation

class ResultList{
    
    var resultList = [ResultModel]()
    
    init() {
        
        resultList.append(ResultModel(result1: "透明な卵になる", result2: "鏡のようになんでもうつる卵になる", result3: "卵が溶けてなくなる", result4: "卵が石のように堅くなる"))
        resultList.append(ResultModel(result1: "プロ野球選手", result2: "猟師", result3: "レスラー", result4: "タクシー運転手"))
        resultList.append(ResultModel(result1: "ミニトマト", result2: "パプリカ", result3: "アボカド", result4: "ズッキーニ"))
        resultList.append(ResultModel(result1: "お酢", result2: "砂糖", result3: "醤油", result4: "塩"))
        resultList.append(ResultModel(result1: "牛の血", result2: "牛乳", result3: "羊の肉", result4: "馬の肉"))
        resultList.append(ResultModel(result1: "お経にリズムをつけるため", result2: "亡くなった人が天国にいけるようにと祈るため", result3: "眠くならないようにするため", result4: "悪い霊を寄せ付けないため"))
        resultList.append(ResultModel(result1: "アホーと鳴くから", result2: "人間にすぐつかまるから", result3: "アホみたいな顔をしているから", result4: "阿波踊りみたいに踊っているように飛ぶから"))
        resultList.append(ResultModel(result1: "塩をいれた水で氷を作る", result2: "沸騰したお湯をいれて氷を作る", result3: "砂糖をいれた水で氷を作る", result4: "お酢をいれた水で氷りを作る"))
        resultList.append(ResultModel(result1: "目をパチパチさせる", result2: "爪をかじる", result3: "念入りに手を洗う", result4: "くしゃみをしたあとに、「大魔王」という"))
        resultList.append(ResultModel(result1: "あくび", result2: "おなら", result3: "まばたき", result4: "くしゃみ"))
        resultList.append(ResultModel(result1: "走っている時", result2: "ご飯を食べている時", result3: "眠っている時", result4: "おしっこをしている時"))
        resultList.append(ResultModel(result1: "醤油", result2: "砂糖", result3: "小麦粉", result4: "片栗粉"))
        resultList.append(ResultModel(result1: "血液型", result2: "脳みそ", result3: "心臓", result4: "髪の毛"))
        resultList.append(ResultModel(result1: "風車", result2: "十字架", result3: "ハート", result4: "心臓"))
        resultList.append(ResultModel(result1: "ゆっくりする", result2: "力を込めてする", result3: "力を弱めてする", result4: "早くする"))

    }
    
}
