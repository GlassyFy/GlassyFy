//
//  VistaEliminacionExperimento.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI
var colorFondo: Color = Color(red: 48/255, green: 49/255, blue: 54/255)
var colorRect: Color = Color(red: 56/255, green: 57/255, blue: 62/255)
var colorSalir: Color = Color(red: 199/255, green: 73/255, blue: 69/255)
var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255)
var colorGreen: Color = Color(red: 90/255, green: 163/255, blue: 100/255)
var colorLabel: Color = Color(red: 150/255, green: 152/255, blue: 157/255)
var colorStroke: Color = Color(red: 101/255, green: 101/255, blue: 101/255)
var colorBTNNo: Color = Color(red: 73/255, green: 82/255, blue: 189/255)
var colorBTNSi: Color = Color(red: 237/255, green: 106/255, blue: 94/255)
var colorRojoTxt: Color = Color(red: 199/255, green: 73/255, blue: 69/255)

struct VistaEliminacionExperimento: View {
    @EnvironmentObject var vm: ViewModel
    var experimentoCurrent: ExperimentoEntity
    //@Binding var cancelar = true //@Binding var cancelar: Bool //true Texto=No rojo
    @State var cancelar = true 
    @Environment(\.presentationMode) var modoPresentacion
    let fecha1 = DateFormatter()
    var body: some View {
        
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
        VStack {
          Text("¿Seguro desea eliminar el experimento?")
                .frame(width: 215, height: 47, alignment: .center)//355
                .font(.custom("Arial", size:20))
                .multilineTextAlignment(.center)
                .offset(x:0, y:-30)
            HStack{
              Image(systemName: "books.vertical.fill")
                  .resizable()
                  .frame(width: 37, height: 31)
                  .padding(5)  //spacing
                  .background(colorBlue)
                  .cornerRadius(10)
                  //.foregroundColor(colorBlue)
                  //.offset(x:25, y:0)

              VStack(alignment: .leading){
                  Text(experimentoCurrent.nombre!)
                      .frame(width: 305, alignment: .center)
                      .font(.custom("Arial", size:20))
                      .multilineTextAlignment(.center)
                  Text("Fecha Creación: \(fecha1.string(from: experimentoCurrent.fechaCreacion!))")
                      .frame(width: 305, alignment: .center)
                      .multilineTextAlignment(.center)
                      .font(.custom("Arial", size:14))
              }
              .frame(width: 305, alignment: .center)
              .offset(x:10, y:0)
              .multilineTextAlignment(.center)
            }
            .background(colorRect)
            .foregroundColor(.white)
            .frame(width: 409, height: 65, alignment: .leading)//439
            .offset(x:25, y:0)
            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 2))
            
            HStack{
              Button() {
                //print ("action NO")
                cancelar = true
                modoPresentacion.wrappedValue.dismiss()
              } label: {
                  Text("No").bold()
                      .frame(width: 176, height: 24, alignment: .center)
                      .font(.custom("Arial", size:20)) //.font(.largeTitle)
                      //.background(colorBTNNo)
                      //.cornerRadius(2)
              }
              .frame(width: 130, height: 33, alignment: .center)
              .padding()
              .background(colorBTNNo)
              .clipShape(Capsule())

              Spacer()

              Button() {
                //print ("action SI") //vm.deleteExperimento(experimento: experimentoCurrent)
                cancelar = false
                modoPresentacion.wrappedValue.dismiss()
              } label: {
                  Text("Sí").bold()
                    .frame(width: 176, height: 24, alignment: .center)
                    .font(.custom("Arial", size:20)) //.font(.largeTitle)
                    //.background(colorBTNSi)
                    //.cornerRadius(2)
              }
              .frame(width: 130, height: 33, alignment: .center)//170X53
              .padding()
              .background(colorBTNSi)
              .clipShape(Capsule())
            } //HStack
            .frame(width: 360, height: 53, alignment: .center) //400
            .offset(x:0, y:25)
            .font(.custom("Arial", size:20)) //.font(.largeTitle)
            //.fontWeight(.bold)
            //.foregroundColor(.white)
          } //VStack
          .frame (width: 425, height: 307, alignment: .center) //(width: 455, height: 307
          .overlay(RoundedRectangle(cornerRadius:15).stroke(colorStroke, lineWidth: 2))
          .background(colorRect)
          .foregroundColor(.white)
        )
    }
    
  }

  /*struct VistaEliminacionExperimento_Previews: PreviewProvider {
      @EnvironmentObject var vm: ViewModel
      static var previews: some View {
          // List(ViewModel().datos){ // List(ModeloDatos().arrExperimentos){
              // VistaFila(experimentoCurrent: $0)
           //}
          //List(ViewModel()){ // List(ModeloDatos().arrExperimentos){
              VistaEliminacionExperimento(experimentoCurrent: vm.experimentosArray[0])
              .environmentObject(vm)   //Falla
          //}
       }
   }*/
