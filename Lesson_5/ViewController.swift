//
//  ViewController.swift
//  Lesson_5
//
//  Created by Evgeniy Nosko on 2.08.21.
//


//    СТРУКТУРА очень похожа на КЛАСС!!
//    ГЛАВНЫЕ ОТЛИЧИЯ ОТ КЛАССА:
//    1) Ее нельзя наследовать, и она не может ничего наследовать
//    2) Структура это тип - значение, а класс - ссылочный тип

//    СИНГЛТОН - может существовать только 1 объект (одна ссылка на объект)


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed() {
//       5) Singleton
        Hospital.shared.patients.append(Patient(diagnoz: "grip", age: 100))

        
        
//        4) Struct
//        let humanClassObject = Human (age: 12)
//        let humanClassObject2 = humanClassObject
//
//        humanClassObject2.age = 15
//        print("class 1", humanClassObject.age)
//        print("class 2", humanClassObject2.age)
//
//
//        let humanStructObject = HumanStruct (age: 12)
//        var humanStructObject2 = humanStructObject
//
//        humanStructObject2.age = 15
//        print("struct 1", humanStructObject.age)
//        print("struct 2", humanStructObject2.age)
        
        
//       3) init, deinit
//       let patient = Patient (diagnoz: "orvi", age: 10)
        
        
//       2) цвет меняется на рандомный
//        let randomColor = UIColor (
//            red: CGFloat(Double.random(in: 0...1)),
//            green: CGFloat(Double.random(in: 0...1)),
//            blue: CGFloat(Double.random(in: 0...1)),
//            alpha: 1
//        )
//        imageView.backgroundColor = randomColor
        
        
        //       1) цвет меняется с одного на другой по нажатию на кнопку
        //        var color: UIColor = .black
        //
        //        if color == UIColor.black {
        //            color = .gray
        //        } else {
        //            color = .black
        //        }
        //        imageView.backgroundColor = color
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Zhenya"
        
        //        выбор цвета с помощью RGB
        imageView.backgroundColor = UIColor.init(
            red: 142/255,
            green: 191/255,
            blue: 156/255,
            alpha: 1
        )
        //        выбор дефотного цвета
        //        imageView.backgroundColor = .blue
        
        button.setTitle("Change color", for: .normal)
        button.setTitle("Change color1", for: .highlighted)
        
    }
}



// СОЗДАНИЕ КЛАССА - СИНГЛТОН (Singleton)
// СИНГЛТОН - может существовать только 1 объект (одна ссылка на объект)
class Hospital {
    var patients: [Patient]
    
    static let shared: Hospital = Hospital()
    
//    private init - инициализатор доступен ТОЛЬКО ВНУТРИ КЛАССА!
    private init() {
        self.patients = []
    }
}





//СОЗДАНИЕ СТРУКТУРЫ (Struct)
struct HumanStruct {
    var age: Int
    init(age: Int) {
        self.age = age
    }
}


 
//СОЗДАНИЕ КЛАССА (Class)

//  Humam -  является суперклассом класса -  Patient
class Human {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}


//  Класс - Patient - наследник, который наследуется от суперкласса - Human
class Patient:  Human {
    
    var diagnoz: String
    //    var age: Int = 123
    
    //    init -   Создание объекта
    //    В init - инициализаторе указываются все переменные класса, которые НЕ ИМЕЮТ НАЧАЛЬНОГО ЗНАЧЕНИЯ!
    //    В КЛАССЕ НАСЛЕДНИКЕ ОБЯЗАТЕЛЬНО ИНИЦИАЛИЗАЦИЯ - super.init - от СУПЕРКЛАССА!
    init(diagnoz: String, age: Int) {
        //        self - Ссылка на САМОГО СЕБЯ
        self.diagnoz = diagnoz
        super.init(age: age)
        
        self.printInfo()
    }
        //   self.age = age  - не обязательно, так как есть начальное значение
        //        self.age = age
        //      super -  Вызывается тогда, когда берем свойство или функцию от СУПЕРКЛАССА!
    
    func printInfo() {
        print(self.diagnoz)
        print(self.age)
    }
    
//    deinit -  Вызывается, когда заканчивается время жизни объекта
//      Вызывать НЕ обязательно
    deinit {
        self.age = 0
        self.diagnoz = "Not Found"
        
        self.printInfo()
    }
}





