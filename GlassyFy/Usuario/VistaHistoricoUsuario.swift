//
//  VistaHistorico.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
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

struct VistaHistoricoUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity //= usuario
    @State var query: String = ""
    @State var enEdicion: Bool = false
    //@State var eliminar: Bool = false  //para solucionar problema de eliminar
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
            //NavigationView{
                VStack {
                    HStack{
                        //Spacer()
                        Text("Tu histórico")
                            .frame(width:373, alignment: .center)
                            .foregroundColor(.white)
                    }
                    .frame(width:475,  height:37, alignment: .center)
                    .background(colorRect)
                    .font(.custom("Arial", size:24))

                    BusquedaView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
                    //Spacer()
                    List(){
                        ForEach(vm.experimentosArray){experimento in
                            if (query.isEmpty || experimento.nombre!.contains(query)) {
                            //if (!eliminar && (query.isEmpty || experimento.nombre!.contains(query))) {
                                //NavigationLink(destination: VistaExperimentoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimento)){
                                   //VistaFilaHistoricoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimento)
                                //}
                                VistaFilaHistoricoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimento)
                            }  //if
                        } // ForEach
                    }// List
                    //.scrollContentBackground(.hidden)
                    //.background(colorFondo)
                    .colorMultiply(Color(red: 127 / 255, green: 127 / 255, blue: 127 / 255))//.colorMultiply(colorFondo)
                    .frame(width:455,  height:649, alignment: .center)
                }// VStack
                .background(colorFondo)
                .frame(width:455,  height:769, alignment: .top)
                //Spacer()
            
           // } // NavigationView
            //.navigationBarBackButtonHidden(true)
        )
    } // body
}

struct BusquedaView: View {   // Subvista BARRA DE BÚSQUEDA   EJERCICIO 2
    @Binding var text: String
    @EnvironmentObject var vm: ViewModel // No se si esta bien
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
            VStack {
                HStack{
                    Image(systemName: "magnifyingglass.circle")
                        .resizable()
                        .frame(width: 34, height: 33)
                        .foregroundColor(text.isEmpty ? Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
                    TextField("Buscar experimento...", text:$text)
                        .redacted(reason: .placeholder)
                        .font(.custom("Arial", size:24))
                        .multilineTextAlignment(.leading)
                    Button(){
                        text = ""
                    }label:{
                        Image(systemName: "x.circle")
                    }
                    .opacity(text.isEmpty ? 0.0 : 1.0)   // Desaparece o aparece el botón
                } //HStack
                .frame(width: 409, height: 50, alignment:.center)
                .background(colorRect)
                .foregroundColor(.white)
                //.clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                //.shadow(color: colorStroke, radius:2)
            }
            .frame(width:455,  height:50, alignment: .top)
        )
    }
}
