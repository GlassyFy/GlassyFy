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
            //VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0])
            //VistaEdicionPerfilUsuario(usuarioCurrent: vm.usuariosArray[0])
            //VistaHistoricoUsuario(usuarioCurrent: vm.usuariosArray[0])
            //VistaBusquedaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0])
            //VistaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: vm.experimentosArray[0])
            //VistaFilaHistoricoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: vm.experimentosArray[0])
            VistaEliminacionExperimento (experimentoCurrent: vm.experimentosArray[0])
            //VistaPerfilUsuario()
                .environmentObject(vm)
        }
    }
}
