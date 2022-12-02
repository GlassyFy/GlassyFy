//
//  Historico.swift
//  GlassyFy
//
//  Created by Aula11 on 18/11/22.
//
import SwiftUI
var  colorFondo : Color = Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
var Campo: Color = Color(red: 56 / 255, green: 57 / 255, blue: 62 / 255)
struct Historico: View {
    @EnvironmentObject var personas:UsuarioEntity
    @EnvironmentObject var experimento:ExperimentoEntity
    @State var query: String = ""
    
    var body: some View {
    
            
      
        VStack{
            Text("Histórico")
                .frame(width:440, height: 50)
                .foregroundColor(.white)
                .background(Campo)
            BusquedaView(text: $query)
         
            VistaFilaHistorico()
    Spacer()
        }.background(colorFondo)
    }
}

struct BusquedaView: View {
    @Binding var text: String
  
    var body:some View {
        
            VStack{
    
                HStack{
                Image(systemName: "magnifyingglass.circle")
                 .opacity(text.isEmpty ? 0.4 : 2.0)
                 .padding(5)
                 .foregroundColor(.white)
                    TextField("", text:$text)
                    .onAppear(){
                                text = "Buscar Experimento..."
                                }
                        .foregroundColor(.white)
                        .onTapGesture {
                            text = ""
                        }
        
                    
                     
                   
             
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
                .overlay(RoundedRectangle(cornerRadius: 10))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .white , radius: 99)
                .padding(5)
            
                        
            }.frame(width:370)
     
   }
}

struct VistaFilaHistorico: View {
    
    var body: some View{
        VStack{
            HStack{
                Image(systemName:"books.vertical")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Experimento1")
               
            }
            HStack{
      
                Text("Autor: Nombre de usuario")
                Text("Fecha Creación: DD/MM/YYY")
            }
                    }
            .frame(width: 370, height: 60)
            .foregroundColor(Color.white)
            .background(Campo)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
            .clipShape(RoundedRectangle(cornerRadius: 10))

     
    }
}
