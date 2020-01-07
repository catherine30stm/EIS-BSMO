import UIKit
//протокол состояния и  его описание
protocol State {
  var description: String { get }

  func setTask(_ task: Task)

  func startProgress()
  func startTesting()
  func close()
  func open()
}
// наследуемый класс, от final нельзя наследоваться
final class OpenState: State {
    //создание текущей даты
  let description = "Opened at \(Date()) "
  private var task: Task?
//пустой инициализатор, чтобы просто создать экземпляр
  init() {}
//установление текущей задачи
  func setTask(_ task: Task) {
    self.task = task
  }

  func startProgress() { task?.setState(InProgressState()) } //если состояние открыто, то можно изменить его на InProgress, в открытом состоянии тестировать нельзя
  func startTesting() { print("--- Needs to start progress.")}
  func close() { task?.setState(CloseState()) }//
  func open() { print("--- Already opened. Do nothing.")}
}

final class InProgressState: State {
  let description = "In progress: \(Date()) "
  private var task: Task? //переменную необязательно инициализировать

  init() {}
//task инициализируется тем значением, которое потом передадут
  func setTask(_ task: Task) {
    self.task = task
  }

  func startProgress() { print("--- Already in progress.") }
  func startTesting() { task?.setState(InTestingState()) } //изменение состояния на InTesting
  func close() { print("--- Needs to be tested first.") }
  func open() { task?.setState(OpenState()) }
}

final class InTestingState: State {
  let description = "Testing: \(Date()) "
  private var task: Task?

  init() {}

  func setTask(_ task: Task) {
    self.task = task
  }

  func startProgress() { task?.setState(InProgressState()) }
  func startTesting() { print("--- Already in testing.") }
  func close() { task?.setState(CloseState()) }
  func open() { print("--- Needs to be closed first.") }
}

final class CloseState: State {
  let description = "Closed at \(Date()) "
  private var task: Task?

  init() {}

  func setTask(_ task: Task) {
    self.task = task
  }

  func startProgress() { task?.setState(InProgressState()) }
  func startTesting() { print("--- Needs to be opened first.") }
  func close() { print("--- Already closed.") }
  func open() { task?.setState(OpenState()) }
}

class Task {
  var history = "\n Task history:\n"
  private var state: State

  init() {
    //задача ставится в открытое состояние
    state = OpenState()
    state.setTask(self) // текущая задача
    history += state.description //добавить описание
    print("--- \(state.description)")
  }
//ф-я для изменения состояния, задачи, описания
  func setState(_ state: State) {
    self.state = state
    state.setTask(self)
    history += state.description
    print("--- \(state.description)")
  }

  func startProgress() { state.startProgress() }
  func startTesting()  { state.startTesting() }
  func close()         { state.close() }
  func open()          { state.open() }
}

let task = Task()
task.startProgress()
task.startTesting()
task.open()
task.close()
task.startTesting()
task.startProgress()

print(task.history)
