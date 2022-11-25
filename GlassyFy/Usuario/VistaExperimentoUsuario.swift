//
//  VistaExperimentoUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI
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
