import Foundation
import GRPC
import NIOCore
import NIOPosix
import ArgumentParser
import NIOHPACK
import NIOHTTP1
import Combine

struct UserMgmtManager {
}

extension UserMgmtManager: UserMgmtProvider {

  func creatUser(requst: Usermgmt_NewUser) -> AnyPublisher<Usermgmt_User, Error> {
    do {
      let channel = try getDefaultChannel()
      let client = Usermgmt_UserManagementClient(channel: channel)
      return sendRequst {
        client.createNewUser(requst, callOptions: $0)
      }
    } catch {
      return Fail(error: error).eraseToAnyPublisher()
    }

  }

  func getUsers() -> AnyPublisher<Usermgmt_UsersList, Error> {
    do {
      let channel = try getDefaultChannel()
      let client = Usermgmt_UserManagementClient(channel: channel)
      return sendRequst {
        client.getUsers(.init(), callOptions: $0)
      }
    } catch {
      return Fail(error: error).eraseToAnyPublisher()
    }
  }

}

extension UserMgmtManager: UserMgmtClientBuilder {
  func makeClient() throws -> Usermgmt_UserManagementClient {
    return .init(channel: try getDefaultChannel())
  }
}


