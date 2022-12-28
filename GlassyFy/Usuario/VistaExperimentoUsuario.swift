//
//  VistaExperimentoUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//
import SwiftUI
import Foundation

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

struct VistaExperimentoUsuario: View {
  @EnvironmentObject var vm: ViewModel
  var usuarioCurrent: UsuarioEntity
  var experimentoCurrent: ExperimentoEntity
  let fecha1 = DateFormatter()
  //fecha1.dateStyle = .medium
  //fecha1.dateFormat = "dd/MM/AAAA" //"YY/MM/dd"
  var body: some View {
      Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
      .ignoresSafeArea()
      .overlay(
      VStack {
          Text(experimentoCurrent.nombre ?? "")
            .font(.custom("Arial", size:24))
            .foregroundColor(.white)
            .frame(width: 419, height: 57, alignment: .center)

        VStack {
          Label(usuarioCurrent.nombre!, systemImage:"person")
              .font(.custom("Arial", size:24))
              .background(colorFondo)
              .foregroundColor(.white)
              .frame(width: 419, height: 40, alignment: .leading)
              .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
              //.offset(x:10)
          HStack {
              //HStack{
                  Image(systemName: "calendar")
                  Text("Fecha de la toma: ")
                    .font(.custom("Arial", size:24))
                    .foregroundColor(colorLabel)
              //}.frame(width: 380, alignment: .leading)
              /*Label("Fecha de la toma:", systemImage: "calendar")
                  //.foregroundColor(colorLabel)*/
              Text(fecha1.string(from: experimentoCurrent.fechaToma ?? Date()))//Text(fecha1.string(from: experimentoCurrent.fechaToma!))
                  .foregroundColor(.white)
                  .frame(alignment: .trailing)
          }
          .frame(width: 419, height: 52, alignment: .leading) // height: 52
          .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

          HStack {
              Image(systemName: "calendar.badge.plus")
              Text("Creado eldía: ")
                .font(.custom("Arial", size:24))
                .foregroundColor(colorLabel)
              /*Label("Creado el día: ", systemImage: "calendar.badge.plus")
                  //.foregroundColor(colorLabel)*/
              Text(fecha1.string(from: experimentoCurrent.fechaCreacion ?? Date()))//Text("\(fecha1.string(from: experimentoCurrent.fechaCreacion!))")
                  .foregroundColor(.white)
                  .frame(alignment: .trailing)
          }
          .frame(width: 419, height: 52, alignment: .leading) // height: 52
          .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

          VStack {  //Datos
              HStack{
                  Image(systemName: "doc.plaintext.fill")
                  Text("Datos: ")
                    .font(.custom("Arial", size:24))
                    .foregroundColor(colorLabel)
              }
              .frame(width: 380, height:26, alignment: .leading)
              .offset(x: -15, y:0)
              /*Label("Datos:", systemImage: "doc.plaintext.fill")
                  //.foregroundColor(colorLabel)
                  .frame(width: 380, alignment: .leading)*/

              HStack{
                  Text("Iíndice de refracción (IR): ")
                    .font(.custom("Arial", size:24))
                    .foregroundColor(colorLabel)
                  Text("\(String(format: "%.2f", experimentoCurrent.iR))")
              }.frame(width: 380, height:26, alignment: .trailing)
  
               HStack{
                  Text("Magnesio (Mg): ")
                    .foregroundColor(colorLabel)
                   Text("\(String(format: "%.2f", experimentoCurrent.magnesio))")
              }.frame(width: 380, height:26, alignment: .trailing)

              HStack{
                  Text("Aluminio (Al): ")
                    .foregroundColor(colorLabel)
                  Text("\(String(format: "%.2f", experimentoCurrent.aluminio))")
              }.frame(width: 380, height:26, alignment: .trailing)

              HStack{
                  Text("Potasio (K): ")
                    .foregroundColor(colorLabel)
                  Text("\(String(format: "%.2f", experimentoCurrent.potasio))")
              }.frame(width: 380, height:26, alignment: .trailing)

              HStack{
                  Text("Calcio (Ca): ")
                    .foregroundColor(colorLabel)
                  Text("\(String(format: "%.2f", experimentoCurrent.calcio))")
              }.frame(width: 380, height:26, alignment: .trailing)

              HStack{
                  Text("Bario (Ba): ")
                    .foregroundColor(colorLabel)
                  Text("\(String(format: "%.2f", experimentoCurrent.bario))")
              }.frame(width: 380, height:26, alignment: .trailing)

              HStack{
                  Text("Tipo: ")
                    .foregroundColor(colorLabel)
                  //Text(experimentoCurrent.tipo!)
              }.frame(width: 380, height:26, alignment: .trailing)
          } //VStack
          .frame(width: 419, height: 283, alignment:.top)//  .leading)//, height: 303)
          .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

          VStack{
              HStack{
                  Image(systemName: "text.alignleft")
                  Text("Descripción: ")
                    .font(.custom("Arial", size:24))
                    .foregroundColor(colorLabel)
              }
              .frame(width: 380, height:26, alignment: .leading)
              .offset(x: -15, y:0)
              /*Label("Descripción:", systemImage: "text.alignleft")
                    .font(.custom("Arial", size:24))
                    //.foregroundColor(colorLabel)
                    .frame(width: 380, alignment: .leading)*/
              Text(experimentoCurrent.descripcion ?? "")
               .frame(width: 400, alignment: .leading)
          }
          .frame(width: 419, height: 184, alignment:.top)// .leading)//, height: 184)
          .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
            //Spacer()
    }
     .frame(width: 425, height: 625, alignment: .leading)
    .background(colorFondo)
    .font(.custom("Arial", size:20))
    .foregroundColor(.white)
          
          
    }
    .frame(width: 435, height: 749, alignment: .top)
    )
  }
}

/*struct VistaExperimentoUsuario_Previews: PreviewProvider {
    @StateObject private var vm: ViewModel = ViewModel()
    static var previews: some View {
        VistaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: vm.experimentosArray[0])
        .environmentObject(vm)
    }
}*/
