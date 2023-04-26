//
//  main.swift
//  MyCreditManager
//
//  Created by 윤소희 on 2023/04/26.
//

import Foundation

var continueProgram: Bool = true

struct Student {
    var name: String
    var subject: [String : String]?
}

var students = [Student]()

func getGrade(grade: String?) -> Double {
    return 0
}

func addStudent() {
    
}

func removeStudent() {
    
}

func updateGrade() {
    
}

func removeGrade() {
    
}

func showAverage() {
    
}

while continueProgram {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X:종료")
    
    let input = readLine()!
    
    switch input {
    case "1":
        addStudent()
    case "2":
        removeStudent()
    case "3":
        updateGrade()
    case "4":
        removeGrade()
    case "5":
        showAverage()
    case "X":
        continueProgram = false
    default:
        break
    }
    
}

