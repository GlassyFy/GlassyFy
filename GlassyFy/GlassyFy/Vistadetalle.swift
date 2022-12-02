//
//  Vistadetalle.swift
//  GlassyFy
//
//  Created by Aula11 on 2/12/22.
//

import SwiftUI


struct Vistadetalle: View {
    var body: some View {
        VStack{

                Text("Experimento")
                    .frame(width:440, height: 70)
                    .foregroundColor(.white)
                    .background(Campo)
         
            
                
           
            
            HStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .background(.blue)
                    .clipShape(Circle())
                    .frame(width: 20, height: 20)
                    .overlay(Circle().stroke(.blue, lineWidth: 2))
                Text("Nombre de usuario")
            }
                .frame(width: 340, height: 50, alignment: .topLeading)
                .padding()
                .background(Campo)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack{
                Image(systemName: "calendar")
                    
                Text("Fecha de la toma")
            }
                .frame(width: 340, height: 50, alignment: .topLeading)
                .padding()
                .background(Campo)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack{
                Image(systemName: "calendar.badge.plus")
                Text("Creado el dia")
            }
                .frame(width: 340, height: 50, alignment: .topLeading)
                .padding()
                .background(Campo)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack{
                HStack{
                    Image(systemName: "doc.plaintext")
                        .foregroundColor(.white)
                    Text("Datos")
                }.frame( alignment: .topLeading)
                Spacer()
                VStack{
                    Text("Índice de refracción (IR) ->")
                    Text("Magnesio (Mg) ->")
                    Text("Aluminio (Al) ->")
                    Text("Potasio (K) ->")
                    Text("Calcio (Ca) ->")
                    Text("Bario (Ba) ->")
                    Text("Tipo ->")
                        
            }
            
            }
                .frame(width: 340, height: 200)
                .padding()
                .background(Campo)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack{
                Image(systemName: "text.alignleft")
                Text("Descripción")
            }
                .frame(width: 340, height: 100, alignment: .topLeading)
                .padding()
                .background(Campo)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .clipShape(RoundedRectangle(cornerRadius: 10))


        }
        .frame(width: 440, height: 900)
        .background(colorFondo)
        .ignoresSafeArea()
        
        
    }
}

