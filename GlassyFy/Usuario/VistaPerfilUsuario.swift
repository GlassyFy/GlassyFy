//
//  VistaPerfilUsuarioLogueado.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaPerfilUsuario: View {
    @State var textoOpinion = "texto"
    var body: some View {
        VStack {
            HStack{
                Text("Salir")
                    .font(.headline)
                    .foregroundColor(.red)
                Text("Nombre Usuario")
                    //.font(.title)
                    .foregroundColor(.white)
            }
            Image("paisaje")
            VStack {
                HStack{
                    Image(systemName: "books.vertical")
                        .background(.blue)
                        .offset(x:-25, y:0)
                    Image("foto")
                    Image(systemName: "pencil")
                        .foregroundColor(.green)
                        .offset(x:25, y:0)
                }
            }.offset(y:-50)
            
            Text("Nombre Usuario")
                .font(.title)
                .foregroundColor(.white)
                .offset(y:-40)
                
            HStack{
                Image(systemName: "envelope")
                    .foregroundColor(.white)
                    .padding(.horizontal, -30)
                Text("Correo@dominio.com")
                    .font(.title)
                    .foregroundColor(.white)
            }.offset(y:-30)
            .frame(width:200,  height:50, alignment: .leading )
            HStack{
                Image(systemName: "phone")
                    .padding(.horizontal, -30)
                    //.foregroundColor(.white)
                Text("+34 123 456 789")
                    .font(.title)
            }
            .offset(y:-20)
            .frame(width:200,  height:50, alignment: .leading )
            HStack{
                Image(systemName: "questionmark.app")
                    .padding(.horizontal, -30)
                //Spacer()
                Text("Sobre mí")
                    .font(.title)
            }.offset(y:-10)
            .frame(width:200,  height:50, alignment: .leading )
            
            Spacer()
            TextEditor (text: $textoOpinion)
                .frame(width:400,  height:200, alignment: .leading)
                .foregroundColor(.white)
                .colorMultiply(Color.gray)
                .font(.custom("HelveticaNeue", size:15))
                .foregroundColor(.white)
                .overlay(Rectangle().stroke(Color.blue, lineWidth:2))
        }
        .background(.gray)
        .frame(width:400,  height:200, alignment: .center )
        .foregroundColor(.white)
    }
}

struct VistaPerfilUsuario_Previews: PreviewProvider {
    static var previews: some View {
        VistaPerfilUsuario()
    }
}
