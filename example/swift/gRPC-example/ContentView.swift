//
//  ContentView.swift
//  gRPC-example
//
//  Created by SANGBONG MOON on 2022/03/29.
//

import SwiftUI

struct ContentView {
  @ObservedObject var intent: Intent
}

extension ContentView: View {
  var body: some View {
    VStack {
      Text("Hello, world!")
          .padding()
      Button("Create User") {
        intent.send(action: .createNewUser)
      }

      Button("Get Users") {
        intent.send(action: .createNewUser)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(intent: .init(enviroment: .init(mgmtClient: .init(), receiveScheduler: .main)))
    }
}

