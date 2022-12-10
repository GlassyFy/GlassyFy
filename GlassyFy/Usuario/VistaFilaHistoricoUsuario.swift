//
//  VistaFilaHistoricoUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

/*
var colorFondo: Color = Color(red: 48/255, green: 49/255, blue: 54/255)
var colorRect: Color = Color(red: 56/255, green: 57/255, blue: 62/255)
var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)
var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255)  //var colorSeleccion
var colorGreen: Color = Color(red: 90/255, green: 163/255, blue: 100/255)
var colorStroke: Color = Color(red: 101/255, green: 101/255, blue: 101/255)
var colorLabel: Color = Color(red: 150/255, green: 152/255, blue: 157/255)
var colorRojoTxt: Color = Color(red: 199/255, green: 73/255, blue: 69/255) //var colorSalir
var colorRojoBoton: Color = Color(red: 237/255, green: 106/255, blue: 94/255) //var colorBTNSi
*/

struct VistaFilaHistoricoUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity  //¿?
    var experimentoCurrent: ExperimentoEntity
    @State var mostrarConfirmarEliminarExperimento: Bool = false
    @State var cancelar: Bool = true
    @State var eliminar: Bool = false  //para solucionar problema de eliminar
    let fecha1 = DateFormatter()
    //fecha1.dateStyle = .short
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
        //NavigationView {
        HStack {
            HStack{
                NavigationLink (destination: VistaExperimentoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimentoCurrent)) {
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .frame(width: 37, height: 31)
                        .padding(5)  //spacing
                        .background(colorBlue)
                        .cornerRadius(10)
                        .offset(x:10, y:0)
                }
                
                VStack{
                    if (!eliminar) {
                        Text(experimentoCurrent.nombre!)  //Tras eliminar, experimentoCurrent.nombre = nil
                            .font(.custom("Arial", size:20))
                        Text("Fecha Creación: \(fecha1.string(from: experimentoCurrent.fechaCreacion!))")
                            .font(.custom("Arial", size:14))
                    }
                }
                .frame(width:189,  height:40, alignment: .leading)
                .offset(x:5, y:0)
            }
            Spacer()
            Button() {
                mostrarConfirmarEliminarExperimento.toggle()
            } label: {
                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .background(colorFondo)
                    .foregroundColor(colorRojoTxt)
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .offset(x:-10, y:0)
                    .sheet (isPresented: $mostrarConfirmarEliminarExperimento,
                        onDismiss: {
                            if !cancelar {
                                eliminar = true
                                vm.deleteExperimento(experimento: experimentoCurrent )
                                // Hay que hacer algo más porque experimentoCurrent ya no existe
                                //guardarDatos()
                            }
                        }, content: {
                            VistaEliminacionExperimento(experimentoCurrent: experimentoCurrent, cancelar: $cancelar)
                        }
                    )
            }
        } //HStak
        .frame(width:389,  height:40, alignment: .center) // 439x65
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
        .background(colorRect)
        .foregroundColor(.white)
        //} //NavigationView
        //.navigationBarBackButtonHidden(true)
        )
    }
}

/*struct VistaFilaHistoricoUsuario_Previews: PreviewProvider {
      @StateObject private var vm: ViewModel = ViewModel()
      static var previews: some View {
          VistaFilaHistoricoUsuario(experimentoCurrent: vm.experimentosArray[0])
              .environmentObject(vm)   //Falla
       }
}*/
