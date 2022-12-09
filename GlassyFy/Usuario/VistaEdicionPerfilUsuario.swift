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
*/

extension UITextView {
    open override var frame: CGRect {
        didSet {
            backgroundColor = .clear //<<here clear
            //drawsBackground = true
        }

    }
}

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
    //appearance().backgroundColor = .clear
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea(.all)
        .overlay(
            VStack {
            //VStack {
                HStack{
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
            } //HStack
            .frame(width:439,  height:37, alignment: .center)
            .background(colorRect)
            .font(.custom("Arial", size:24))

            //VStack {
                Image("paisaje")
                    .frame(width:475,  height:193, alignment: .center)
                    //.resizable()

                VStack {
                    HStack {
                        //VistaCambiarFoto (usuarioCurrent: usuarioCurrent).environmentObject(vm)
                        //if mostrarCambiarFoto {
                            //VistaCambiarFoto (mostrarCambiarFoto: $mostrarCambiarFoto)
                        //}
                        Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                            .frame(width:234, height:215)
                            //.resizable()
                        Button() {
                                mostrarCambiarFoto.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .shadow(color: .pink, radius:14, x:5, y:5)
                                .shadow(color: .gray, radius:14, x:-5, y:-5)
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
                    //.foregroundColor(.white)
                    .offset(y:-70)
                //ZStack{
                //Form () {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        //Spacer()
                        TextField("Email", text: $email)
                            .foregroundColor(.white)
                            .frame(height: 32, alignment: .leading)
                            //.background(colorFondo)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        //.foregroundColor(.white)
                        Spacer()
                    }
                    .frame(width:419,  height:65, alignment: .leading) //439
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    //.clipShape(RoundedRectangle(cornerRadius: 10))
                    .background(colorRect)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size:28))
                    .offset(y:-60) //
                    /*Label (usuarioCurrent.email!, systemImage: "envelope.fill")
                        .frame(width:419,  height:65, alignment: .leading) //439
                        .background(colorRect)
                        .font(.custom("Arial", size:28))
                        .offset(y:-60)*/
                    
                    HStack {
                        Image(systemName: "phone.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        //Spacer()
                        TextField("Tlfno", text: $telefono)
                            .foregroundColor(.white)
                            .frame(height: 32, alignment: .leading)
                            //es.background(colorFondo)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
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
                        Text("\(descripcion.count)/300")//Text("\(counter)/150")
                            .foregroundColor(colorRojoTxt)
                    }
                    .frame(width:409, height:19,  alignment: .trailing)
                    .offset(y:-20)
                    //.background(colorRojoTxt)
                    .font(.custom("Arial", size:16))
                
                    TextEditor (text: $descripcion)
                        //.colorMultiply(colorFondo) //Fondo=Fondovistacolo
                        //.padding()
                        .background(.clear)
                        .foregroundColor(Color.gray)
                        .background(colorFondo)
                        //.foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                        .font(.custom("HelveticaNeue", size:16))
                        //.foregroundColor(.white)
                        //.padding()
                        .frame(width:409,  height:80, alignment: .leading) //439
                        //.overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
                        //.disableAutocorrection(true)
                        //.colorMultiply(colorFondo)
                        //.background(colorcampostxt)
                        //.background(colorRect)
                        //.foregroundColor(.red)
                        //.clipShape(RoundedRectangle(cornerRadius: 15))
                        .onChange(of: self.descripcion) {value in
                            //counter = Double(value.count)
                            if Int(descripcion.count) > 300 {
                                self.descripcion = String(descripcion.prefix(300))
                            }
                        }
                //} //Form
                //  .frame(width:475,  height:329, alignment: .center)
                ////.introspectTableView { $0.backgroundColor = .systemBlue }
                //.foregroundColor(.white)
                //.background(colorFondo)
                //.edgesIgnoringSafeArea(.all)
                //.offset(y:-10)
                //}//ZSatck
                .background(colorFondo)
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
                
            } //VStack
            //}
            .frame(width:475,  height:729, alignment: .center) //475x729
                .background(colorFondo)
                .foregroundColor(.white)
        )
    }
}

/*struct VistaFoto {
    @EnvironmentObject var vm: ViewModel
    @State var mostrarAddFoto: Bool = false
    var usuarioCurrent: UsuarioEntity
    var body: some View {
        NavigationView {
            HStack {
                    /*Image(systemName: "books.vertical.fill")
                        .resizable()
                        .frame(width: 37, height: 31)
                        .padding(5)  //spacing
                        .background(colorBlue)
                        .cornerRadius(10)
                        .offset(x:-25, y:0)*/
                    Image(uiImage: UIImage(data: usuarioCurrent.foto!)!)//("foto")
                        .frame(width:234, height:215)
                        //.resizable()
                    if mostrarAddFoto {
                        VistaAddFoto(mostrarAddFoto: $mostrarAddFoto)
                    }
                    /*Button(){
                         mostrarAddFoto.toggle()
                    }label:{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 42, height: 42)
                            .foregroundColor(colorFondo)
                            .background(colorBlue)//(colorFondo)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .offset(x:25, y:0)*/
            
            }
            .frame (width: 350, height: 120, aligment: .center)
        } //Navigation
        .navigationBarItems (
            trailing:
                Button(){
                         mostrarAddFoto.toggle()
                }label:{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 42, height: 42)
                            .foregroundColor(colorFondo)
                            .background(colorBlue)//(colorFondo)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .offset(x:25, y:0)
        )

    }
}*/

/*struct VistaCambiarFoto {
    @EnvironmentObject var vm: ViewModel
    @Binding var mostrarCambiarFoto: Bool
    @State var mostrarImagePicker: Bool = false
    @State var imageGeneral: UIImage
    var body: some View {
        HStack {
            Button() {
                mostrarImagePicker.toggle()
            }label:{
                Image(uiImage: imageGeneral)
                .resizable()
                .scaledToFit()
                .frame(width:90, height:90, alignment:.top)
                .overlay(RoundedRectangle(cornerRadius:10).stroke(Color.white, lineWidth: 2))
                .shadow(color: .gray, radius:9)
                .padding(.vertical)
            }
            .sheet(isPresented: $mostrarImagePicker){
                ImagePicker(sourceType: .photoLibrary) {imageSeleccionada in
                    imageGeneral = imageSeleccionada
                }
            }
            VStack {
                Button() {
                    usuarioCurrent.foto = self.foto
                }label:{
                Image(systemName: "square.and.arrow.down.on.square.fill")
                    .resizable()
                    .frame(width:40, height:40)
                    .clipShape(Circle())
                    .shadow(color: Color.red, radius:20)
                }
            }
        }
        .frame (width: 350, height: 120, aligment: .center)
    }
}*/

    /*struct VistaPerfilUsuario_Previews: PreviewProvider {
        @EnvironmentObject var vm: ViewModel
        static var previews: some View {
            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0])
                .environmentObject(ViewModel())
        }
    }*/

/*struct VistaEdicionPerfilUsuario_Previews: PreviewProvider {
    @EnvironmentObject var vm: ViewModel
    static var previews: some View {
        VistaEdicionPerfilUsuario(usuarioCurrent: vm.usuariosArray[0])
    }
}*/

