
protocol SwimBehavior {
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    
    func swim() {
        print("professional swimming")
    }
}

class NonSwimmer: SwimBehavior {
   
    func swim() {
        print("non swimming")
    }
}

protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    
    func dive() {
        print("professional diving")
    }
}

class NewbieDiver: DiveBehavior {
    
    func dive() {
        print("newbie diving")
    }
}

class NonDiver: DiveBehavior {
    
    func dive() {
        print("non-diving")
    }
}

class Human {
//    Создаем две переменные типа интерфейсов поведения. Интерфейса DiveBehavior и SwimBehavior. Это нужно, чтобы при инициализации класса принимать на вход любые объекты, которые наследуются от данных интерфейсов.
   private var diveBehavior: DiveBehavior!
   private var swimBehavior: SwimBehavior!
    
//    Функция для вызова метода интерфейса. Реализация метода зависит от принятного объекта на вход.
    func performSwim() {
        
        swimBehavior.swim()
    }
//    Функция для вызова метода интерфейса. Реализация метода зависит от принятного объекта на вход.
    func performDive() {
        
        diveBehavior.dive()
    }
    
//    Функция для изменения поведения.
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
//    Функция для изменения поведения.
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    func run() {
        
        print("running")
    }
//    Инициализатор класса.
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
    
}

let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: ProfessionalDiver())
//human.setDiveBehavior(db: ProfessionalDiver())
human.performDive()

//human.setSwimBehavior(sb: NonSwimmer())
human.performSwim()

human.setDiveBehavior(db: NewbieDiver())
human.performDive()

