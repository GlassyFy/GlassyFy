//
//  HistoricoSeleccionado.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct HistoricoSeleccionadoView: View {
    var body: some View {
        HStack{
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        HStack{
                                        Image(systemName: "person.circle.fill")
                                            .background(.blue)
                                        Text("Peter")
                        }
                          .frame(width: 250, height: 50)
                          .foregroundColor(.white)
                          .background(Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255))
                          .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255), lineWidth: 2))
                          .clipShape(RoundedRectangle(cornerRadius: 10))
                          .shadow(radius: 99)
                          .padding(5)
                        
                        HStack{
                            Image(systemName: "calendar")
                            
                            Text("Fecha de la toma:")
                        }
                        .frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255), lineWidth: 2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 99)
                        .padding(5)
                        HStack{
                            Image(systemName: "calendar.badge.plus")
                            
                            Text("Creado el dia:")
                        }
                        .frame(width: 250, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255), lineWidth: 2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 99)
                        .padding(5)
                        
                        HStack{
                            Image(systemName: "doc.plaintext")
                            
                            Text("Datos:")
                            Text("Indice de refraccion (IR):")
                            Text("Magnesio (Mg)")
                            Text("Aluminio (Al)")
                            Text("Potasio (K)")
                            Text("Calcio (Ca)")
                            Text("Bario (Ba)")
                        }
                        .frame(width: 250, height: 300)
                        .foregroundColor(.white)
                        .background(Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255), lineWidth: 2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 99)
                        .padding(5)
                        
                        HStack{
                            Image(systemName: "text.alignleft")
                            
                            Text("Descripción:")
                        }
                        .frame(width: 250, height: 300)
                        .foregroundColor(.white)
                        .background(Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 101 / 255, green: 101 / 255, blue: 101 / 255), lineWidth: 2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 99)
                        .padding(5)
                    }
      
                    
                
         )
        }
    }
}


