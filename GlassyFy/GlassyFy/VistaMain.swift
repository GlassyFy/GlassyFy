//
//  VistaMain.swift
//  GlassyFy
//
//  Created by Aula11 10/12/22.
//
import SwiftUI

struct VistaMain: View {
    @EnvironmentObject var vm: ViewModel
    @State var seleccion : Int = 0
    var colorSeleccion: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
    
    var body: some View {
        TabView(selection: $seleccion){
            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)//Historico()
            .tabItem{
                Image(systemName: "list.bullet.rectangle")
                Text("Historial")
            }
            .tag(0)
            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)//NuevoExperimentoView()
            .tabItem{
                Image(systemName: "calendar.badge.plus") //"signature")
                Text("Nuevo experimento")
            }
            .tag(1)
            .background(.white)
            .foregroundColor(.red)
            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)//Usuarios()
            .tabItem{
                Image(systemName: "person.3")
                Text("Usuarios")
            }
            .tag(2)
            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)
            .tabItem{
                Image(systemName: "person.circle")
                Text("Perfil Usuario")
            }
            .tag(3)
        }
        .colorMultiply(Color(red: 127 / 255, green: 127 / 255, blue: 127 / 255))
    }
}

struct VistaMain_Previews: PreviewProvider {
    static var previews: some View {
        VistaMain()
    }
}
