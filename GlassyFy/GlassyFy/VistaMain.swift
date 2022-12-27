//
//  VistaMain.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 23/11/22.
//

import SwiftUI

struct VistaMain: View {
    @EnvironmentObject var vm: ViewModel
    @State var seleccion : Int = 0
    var colorSeleccion: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
    
    var body: some View {
        //InicioView()
        TabView(selection: $seleccion){
            NuevoExperimentoView()
                .tabItem{
                    Image(systemName: "signature")
                    Text("Historial")
                }
                .tag(0)
                .background()

            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)
                        .tag(1)
                        .background(.white)
                        .foregroundColor(.red)
        }
    }
}

struct VistaMain_Previews: PreviewProvider {
    static var previews: some View {
        VistaMain()
    }
}
