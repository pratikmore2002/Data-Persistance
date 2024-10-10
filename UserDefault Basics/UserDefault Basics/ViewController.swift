//
//  ViewController.swift
//  UserDefault Basics
//
//  Created by Neosoft on 09/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Basic Data tyapes.
        saveBasicTypeData()
        fetchSaveBasicTypesData()
        
        //Array and Dictionary
        saveArrayAndDictionary()
        fetchsaveArrayAndDictionary()
        
        // save object Using PropertyListDecoder
        saveObjectUsingPropertyListEncoder()
        fetchsaveObjectUsingPropertyListDecoder()
        
        //  Using JSONEncoder and JSONDecoder.
        saveObjectUsingJsonEncoder()
        fetchObjectUsingJsonDecoder()
       
    }
    func saveBasicTypeData() {
        let name : String = "Pratik More"
        let number : Int = 8108895625
        let salary : Double = 30000.00
        let age : Float = 22.5
        let married : Bool = false
        
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(number, forKey: "number")
        UserDefaults.standard.set(salary, forKey: "salary")
        UserDefaults.standard.set(age, forKey: "age")
        UserDefaults.standard.set(married, forKey: "married")
    }
    func fetchSaveBasicTypesData() {
        let name = UserDefaults.standard.string(forKey: "name")
        let number = UserDefaults.standard.integer(forKey: "number")
        let salary = UserDefaults.standard.string(forKey: "salary")
        let age = UserDefaults.standard.float(forKey: "age")
        let married = UserDefaults.standard.bool(forKey: "married")
        
        
        print("Name : ",name!)
        print("Number : ",number)
        print("salary : ",salary!)
        print("age : ",age)
        print("married : ",married)
    }
    
    func saveArrayAndDictionary() {
        let arrayData : [Int] = [10,20,30,40,50,60]
        let dictionary1 : [String:Any] = ["name": 22,"age":22,"salary":30000]
        
        UserDefaults.standard.set(arrayData, forKey: "arrayData")
        UserDefaults.standard.set(dictionary1, forKey: "dictionary1")
    }
    
    func fetchsaveArrayAndDictionary() {
        let arrayData = UserDefaults.standard.array(forKey: "arrayData")
        let dictionary1 = UserDefaults.standard.dictionary(forKey: "dictionary1")
        
        print("ArrayData :",arrayData!)
        print("DictionaryData : ",dictionary1 ?? [:])
    }
    
    func saveObjectUsingPropertyListEncoder() {
        let object = Student(name:"pratik",age:23)
        let data = try! PropertyListEncoder().encode(object)
        
        UserDefaults.standard.set(data, forKey: "data")
    }
    func fetchsaveObjectUsingPropertyListDecoder() {
        let data = UserDefaults.standard.value(forKey: "data") as! Data
        print(data)
        
        let object = try! PropertyListDecoder().decode(Student.self, from: data)
        print(object.name)
    }
    
    // JSONDecoder and JSONEncoder Using
        
        func saveObjectUsingJsonEncoder(){
            let object = Student(name: "pratik", age: 84)
            let data = try! JSONEncoder().encode(object)
            UserDefaults.standard.set(data, forKey: "StudentObject")
        }
        func fetchObjectUsingJsonDecoder(){
            let data = UserDefaults.standard.data(forKey: "StudentObject")! as Data
            let object = try! JSONDecoder().decode(Student.self, from: data)
            print(object.name)
        }
        
}

