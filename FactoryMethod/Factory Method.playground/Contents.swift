//интерфейс транспортного средства
protocol Vehicle {
    
    func drive()
}
//машина - наследник
class Car: Vehicle {
    
    func drive() {
        print("drive a car")
    }
}
//трейлер - наследник
class Truck: Vehicle {
    
    func drive() {
        print("drive a truck")
    }
}
// автобус - наследник
class Bus: Vehicle {
    
    func drive() {
        print("drive a bus")
    }
}

protocol VehicleFactory {
    //возвращает транспортное средство (либо трейлер, либо машину, либо автобус)
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        print("car is created")
        //возвращаю экземпляр класса Car
        return Car()
    }
}

class TruckFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        print("truck is created")
        return Truck()
    }
}

class BusFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        print("bus is created")
        return Bus()
    }
}

let carFactory = CarFactory()
let car = carFactory.produce()

let truckFactory = TruckFactory()
let truck = truckFactory.produce()

let busFactory = BusFactory()
let bus = busFactory.produce()

car.drive()
truck.drive()
