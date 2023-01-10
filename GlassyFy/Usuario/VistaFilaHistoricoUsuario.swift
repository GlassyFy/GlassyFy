//
//  VistaFilaHistoricoUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI



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
                }.frame(/*width: gemr.size.width,*/height: 40,alignment: .leading)
                    
                
            
            //.frame(width:389,  height:40, alignment: .leading)// alignment: .center) //389 // 439x65

            )
        }
    }
}
