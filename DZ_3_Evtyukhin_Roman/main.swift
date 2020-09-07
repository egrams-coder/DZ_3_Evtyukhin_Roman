//
//  main.swift
//  DZ_3_Evtyukhin_Roman
//
//  Created by Роман on 06.09.2020.
//  Copyright © 2020 Nebo. All rights reserved.
//
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.


import Foundation

enum HeadlightsOnOff {
    case on
    case off
}

enum WindowOpenClosed {
    case open
    case closed
}

enum MusicOnOff {
    case on
    case off
}

struct Car {
    let brand: String
    let release: Int
    let fullWeight: Int
    let carWeight: Int
    var availableForDownload: Int {
        get {
            return fullWeight - carWeight - cargoWeight
        }
    }
    var cargoWeight: Int
    var headlights: HeadlightsOnOff {
        willSet {
            if newValue == .on {
                print("Пользователь собирается включить фары в \(brand)")
            }
            else {
                print("Пользователь собирается выключить фары в \(brand)")
            }
        }
    }
    var window: WindowOpenClosed {
        willSet {
            if newValue == .open {
                print("Пользователь собирается открыть окна в \(brand)")
            }
            else {
                print("Пользователь собирается закрыть окна в \(brand)")
            }
        }
    }
    var music: MusicOnOff {
        willSet {
            if newValue == .on {
                print("Пользователь собирается включить музыку в \(brand)")
            }
            else {
                print("Пользователь собирается выключить музыку в \(brand)")
            }
        }
    }
    
    func printSportCar() {
        print("Автомобиль:  \(brand)")
        print("Год выпуска: \(release) г.")
        print("Полная снаряженная масса: \(fullWeight) кг.")
        print("Масса автомобиля: \(carWeight) кг.")
        print("Возможная масса для загрузки: \(availableForDownload) кг.")
        print("Загружено: \(cargoWeight) кг.")
        switch headlights {
        case .on:
            print("Фары в \(brand): \(headlights)")
        case .off:
        print("Фары в \(brand): \(headlights)")
        }
        switch window {
        case .open:
            print("Окна в \(brand): \(window)")
        case .closed:
        print("Окна в \(brand): \(window)")
        }
        switch music {
        case .on:
            print("Музыка в \(brand): \(music)")
        case .off:
        print("Музыка в \(brand): \(music)")
        }
    }

}

var car = Car (brand: "Opel", release: 2007, fullWeight: 2100, carWeight: 1100, cargoWeight: 400, headlights: .off, window: .closed, music: .off)

struct Truck {
    let brand: String
    let release: Int
    let fullWeight: Int
    let carWeight: Int
    var availableForDownload: Int {
        get {
            return fullWeight - carWeight - cargoWeight
        }
    }
    var cargoWeight: Int
    var headlights: HeadlightsOnOff {
        willSet {
            if newValue == .on {
                print("Пользователь собирается включить фары в \(brand)")
            }
            else {
                print("Пользователь собирается выключить фары в \(brand)")
            }
        }
    }
    var window: WindowOpenClosed {
        willSet {
            if newValue == .open {
                print("Пользователь собирается открыть окна в \(brand)")
            }
            else {
                print("Пользователь собирается закрыть окна в \(brand)")
            }
        }
    }
    var music: MusicOnOff {
        willSet {
            if newValue == .on {
                print("Пользователь собирается включить музыку в \(brand)")
            }
            else {
                print("Пользователь собирается выключить музыку в \(brand)")
            }
        }
    }
    mutating func musicCustom (music custom: MusicOnOff) {
        self.music = .on
    }
    
    func printTruck() {
        print("Автомобиль:  \(brand)")
        print("Год выпуска: \(release) г.")
        print("Полная снаряженная масса: \(fullWeight) кг.")
        print("Масса автомобиля: \(carWeight) кг.")
        print("Возможная масса для загрузки: \(availableForDownload) кг.")
        print("Загружено: \(cargoWeight) кг.")
        switch headlights {
        case .on:
            print("Фары в \(brand): \(headlights)")
        case .off:
        print("Фары в \(brand): \(headlights)")
        }
        switch window {
        case .open:
            print("Окна в \(brand): \(window)")
        case .closed:
        print("Окна в \(brand): \(window)")
        }
        switch music {
        case .on:
            print("Музыка в \(brand): \(music)")
        case .off:
        print("Музыка в \(brand): \(music)")
        }
    }

}

var truck = Truck (brand: "Gazon", release: 1967, fullWeight: 10200, carWeight: 5000, cargoWeight: 4000, headlights: .on, window: .open, music: .on)


print("Заводские настройки - \(car.brand)")
print("---------------------------------")
car.printSportCar()
print("")
print("Пользовательские настройки - \(car.brand)")
print("---------------------------------")
car.headlights = .on
print("Фары в \(car.brand) - \(car.headlights)")
car.window = .open
print("Окна в \(car.brand) - \(car.window)")
car.music = .on
print("Музыка в \(car.brand) - \(car.music)")
print("")

print("Заводские настройки - \(truck.brand)")
print("---------------------------------")
truck.printTruck()
print("")
print("Пользовательские настройки - \(truck.brand)")
print("---------------------------------")
truck.headlights = .off
print("Фары в \(truck.brand) - \(truck.headlights)")
truck.window = .closed
print("Окна в \(truck.brand) - \(truck.window)")
truck.musicCustom(music: .on)
print("Музыка в \(truck.brand) - \(truck.music)")
print("")









