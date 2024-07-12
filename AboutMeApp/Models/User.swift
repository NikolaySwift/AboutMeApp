//
//  User.swift
//  AboutMeApp
//
//  Created by NikolayD on 10.07.2024.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "User",
            password: "1234",
            person: Person(
                name: "Николай",
                surname: "Дворников",
                age: 38,
                hometown: "Москва",
                photo: "myPhoto",
                details: [
                    Detail(
                        title: "Навыки",
                        description: """
                        Имею опыт разработки на Java в связке с Oracle EJB, \
                        написания скриптов на bash и sql запросов. \
                        Работал с сервером приложений Oracle Weblogic и сервером БД Oracle DB.
                        """
                    ),
                    Detail(
                        title: "Хобби",
                        description: """
                        Сейчас мое хобби - это изучение японского языка. \
                        До этого увлекался дайвингом и исторической реконструкцией.
                        """
                    )
                ]
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let hometown: String
    let photo: String?
    let details: [Detail]
}

struct Detail {
    let title: String
    let description: String
}
