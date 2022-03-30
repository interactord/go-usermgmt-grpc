//
//  gRPC_exampleApp.swift
//  gRPC-example
//
//  Created by SANGBONG MOON on 2022/03/29.
//

import SwiftUI

@main
struct gRPC_exampleApp: App {
  let enviroment: Enviroment = .init(mgmtClient: .init(), receiveScheduler: .main)

  var body: some Scene {
      WindowGroup {
        ContentView(intent: .init(enviroment: enviroment))
      }
  }
}
