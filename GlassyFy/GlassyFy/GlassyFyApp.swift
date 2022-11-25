//
//  GlassyFyApp.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import SwiftUI

@main
struct GlassyFyApp: App {
    //@StateObject private var vm: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            HistoricoSeleccionadoView()
             //   .environmentObject(vm)
        }
    }
}
