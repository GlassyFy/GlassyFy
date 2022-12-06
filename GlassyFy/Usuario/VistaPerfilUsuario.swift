//
//  VistaPerfilUsuarioLogueado.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

//var colorFondo: Color = Color(red: 48/255, green: 49/255, blue: 54/255)
//var colorRect: Color = Color(red: 56/255, green: 57/255, blue: 62/255)
//var colorSalir: Color = Color(red: 199/255, green: 73/255, blue: 69/255)
//var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255)
//var colorGreen: Color = Color(red: 90/255, green: 163/255, blue: 100/255)


struct VistaPerfilUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity
    var body: some View {
        
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
        VStack {
            HStack{
                Text("Salir")
                    .frame(width:51)
                    //.font(.system(.size: 12)) // .font(.system(size: 12, weight: .light, design: .serif))
                    .foregroundColor(colorSalir)
                Text(usuarioCurrent.nombre!)
                    .frame(width:373, alignment: .center)
            }
                .frame(width:475,  height:37, alignment: .center)
                .background(colorRect)
                .font(.custom("Arial", size:24))

            Image("paisaje")
                .frame(width:475,  height:193, alignment: .center)
                //.resizable()

            VStack {
                HStack{
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .frame(width: 37, height: 31)
                        .padding(5)  //spacing
                        .background(colorBlue)
                        .cornerRadius(10)
                        .offset(x:-25, y:0)
                    Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                        .frame(width:234, height:215)
                        //.resizable()
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 31, height: 32)
                        .padding(10)
                        .foregroundColor(colorGreen)
                        //.clipShape(RoundedRectangle(cornerRadius: 15))
                    //.stroke(.green, lineWidth:4)
                        .border(colorGreen, width: 4)
                        
                        .cornerRadius(10)
                    .background(colorFondo)
                    //.strokeBorder(colorGreen, lineWidth:3)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(x:25, y:0)
                }
            }
            .frame(width:439, height:215, alignment: .center) //
            .offset(y:-80) //-100
            
            Text(usuarioCurrent.nombre!)
                .frame(width:439,  height:44, alignment: .center)
                .font(.custom("Arial", size:36))
                //.foregroundColor(.white)
                .offset(y:-70)
            Label (usuarioCurrent.email!, systemImage: "envelope.fill")
                .frame(width:419,  height:65, alignment: .leading) //439
                .background(colorRect)
                .font(.custom("Arial", size:28))
                .offset(y:-60)
            Label (usuarioCurrent.telefono!, systemImage: "phone.fill")
                .frame(width:419,  height:65, alignment: .leading)
                .background(colorRect)
                .font(.custom("Arial", size:32))
                .offset(y:-50)
            HStack{
                Image (systemName: "questionmark.app")
                    .resizable()
                    .frame(width: 43, height: 43)
                    .background(colorRect)
                Text("  Sobre mí")
                    .font(.custom("Arial", size:32))
            }
            .frame(width:419,  height:65, alignment: .leading)
            .offset(y:-40)
            /*HStack{
                Image(systemName: "questionmark.app")
                    .padding(.horizontal, -30)
                //Spacer()
                Text("Sobre mí")
                    .font(.title)
            }.offset(y:-10)
            .frame(width:200,  height:50, alignment: .leading )*/
            //Spacer()
            Text (usuarioCurrent.descripcion!)
                .frame(width:419,  alignment: .leading) //height:110,
                .background(colorRect)
                //.foregroundColor(.white)
                //.colorMultiply(Color.gray)
                .font(.custom("HelveticaNeue", size:16))
                .multilineTextAlignment(.leading)
                .padding()
                //.foregroundColor(.white)
                //.overlay(Rectangle().stroke(Color.blue, lineWidth:2))
            Spacer()
        }
        .frame(width:475,  height:729, alignment: .center)
        .background(colorFondo)
        .foregroundColor(.white)
        
        )
    }
}

/*struct VistaPerfilUsuario_Previews: PreviewProvider {
    @EnvironmentObject var vm: ViewModel
    static var previews: some View {
        VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0])
            .environmentObject(ViewModel())
    }
}*/
