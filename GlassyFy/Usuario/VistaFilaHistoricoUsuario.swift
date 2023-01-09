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
var contrariofondotxt: Color = Color(red: 190 / 255, green: 187 / 255, blue: 181 / 255)
*/

struct VistaFilaHistoricoUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity  //¿?
    var experimentoCurrent: ExperimentoEntity
    var body: some View {
        GeometryReader{ gemr in
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
                
                    HStack {
                        NavigationLink (destination: VistaExperimentoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimentoCurrent)) {
                                Image(systemName: "books.vertical.fill")
                                    .resizable()
                                    .frame(width: 31, height: 31)
                                    .padding(5)  //spacing
                                    .background(colorBlue)
                                    .cornerRadius(5)
                                    //.offset(y:0)
                            
                            VStack{
                                HStack{
                                    if (experimentoCurrent.nombre != nil) {
                                        Text(experimentoCurrent.nombre!)  //Tras eliminar, experimentoCurrent.nombre = nil
                                            .font(.custom("Arial", size:20))
                                            .padding(.leading, 5)
                                        Spacer()
                                }
                                }
                                HStack{
                                    Spacer()
                                    Text("Creado el  \(experimentoCurrent.fechaCreacion!.formatted(.dateTime.day().month().year()))")
                                        .font(.custom("Arial", size:14))
                                        //.offset(y:10)
                                }
                                    
                            }
                            .frame(alignment: .leading)
                    } //HStak
                    //.frame(width: gemr.size.width, height: 40,alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
                    .background(colorRect)
                    .foregroundColor(.white)
                }.frame(width: gemr.size.width, height: 40,alignment: .leading)
                    
                
            
            //.frame(width:389,  height:40, alignment: .leading)// alignment: .center) //389 // 439x65

            )
        }
    }
}
