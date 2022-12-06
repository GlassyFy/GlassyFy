//
//  VistaEdicionPerfilUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI
/*var colorSeleccion: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
var colorFondo: Color = Color(red: 48/255, green: 49/255, blue: 54/255)  //bien
var colorRect: Color = Color(red: 56/255, green: 57/255, blue: 62/255)
var colorRojoTxt: Color = Color(red: 199/255, green: 73/255, blue: 69/255) //var colorSalir: Color = Color(red: 199/255, green: 73/255, blue: 69/255)
var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255) //var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255)
var colorGreen: Color = Color(red: 90/255, green: 163/255, blue: 100/255)
var colorLabel: Color = Color(red: 150/255, green: 152/255, blue: 157/255)
var colorStroke: Color = Color(red: 101/255, green: 101/255, blue: 101/255)
//var colorBTNNo: Color = Color(red: 73/255, green: 82/255, blue: 189/255)  //colorboton
var colorRojoBoton: Color = Color(red: 237/255, green: 106/255, blue: 94/255) //var colorBTNSi: Color = Color(red: 237/255, green: 106/255, blue: 94/255)
*/
var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)

struct VistaEdicionPerfilUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity
    @State var descripcion: String = "" //textoDescripcion: String = usuarioCurrent.descripcion!
    @State var counter: Double = 0 // para ProgressView
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
            VStack {
                HStack{
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(colorRojoTxt)
                    Text(usuarioCurrent.nombre!)
                        .frame(width:303, alignment: .center) //373
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(colorGreen)
                }
                .frame(width:439,  height:37, alignment: .center)
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
                
                HStack {
                    Label (usuarioCurrent.telefono!, systemImage: "phone.fill")
                        .frame(width:319,  height:65, alignment: .leading)
                    Spacer()
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(colorRojoTxt)
                }
                .frame(width:419,  height:65, alignment: .leading) //439
                .background(colorRect)
                .font(.custom("Arial", size:28))
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
                    .frame(width:439,  height:110, alignment: .leading)
                    //.overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    .background(colorcampostxt)
                    //.background(colorRect)
                    .foregroundColor(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .font(.custom("HelveticaNeue", size:16))
                    .onChange(of: self.descripcion) {value in
                        //counter = Double(value.count)
                        if Int(descripcion.count) > 300 {
                            self.descripcion = String(descripcion.prefix(300))
                        }
                    }
            }
            .frame(width:475,  height:729, alignment: .center)
            .background(colorFondo)
            .foregroundColor(.white)
            .onAppear{ //Inicializo las variables de estado
                descripcion = usuarioCurrent.descripcion!
            }
            .onDisappear{
                 usuarioCurrent.descripcion = descripcion
            }
            //Spacer()
            
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

/*struct VistaEdicionPerfilUsuario_Previews: PreviewProvider {
    @EnvironmentObject var vm: ViewModel
    static var previews: some View {
        VistaEdicionPerfilUsuario(usuarioCurrent: vm.usuariosArray[0])
    }
}*/

