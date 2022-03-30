import Foundation
import GRPC
import NIOCore
import NIOPosix
import ArgumentParser
import NIOHPACK
import NIOHTTP1
import Combine

protocol UserMgmtProvider {
  func creatUser(requst: Usermgmt_NewUser) -> AnyPublisher<Usermgmt_User, Error>
  func getUsers() -> AnyPublisher<Usermgmt_UsersList, Error>
}

extension UserMgmtProvider {
  private var headers: HPACKHeaders {
    .init(httpHeaders: [
      "user-agent": "grpc; example-app; version1.0;",
    ])
  }


  private var timeout: TimeLimit {
    .timeout(.seconds(30))
  }

  func sendRequst<T, R>(call: @escaping (CallOptions) -> UnaryCall<T, R>) -> AnyPublisher<R, Error> {
    Future<R, Error> { promise in
      let options = CallOptions.init(customMetadata: headers, timeLimit: timeout)
      let call = call(options)
      call.response.whenComplete { promise($0) }

    }
    .eraseToAnyPublisher()
  }
}

protocol UserMgmtClientBuilder {
  associatedtype ClientType

  func makeClient() throws -> ClientType
}

extension UserMgmtClientBuilder {
  func getDefaultChannel() throws -> GRPCChannel {
    try GRPCChannelPool.with(
      target: .hostAndPort("localhost", 50051),
      transportSecurity: .plaintext,
      eventLoopGroup: MultiThreadedEventLoopGroup(numberOfThreads: 1))
  }
}
