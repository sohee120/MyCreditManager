//
//  main.swift
//  MyCreditManager
//
//  Created by 윤소희 on 2023/04/26.
//

import Foundation

var continueProgram: Bool = true

struct Student: Equatable {
    var name: String
    var subject: [String : String]?
}

var students = [Student]()

func getGrade(grade: String?) -> Double {
    switch grade {
        case "A+":
            return 4.5
        case "A":
            return 4.0
        case "B+":
            return 3.5
        case "B":
            return 3.0
        case "C+":
            return 2.5
        case "C":
            return 2.0
        case "D+":
            return 1.5
        case "D":
            return 1.0
        case "F":
            return 0
        default:
            break
        }
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
    print("삭제할 학생의 이름을 입력해주세요")
    if let input = readLine() {
        if students.filter({$0.name == input}).isEmpty {
            print("\(input) 학생을 찾지 못했습니다.")
        }else{
            if let idx = students.firstIndex(of:Student(name: input)) {
                students.remove(at: idx)
                print("\(input) 학생을 삭제하였습니다.")
            }
        }
    }else{
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func updateGrade() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    if let input = readLine()?.components(separatedBy: " "), input.count == 3 {
        
        let name = input[0]
        let subject = input[1]
        let grade = input[2]
        
        guard students.filter({$0.name == name}).count != 0 else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        
        guard let studentIdx = students.firstIndex(where:{$0.name == name}) else { return }
        
        guard students[studentIdx].subject != nil else{
            students[studentIdx].subject = [:]
            students[studentIdx].subject?.updateValue(grade, forKey: subject)
            print("\(name) 학생의 \(subject)과목이 \(grade)로 추가(변경)되었습니다.")
            return
        }
        students[studentIdx].subject?.updateValue(grade, forKey: subject)
        print("\(name) 학생의 \(subject)과목이 \(grade)로 추가(변경)되었습니다.")
    }else{
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func removeGrade() {
    print("삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
    if let input = readLine()?.components(separatedBy: " "), input.count == 2 {
        
        let name = input[0]
        let subject = input[1]
        
        if students.filter({$0.name == input[0]}).isEmpty {
            print("\(name) 학생을 찾지 못했습니다.")
        }
        
        if let studentIdx = students.firstIndex(where:{$0.name == name}) {
            guard students[studentIdx].subject == nil else{
                students[studentIdx].subject?[subject] = nil
                print("\(name) 학생의 \(subject)과목이 삭제되었습니다.")
                return
            }
        }
    }else{
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func showAverage() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        if let input = readLine() {
            if let studentIdx = students.firstIndex(where:{$0.name == input}) {
                var average = 0.0
                var count = 0.0
                students[studentIdx].subject?.forEach({
                    print("\($0.key): \($0.value)")
                    average += getGrade(grade: $0.value)
                    count += 1.0
                })
                print("평점 : \(String(format: "%.2f", average / count))")
            }
        }else{
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }

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
        print("프로그램을 종료합니다...")
        continueProgram = false
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        break
    }
}

