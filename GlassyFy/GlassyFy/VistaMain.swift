//
//  VistaMain.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 23/11/22.
//

import SwiftUI

var tabcolor = Color(red: 120/255, green: 57/255, blue: 62/255)

struct VistaMain: View {
    @EnvironmentObject var vm: ViewModel
    @State var seleccion : Int = 0
    
    var colorSeleccion: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
    
    init(){
        UITabBar.appearance().barTintColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 0)
        UITabBar.appearance().backgroundColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 1)
    }
    
    var body: some View {
        //InicioView()
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
        TabView(selection: $seleccion){
            NuevoExperimentoView()
                .tabItem{
                    Label("Nuevo exp", systemImage: "list.bullet.rectangle.portrait")//.background( frame(width: 30, height: 30))
                }
                .tag(0)
            NuevoExperimentoView()
                .tabItem{
                    Label("Nuevo exp", systemImage: "list.bullet.rectangle.portrait")
                }
                .tag(1)
            NuevoExperimentoView()
                .tabItem{
                    Label("Nuevo exp", systemImage: "list.bullet.rectangle.portrait")
                }
                .tag(2)

            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!).environmentObject(ViewModel())
                .tabItem{
                    Label("Perfil", systemImage: "person.circle.fill")
                }
                .tag(4)
        }
        )
    }
}

struct VistaMain_Previews: PreviewProvider {
    static var previews: some View {
        VistaMain()
    }
}
