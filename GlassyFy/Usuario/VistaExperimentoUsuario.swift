//
//  VistaExperimentoUsuario.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//
import SwiftUI
import Foundation

struct VistaExperimentoUsuario: View {
  @EnvironmentObject var vm: ViewModel
  var usuarioCurrent: UsuarioEntity
  var experimentoCurrent: ExperimentoEntity
  var body: some View {
      Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
      .ignoresSafeArea()
      .overlay(
        GeometryReader{ gemr in
            VStack {
              VStack {
                  //NOMBRE
                  HStack{
                      Image(systemName: "person")
                          .padding()
                      
                      Text(usuarioCurrent.nombre!)
                        .font(.custom("Arial", size:24))
                        .foregroundColor(.white)
                  } .frame(width: gemr.size.width*0.9, height: 40, alignment: .leading)
                      .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

                  //FECHA TOMA
                HStack {
                        Image(systemName: "calendar")
                        .padding()
                    
                        Text("Fecha de toma: ")
                          .font(.custom("Arial", size:18))
                          .foregroundColor(colorLabel)
                    
                   // Spacer()
                    
                    Text("\(experimentoCurrent.fechaToma!.formatted(.dateTime.day().month().year()))")//Text(fecha1.string(from: experimentoCurrent.fechaToma!))
                        .foregroundColor(.white)
                        .frame(alignment: .trailing)
                        .padding()
                }
                .frame(width: gemr.size.width*0.9, height: 40, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

                  //FECHA CREACION
                HStack {
                    Image(systemName: "calendar.badge.plus")
                        .padding()
                    
                    Text("Creado el día: ")
                      .font(.custom("Arial", size:18))
                      .foregroundColor(colorLabel)
                    
                    //Spacer()
                    
                    Text("\(experimentoCurrent.fechaCreacion!.formatted(.dateTime.day().month().year()))")
                        .foregroundColor(.white)
                        .frame(alignment: .trailing)
                        .padding()
                }
                .frame(width: gemr.size.width*0.9, height: 40, alignment: .leading) // height: 52
                .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                  
                  //DATOS
                VStack {
                    HStack{
                        Image(systemName: "doc.plaintext.fill")
                            .padding(.leading, 10)
                        
                        Text("Datos: ")
                          .font(.custom("Arial", size:24))
                          .foregroundColor(colorLabel)
                        
                        Spacer()
                    }
                    //.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)
                    //.offset(x: -15, y:0)
                    HStack{
                        Spacer()
                        Text("Índice de refracción (IR): ")
                          //.font(.custom("Arial", size:24))
                          .foregroundColor(colorLabel)
                        Text("\(String(format: "%.5f", experimentoCurrent.iR))")
                            .frame(width: 100, alignment: .trailing)
                            .padding(.trailing, 10)
                            
                    }//.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)
        
                     HStack{
                         Spacer()
                        Text("Magnesio (Mg): ")
                          .foregroundColor(colorLabel)
                         Text("\(String(format: "%.2f", experimentoCurrent.magnesio))")
                             .frame(width: 100, alignment: .trailing)
                             .padding(.trailing, 10)
                    }//.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)

                    HStack{
                        Spacer()
                        Text("Aluminio (Al): ")
                          .foregroundColor(colorLabel)
                        Text("\(String(format: "%.2f", experimentoCurrent.aluminio))")
                            .frame(width: 100, alignment: .trailing)
                            .padding(.trailing, 10)
                    }//.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)

                    HStack{
                        Spacer()
                        Text("Potasio (K): ")
                          .foregroundColor(colorLabel)
                        Text("\(String(format: "%.2f", experimentoCurrent.potasio))")
                            .frame(width: 100, alignment: .trailing)
                            .padding(.trailing, 10)
                    }//.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)

                    HStack{
                        Spacer()
                        Text("Calcio (Ca): ")
                          .foregroundColor(colorLabel)
                        Text("\(String(format: "%.2f", experimentoCurrent.calcio))")
                            .frame(width: 100, alignment: .trailing)
                            .padding(.trailing, 10)
                    }//.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)

                    HStack{
                        Spacer()
                        Text("Bario (Ba): ")
                          .foregroundColor(colorLabel)
                        Text("\(String(format: "%.2f", experimentoCurrent.bario))")
                            .frame(width: 100, alignment: .trailing)
                            .padding(.trailing, 10)
                    }//.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)

                    HStack{
                        Spacer()
                        Text("Tipo: ")
                          .foregroundColor(colorLabel)
                        Text(experimentoCurrent.tipo!)
                            .frame(width: 200, alignment: .trailing)
                            .padding(.trailing, 10)
                    }//.frame(width: gemr.size.width*0.8, /*height:26,*/ alignment: .trailing)
                } //VStack
                .frame(width: gemr.size.width*0.9, height: gemr.size.width*0.5, alignment:.top)
                .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))

                VStack{
                    if(experimentoCurrent.descripcion != ""){
                        HStack{
                            Image(systemName: "text.alignleft")
                                .padding(.leading, 10)
                            
                            Text("Descripción: ")
                              .font(.custom("Arial", size:24))
                              .foregroundColor(colorLabel)
                            Spacer()
                        }
                        ScrollView{
                            Text(experimentoCurrent.descripcion ?? "")
                                .padding()
                        }
                            .frame(width: gemr.size.width*0.9, alignment: .leading)
                            .frame(maxHeight: gemr.size.height*0.4)
                            .fixedSize(horizontal: false, vertical: true)
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 1))
                    }
                   

                    
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: gemr.size.width*0.9, height: gemr.size.height*0.3, alignment:.top)
                
              }.frame(width: gemr.size.width*0.9, height: gemr.size.height*0.7, alignment: .center)
          .background(colorFondo)
          .font(.custom("Arial", size:20))
          .foregroundColor(.white)
          }
            .frame(width: gemr.size.width, height: gemr.size.height*0.8, alignment: .center)
        }.navigationTitle(experimentoCurrent.nombre!)
      
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
