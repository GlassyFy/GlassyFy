//
//  VistaEliminacionExperimento.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

var colorBTNNo: Color = Color(red: 73/255, green: 82/255, blue: 189/255)
var colorBTNSi: Color = Color(red: 237/255, green: 106/255, blue: 94/255)

struct VistaEliminacionExperimento: View {
    var experimentoCurrent: ExperimentoEntity
    var cancelar = true //@Binding var cancelar: Bool //true Texto=No rojo
    @Environment(\.presentationMode) var modoPresentacion
    var body: some View {
        VStack {
          Text("¿Seguro desea eliminar el experimento?")
          HStack{
            Image(systemName: "books.vertical")
                .background(.blue)
                .offset(x:-25, y:0)
            VStack(alignment: .leading){
              Text(experimentoCurrent.nombre!)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                Text("fechaToma")
                //experimentoCurrent.fechaToma
                .font(.caption2)
                .fontWeight(.medium)
            }
          /*Spacer()
          Image(systemName: "trash.circle")
                .background(.red)
                .offset(x:25, y:0)*/
          }
          .background(Color.gray)
          .foregroundColor(.white)
          .frame(width: 467, height: 53, alignment: .center)
          HStack{
            //Spacer()
            Button() {
              print ("action NO")
              // cancelar = true
              // modoPresentacion.wrappedValue.dismiss()
            } label: {
              Text("No")
                  .frame(width: 201, height: 53, alignment: .center)
                  .font(.largeTitle)
                  //.fontWeight(.bold)
                  .foregroundColor(.white)
                  .padding()
                  .background(colorBTNNo)
                  .cornerRadius(10)
                  .shadow(radius: 10)
            }
            Button() {
              print ("action SI") //vm.deleteExperimento(experimento: experimentoCurrent)
              // cancelar = falsee
              // modoPresentacion.wrappedValue.dismiss()
            } label: {
              Text("Sí")
                  //.frame(width: 201, height: 53, alignment: .center)
                  .font(.largeTitle)
                  .fontWeight(.bold)
                  .foregroundColor(.white)
                  .padding()
                  .background(colorBTNSi)
                  .cornerRadius(10)
                  .shadow(radius: 10)
            }.frame(width: 201, height: 53, alignment: .center)
            //Spacer()
          } //HStack
          .frame(width: 467, height: 53, alignment: .center)
        } //VStack
        .frame (width: 455, height: 303, alignment: .center)
    }
}

/*struct VistaEliminacionExperimento_Previews: PreviewProvider {
    static var previews: some View {
        // List(ViewModel().datos){ // List(ModeloDatos().arrExperimentos){
            // VistaFila(experimentoCurrent: $0)
         //}
        List(ViewModel()){ // List(ModeloDatos().arrExperimentos){
            VistaEliminacion(experimentoCurrent: $0)
        }
     }
 }*/
