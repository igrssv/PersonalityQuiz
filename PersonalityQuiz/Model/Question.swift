//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Игорь Сысоев on 31.08.2021.
//

struct Question {
    let titel: String
    let answer: [Answer]
    let type: ResponseType
    
    static func getQuestions() -> [Question] {
        [
            Question(
                titel: "Какую пищу вы предпочитаете?",
             answer: [
                Answer(titel: "Стейк",animal: .dog),
                Answer(titel: "Молоко",animal: .cat),
                Answer(titel: "Морковь",animal: .rabbit),
                Answer(titel: "Кукурузу",animal: .turtle)
             ],
             type: ResponseType.single),
            Question(
                titel: "Что вам нравится больше?",
             answer: [
                Answer(titel: "Плавать",animal: .dog),
                Answer(titel: "Спать",animal: .cat),
                Answer(titel: "Бегать",animal: .rabbit),
                Answer(titel: "Есть",animal: .turtle)
             ],
                type: ResponseType.multiple),
            Question(
                titel: "Вы любите поездки на машине?",
             answer: [
                Answer(titel: "Ненавижу",animal: .cat),
                Answer(titel: "Не замечаю",animal: .turtle),
                Answer(titel: "Без разницы",animal: .rabbit),
                Answer(titel: "Обожаю",animal: .dog)
             ],
             type: ResponseType.single)
        ]
    }
}


struct Answer {
    let titel: String
    let animal: Animal
}

enum ResponseType {
    case single
    case multiple
    case range
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
      
        case .dog:
            return "Ты пёс"
        case .cat:
            return "Ты киска"
        case .rabbit:
            return "Ты заяц"
        case .turtle:
            return "Ты тормоз"
        }
    }
    
}
