//
//  Historico.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//
import SwiftUI

struct Historico: View {
    
    @State var query: String = ""
    
    var body: some View {
       
        VStack{
            BusquedaView(text: $query)
                
                
        }
    //.background(Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255))
    }
}

struct BusquedaView: View {
    @Binding var text: String
  
    var body:some View {
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .ignoresSafeArea()
                .overlay(
        
            VStack{
                Text("Histórico")
                    .frame(width:400, height: 50)
                    .foregroundColor(.white)
                    .background(Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255))
                    
                Spacer()
         
                HStack{
                Image(systemName: "magnifyingglass.circle")
                 .opacity(text.isEmpty ? 0.4 : 2.0)
                 .padding(5)
                 .foregroundColor(.white)
                    TextField("Buscar experimento...", text:$text)
                        .foregroundColor(.white)
            
             
                Button(){
                text = "" }
                label:{
                Image(systemName:"x.circle")
                        .padding(5)
                        .foregroundColor(text.isEmpty ? Color(UIColor.white).opacity(0.0) : Color(UIColor.red).opacity(2.0))
                        
                }.frame(height:40)
                        
                }
                .background(text.isEmpty ? Color(UIColor.white).opacity(0.2) : Color(UIColor.white).opacity(0.2))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .white , radius: 99)
                .padding(5)
            
                        
            }.frame(width:350)
            )
    
        }

      
}
