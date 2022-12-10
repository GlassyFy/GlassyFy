//
//  VistaPerfilUsuarioLogueado.swift
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

struct VistaPerfilUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity
    @State var email: String = ""
    @State var telefono: String = ""
    @State var descripcion: String = ""
    @State var foto: UIImage //= UIImage(data: usuarioCurrent.foto!)!
    @State var mostrarEdicion: Bool = false
    @State var cancelar: Bool = true
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
            NavigationView(){
                VStack { //Todo
                    HStack{
                        Text("Salir")
                            .frame(width:51)
                            .font(.custom("Arial", size:24))
                            .foregroundColor(colorRojoTxt)
                        Text(usuarioCurrent.nombre!)
                            .frame(width:373, alignment: .center)
                    }
                        .frame(width:475,  height:37, alignment: .center)
                        .background(colorRect)
                        .font(.custom("Arial", size:24))

                    Image("paisaje")
                        .frame(width:475,  height:193, alignment: .center)
                        //.resizable()
                        .scaledToFit()

                    VStack {  //Foto y enlaces
                        HStack{
                            NavigationLink(destination:VistaHistoricoUsuario(usuarioCurrent: usuarioCurrent)){
                                Image(systemName: "books.vertical.fill")
                                    .resizable()
                                    .frame(width: 37, height: 31)
                                    .padding(5)
                                    .background(colorBlue)
                                    .cornerRadius(10)
                                    .offset(x:-25, y:0)
                            }
                            Image(uiImage: foto) //Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                                .resizable()
                                .scaledToFit()
                                .frame(width:234, height:215)
                                .clipShape(Circle())
                                //.overlay(Circle())
                                
                            Button() {
                                mostrarEdicion.toggle()
                                email = usuarioCurrent.email!
                                telefono = usuarioCurrent.telefono!
                                descripcion = usuarioCurrent.descripcion!
                                foto = UIImage(data: usuarioCurrent.foto!)!
                            } label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 31, height: 32)
                                    .padding(10)
                                    .foregroundColor(colorGreen)
                                    .border(colorGreen, width: 3) //
                                    .cornerRadius(10) //
                                    .offset(x:25, y:0)
                                    .sheet (isPresented: $mostrarEdicion,
                                        onDismiss: {
                                            if !cancelar {
                                                usuarioCurrent.email = email
                                                usuarioCurrent.telefono = telefono
                                                usuarioCurrent.descripcion = descripcion
                                                usuarioCurrent.foto = foto.pngData()
                                                vm.guardarDatos()
                                            }
                                        }, content: {
                                            VistaEdicionPerfilUsuario(usuarioCurrent: usuarioCurrent, email: $email, telefono: $telefono,
                                                descripcion: $descripcion, foto: $foto, cancelar: $cancelar)
                                        }
                                    )
                            }
                        }
                    } // foto y enlaces
                    .frame(width:439, height:215, alignment: .center)
                    .offset(y:-80)
            
                    Text(usuarioCurrent.nombre!)
                        .frame(width:439,  height:44, alignment: .center)
                        .font(.custom("Arial", size:36))
                        .offset(y:-75)
                    Label (email, systemImage: "envelope.fill")//Label (usuarioCurrent.email!, systemImage: "envelope.fill")
                        .frame(width:419,  height:65, alignment: .leading) //439
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .font(.custom("Arial", size:28))
                        .offset(y:-75)
                    Label (telefono, systemImage: "phone.fill")//Label (usuarioCurrent.telefono!, systemImage: "phone.fill")
                        .frame(width:419,  height:65, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                        .background(colorRect)
                        .font(.custom("Arial", size:32))
                        .offset(y:-75)
                    
                    HStack{  //Sobre mi
                        Image (systemName: "questionmark.app")
                            .resizable()
                            .frame(width: 43, height: 43)
                            .background(colorRect)
                            .foregroundColor(.white)
                        Text(" Sobre mí")
                            .font(.custom("Arial", size:32))
                    }
                    .frame(width:419,  height:65, alignment: .leading)
                    .offset(y:-75)

                    VStack {
                        Text (descripcion)//Text (usuarioCurrent.descripcion!)
                            .frame(width:419,  alignment: .leading) //419x110
                            .offset(x:5, y:5)
                    }
                    .frame(width:419,  height:90, alignment: .top)
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    .background(colorRect)
                    .font(.custom("HelveticaNeue", size:16))
                    .offset(y:-75)

                } //VStack Todo
                .frame(width:455,  height:719, alignment: .center)
                .background(colorFondo)
                .foregroundColor(.white)
                .onAppear(){
                    self.email = usuarioCurrent.email!
                    self.telefono = usuarioCurrent.telefono!
                    self.descripcion = usuarioCurrent.descripcion!
                    self.foto = UIImage(data: usuarioCurrent.foto!)!
                }
                Spacer()
            }//NavigationView
            .navigationBarBackButtonHidden(true)
        )
    }
}

/*struct VistaPerfilUsuario_Previews: PreviewProvider {
    @StateObject private var vm: ViewModel = ViewModel()
    static var previews: some View {
        VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0], foto: UIImage(data: vm.usuariosArray[0].foto!)!)
            .environmentObject(vm)
    }
}*/

