//
//  GlassyFyApp.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import SwiftUI

var colorFondo: Color = Color(red: 48/255, green: 49/255, blue: 54/255)
var colorRect: Color = Color(red: 56/255, green: 57/255, blue: 62/255)
var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)
var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255)  //var colorSeleccion
var colorGreen: Color = Color(red: 90/255, green: 163/255, blue: 100/255)
var colorStroke: Color = Color(red: 101/255, green: 101/255, blue: 101/255)
var colorLabel: Color = Color(red: 150/255, green: 152/255, blue: 157/255)
var colorRojoTxt: Color = Color(red: 199/255, green: 73/255, blue: 69/255) //var colorSalir
var colorRojoBoton: Color = Color(red: 237/255, green: 106/255, blue: 94/255) //var colorBTNSi

@main

struct GlassyFyApp: App {
    @StateObject private var vm: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            VistaMain()
            //VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: UIImage(data: vm.usuariosArray[0].foto!)!.foto!)!)
            //VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)
            //VistaEdicionPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], email: "x", telefono: "y", descripcion: "z", cancelar: true, foto: UIImage(data: vm.usuariosArray[0].foto!)!);
            //VistaEdicionPerfilUsuario(usuarioCurrent: vm.usuariosArray[0])
            //VistaHistoricoUsuario(usuarioCurrent: vm.usuariosArray[0])
            //VistaBusquedaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0])
            //VistaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: vm.experimentosArray[0])
            //VistaFilaHistoricoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: vm.experimentosArray[0])
            //VistaFilaHistoricoUsuario(experimentoCurrent: vm.experimentosArray[3])
            //VistaEliminacionExperimento (experimentoCurrent: vm.experimentosArray[3])
            //VistaPerfilUsuario()
                .environmentObject(vm)
        }
    }
}
