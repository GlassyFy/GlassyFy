//
//  VistaExperimentoUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI
struct VistaExperimentoUsuario: View {
  @EnvironmentObject var vm: ViewModel
  var usuarioCurrent: UsuarioEntity
  var experimentoCurrent: ExperimentoEntity
  let fecha1 = DateFormatter()
  //fecha1.dateStyle = .short
  var body: some View {
      Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
      .ignoresSafeArea()
      .overlay(
    VStack {
      
      
      Text(experimentoCurrent.nombre!)
            .font(.custom("Arial", size:24))
            .foregroundColor(.white)
            .frame(width: 419, height: 37, alignment: .center)
        Spacer()
     VStack { //Permite desplazar la vista// VStack {
         Label(usuarioCurrent.nombre!, systemImage:"person")
            .font(.custom("Arial", size:24))
            .background(colorFondo)
            .foregroundColor(.white)
            .frame(width: 419, height: 40, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
          ///*
           HStack {
            Label("Fecha de la toma:", systemImage: "calendar@2x1")
                .foregroundColor(colorLabel)
               Text("\(fecha1.string(from: experimentoCurrent.fechaToma!))")
                .foregroundColor(.white)
                .frame(alignment: .trailing)
            }
            .frame(width: 419, height: 52, alignment: .leading) // height: 52
            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

          HStack {
            Label("Creado el día: ", systemImage: "calendar.badge")
                .foregroundColor(colorLabel)
              Text("\(fecha1.string(from: experimentoCurrent.fechaCreacion!))")
                .foregroundColor(.white)
                .frame(alignment: .trailing)
            }
            .frame(width: 419, height: 52, alignment: .leading) // height: 52
            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
          VStack {
              Label("Datos:", systemImage: "doc.plaintext")
                  .foregroundColor(colorLabel)
                  .frame(width: 380, alignment: .leading)
              HStack{
                  Text("Iíndice de refracción (IR): ")
                    .font(.custom("Arial", size:24))
                    .foregroundColor(colorLabel)
                  //Text(experimentoCurrent.IR)
                  Text("\(String(format: "%.2f", experimentoCurrent.iR!))")
              }.frame(width: 380, alignment: .trailing)
              ///*
               HStack{
                  Text("Magnesio (Mg): ")
                    .foregroundColor(colorLabel)
                   //Text(experimentoCurrent.magnesio)
                   Text("\(String(format: "%.2f", experimentoCurrent.magnesio!))")
              }.frame(width: 380, alignment: .trailing)
              HStack{
                  Text("Aluminio (Al): ")
                    .foregroundColor(colorLabel)
                  //Text(experimentoCurrent.aluminio!)
                  Text("\(String(format: "%.2f", experimentoCurrent.aluminio!))")
              }.frame(width: 380, alignment: .trailing)
              HStack{
                  Text("Potasio (K): ")
                    .foregroundColor(colorLabel)
                  //Text(experimentoCurrent.potasio)
                  Text("\(String(format: "%.2f", experimentoCurrent.potasio!))")
              }.frame(width: 380, alignment: .trailing)
              HStack{
                  Text("Calcio (Ca): ")
                    .foregroundColor(colorLabel)
                  //Text(experimentoCurrent.Calcio)
                  Text("\(String(format: "%.2f", experimentoCurrent.calcio!))")
              }.frame(width: 380, alignment: .trailing)
              HStack{
                  Text("Bario (Ba): ")
                    .foregroundColor(colorLabel)
                  Text("\(String(format: "%.2f", experimentoCurrent.bario!))")
                  //Text(experimentoCurrent.Bario)
              }.frame(width: 380, alignment: .trailing)
              HStack{
                  Text("Tipo: ")
                    .foregroundColor(colorLabel)
                  Text(experimentoCurrent.tipo!)
              }.frame(width: 380, alignment: .trailing)
               //*/
          } //VStack
          .frame(width: 419, height: 303, alignment: .leading)//, height: 303)
          .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

          VStack{
            Label("Descripción:", systemImage: "text")
                .font(.custom("Arial", size:24))
                .foregroundColor(colorLabel)
                .frame(width: 380, alignment: .leading)
              Text(experimentoCurrent.descripcion!)
               .frame(width: 400, alignment: .leading)
          }
          .frame(width: 419, height: 184, alignment: .leading)//, height: 184)
          .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
    }
     .frame(width: 425, height: 625, alignment: .leading)
    .background(colorFondo)
    .font(.custom("Arial", size:20))
    .foregroundColor(.white)
    }
    .frame(width: 435, height: 749, alignment: .center)
    )
  }
}


/*struct VistaExperimentoUsuario_Previews: PreviewProvider {
    static var previews: some View {
       VistaExperimentoUsuario(experimentoCurrent: experimentoCurrent)
    }
}*/
/*
struct VistaExperimentoUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity
    var experimentoCurrent: ExperimentoEntity
    @State var colorApp = Color.gray
    @State var colorFondo = Color.gray
    @State var colorStroke = Color.gray
    @State var colorLabel = Color.gray
    var body: some View {
        VStack { //ScrollView { //Permite desplazar la vista// VStack {
           /*Text(experimentoCurrent.nombre)
              .font(.title)
              .foregroundColor(.white)
            Label(usuarioCurrent.nombre, systemImage:"person1")
               .background(colorFondo)
              .foregroundColor(.white)
              .frame(width: 435, height: 40, alignment: .leading)
              .overlay(RoundedRectangle(cornerRadius:2).stroke(Color.blue, lineWidth: 2))
            HStack {
              Label("Fecha de la toma:", systemImage:"calendar@2x1")
                  .foregroundColor(colorLabel)
              Text(experimentoCurrent.fechaToma)
                  .foregroundColor(.white)
                  .frame(alignment: .trailing)
              }
              .frame(width: 350, height: 20, alignment: .leading)
              .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
            Label("Creado el día:    \(experimentoCurrent.fechaCreacion)", systemImage:"calendar.badge")
              .foregroundColor(.white)
              .frame(width: 350, height: 20, alignment: .leading)
              .overlay(Rectangle().stroke(color: colorStroke, lineWidth: 2))*/
            VStack {
                Label("Datos", systemImage:"doc.plaintext")
                HStack{
                    Text("Iíndice de refracción (IR): ")
                    Text(experimentoCurrent.IR)
                }.frame(width: 300, alignment: .trailing)
                HStack{
                    Text("Magnesio (Mg): ")
                    Text(experimentoCurrent.Magnesio)
                }.frame(width: 300, alignment: .trailing)
                HStack{
                    Text("Aluminio (Al): ")
                    Text(experimentoCurrent.Aluminio)
                }.frame(width: 300, alignment: .trailing)
                HStack{
                    Text("Potasio (K): ")
                    Text(experimentoCurrent.Potasio)
                }.frame(width: 300, alignment: .trailing)
                HStack{
                    Text("Calcio (Ca): ")
                    Text(experimentoCurrent.Calcio)
                }.frame(width: 300, alignment: .trailing)
                HStack{
                    Text("Bario (Ba): ")
                    Text(experimentoCurrent.Bario)
                }.frame(width: 300, alignment: .trailing)
                HStack{
                    Text("Tipo: ")
                    Text(experimentoCurrent.Tipo)
                }.frame(width: 300, alignment: .trailing)
            } //VStack
            .frame(width: 350, alignment: .leading)//, height: 300)
            .overlay(RoundedRectangle(cornerRadius:2).stroke(Color.blue, lineWidth: 2))
            /*Label(amigoCurrent.telefono, systemImage:"iphone")
                .font(.body)
            Link(destination: URL(string: experimentoCurrent.email)!, label: {
                Image(systemName: "livephoto")
                    .frame(width: 20, height: 20, alignment: .center) // /s)
                Text(amigoCurrent.email)
            })*/
            //Divider()
            VStack{
              Label("Descripción:", systemImage:"text")
              Text(experimentoCurrent.Descripcion)
                 .frame(width: 320, alignment: .leading)
              /*TextEditor (text: $descripcion)
                .colorMultiply(Color.green)  // FondoEditor=FondoVista
                .font(.custom("HelveticaNeue", size: 15))
                .padding()
                .frame(width: 350, height: 300)
                .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                .disableAutocorrection(true)*/
            }
            .frame(width: 350, alignment: .leading)//, height: 300)
            //.overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
            .overlay(Rectangle().stroke(color: colorStroke, lineWidth: 2))
      }
       .background(.gray)
      .foregroundColor(.white)
    }
  }
*/
/*struct VistaExperimentoUsuario_Previews: PreviewProvider {
    static var previews: some View {
        VistaExperimentoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimentoCurrent)
    }
}*/
