//
//  MainContentView.swift
//  PlaygroundApp
//
//  Created by Mekhala Vithala on 11/25/20.
//  Copyright © 2020 playground. All rights reserved.
//

import SwiftUI

struct MainContentView: View {
    @AppStorage("log_Status") var logInStatus = false
    var body: some View {
        ZStack {
        if logInStatus {
            UserView()
        } else {
            LoginView()
        }
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
