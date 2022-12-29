//
//  VistaEdicionPerfilUsuario.swift
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
var contrariofondotxt: Color = Color(red: 190 / 255, green: 187 / 255, blue: 181 / 255)
*/

struct VistaEdicionPerfilUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity
    @Binding var email: String
    @Binding var telefono: String
    @Binding var descripcion: String
    @Binding var foto: UIImage
    @Binding var cancelar: Bool
    @State var mostrarCambiarFoto: Bool = false
    @Environment(\.presentationMode) var modoPresentacion
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea(.all)
        .overlay(
            VStack {
                HStack { //Navegacion a VistaPerfilUsuario
                    Button() {
                        cancelar = true
                        modoPresentacion.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(colorRojoTxt)
                    }
                    Text(usuarioCurrent.nombre!)
                        .frame(width:303, alignment: .center) //373
                    Button() {
                        cancelar = false
                        modoPresentacion.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(colorGreen)
                    }
                } //HStack Navegacion
                .frame(width:439,  height:37, alignment: .center)
                .background(colorRect)
                .font(.custom("Arial", size:24))

                Image("paisaje")
                    .frame(width:475,  height:193, alignment: .center)
                    //.resizable()
                    //.scaledToFit()

                VStack {
                    HStack { //Cambiar Foto
                        Image(uiImage: foto) //Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                            .resizable()
                            .scaledToFit()
                            .frame(width:234, height:215)
                            .clipShape(Circle())
                        Button() {
                            mostrarCambiarFoto.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .offset(x:25, y:0)
                                .sheet (isPresented: $mostrarCambiarFoto) {
                                    ImagePicker(sourceType: .photoLibrary) {imageSeleccionada in
                                        foto = imageSeleccionada
                                    }
                                }
                        }
                    }
                }
                .frame(width:439, height:215, alignment: .center) //
                .offset(y:-80) //-100
                
                Text(usuarioCurrent.nombre!)
                    .frame(width:439,  height:44, alignment: .center)
                    .font(.custom("Arial", size:36))
                    .offset(y:-70)

                    HStack {  //Cambiar email
                        Image(systemName: "envelope.fill")
                            //.foregroundColor(.white)
                        TextField("Email", text: $email)
                            .foregroundColor(.white)
                            .frame(height: 32, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .frame(width:419,  height:65, alignment: .leading) //439
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    .background(colorRect)
                    //.foregroundColor(.white)
                    .font(.custom("Arial", size:28))
                    .offset(y:-60) //
                    
                    HStack { //Cambiar telefono
                        Image(systemName: "phone.fill")
                            //.foregroundColor(.white)
                        TextField("Tlfno", text: $telefono)
                            .foregroundColor(.white)
                            .frame(height: 32, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .frame(width:419,  height:65, alignment: .leading) //439
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    .background(colorRect)
                    .font(.custom("Arial", size:28))
                    .offset(y:-50)  //-50
                             
                    HStack{
                        Image (systemName: "questionmark.app")
                            .resizable()
                            .frame(width: 43, height: 43)
                            .background(colorRect)
                        Text("  Sobre mí")
                            .font(.custom("Arial", size:32))
                    }
                    .frame(width:419,  height:65, alignment: .leading)
                    .offset(y:-40)  //-40
                
                    HStack{
                        Spacer()
                        Text("\(descripcion.count)/150")
                            .font(.custom("Arial", size:16))
                            .foregroundColor(colorRojoTxt)
                    }
                    .frame(width:409, height:19,  alignment: .trailing)
                    .offset(y:-20)

                    VStack {
                        TextEditor (text: $descripcion)
                            .frame(width:409, alignment: .leading) //439
                            .clipShape(RoundedRectangle(cornerRadius:10))
                            .onChange(of: self.descripcion) {value in
                                if Int(descripcion.count) > 150 {
                                    self.descripcion = String(descripcion.prefix(150))
                                }
                            }
                            .colorMultiply(contrariofondotxt)
                            .foregroundColor(.black)
                            .colorInvert()
                    }
                    .frame(width:409, height:90, alignment:.leading)
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    .background(colorRect)
                    .font(.custom("HelveticaNeue", size:16))
                    .offset(y:-10)
            } //VStack
            .frame(width:475,  height:729, alignment: .center) //475x729
            .background(colorFondo)
            .foregroundColor(.white)
        )
    }
}
