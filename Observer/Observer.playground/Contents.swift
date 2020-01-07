import Foundation

protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString String: String)
}

protocol PropertyObserver {
    
    func didGet(newTask task: String)
    
}

class Teacher: Subject {
    
//    уникальная коллекция слушателей
    var observerCollection = NSMutableSet()
    var homeTask = "" {
//        didSet вызывается при изменении данной переменной. То есть при изменении домашнего задания у учителя, вызовется уведомление для всех учеников учителя.
        didSet {
            notify(withString: homeTask)
        }
    }
//    Добавить слушателя(ученика)
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
//    Удалить слушателя(ученика)
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
// Уведомление всех учеников учителя об изменении домашнего задания. У каждого ученика изменится переменная homeTask.
    func notify(withString string: String) {
        for observer in observerCollection {
            
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
    
}

class Pupil: NSObject, PropertyObserver {
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("New homework to be done")
    }
    
}

let teacher = Teacher()
let pupil = Pupil()

teacher.add(observer: pupil)
teacher.homeTask = "Задача №7 на странице 7"
print(pupil.homeTask)

