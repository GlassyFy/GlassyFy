//
//  GlassyFyApp.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import SwiftUI

@main
struct GlassyFyApp: App {
    @StateObject private var vm: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            //VistaEliminacionExperimento (experimentoCurrent: vm.experimentosArray[1])
            //VistaPerfilUsuario()
           // Historico(experimento: vm.experimentosArray[0])
            Vistadetalle()
               // .environmentObject(vm)
        }
    }
}
