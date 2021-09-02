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
                type: ResponseType.range)
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
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
    
}
