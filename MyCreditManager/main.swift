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
    print("추가할 학생의 이름을 입력해주세요")
    if let input = readLine() {
        if students.filter({$0.name == input}).isEmpty {
            students.append(Student(name: input))
            print("\(input) 학생을 추가했습니다.")
        }else{
            print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
    }else{
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
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

