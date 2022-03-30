import Foundation
import Combine

final class Intent: ObservableObject {
  @Published var state: Model.State = .init(usermgmtUsersList: .init())

  let enviroment: Enviroment
  var cancelable: Set<AnyCancellable> = []

  init(enviroment: Enviroment) {
    self.enviroment = enviroment
  }

  func send(action: Model.ViewAction) {
    switch action {
    case .createNewUser:
      var request = Usermgmt_NewUser()
      request.name = "Alice"
      request.age = 38

      enviroment.mgmtClient
        .creatUser(requst: request)
        .receive(on: enviroment.receiveScheduler )
        .sink(receiveCompletion: {result in
          switch result {
            case let .failure(error):
            print(error)
          default:
            break
          }
        }, receiveValue: { user in
          print(user)
        })
        .store(in: &cancelable)

    case .getUsers:
      enviroment.mgmtClient
        .getUsers()
        .receive(on: enviroment.receiveScheduler )
        .sink(receiveCompletion: {result in
          switch result {
            case let .failure(error):
            print(error)
          default:
            break
          }
        }, receiveValue: { user in
          print(user)
        })
        .store(in: &cancelable)
    }
  }
}

enum Model {
  struct State {
    var usermgmtUsersList: Usermgmt_UsersList
  }

  enum ViewAction {
    case createNewUser
    case getUsers
  }
}




