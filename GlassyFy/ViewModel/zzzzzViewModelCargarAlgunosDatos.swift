//
//  SwiftUIView.swift
//  GlassyFy
//
//  Created by Aula11 on 10/01/23.
//

import Foundation
import CoreData
import UIKit

class zzzzzzViewModel: ObservableObject {
    let gestorCoreData = CoreDataManager.instance //singleton (1 sola instancia)

    @Published var experimentosArray: [ExperimentoEntity] = []
    @Published var usuariosArray: [UsuarioEntity] = []
    
    init(){
        cargarDatos()
        // Lo siguiente se descomenta para que se ejecute 1 sola vez y se vuelve a comentar   
        //cargarAlgunosDatos()                  
    }

    func cargarAlgunosDatos (){
        // carga 6 usuarios
        addUsuario(nombre: "Usuario1", descripcion: "Soy el usuario 1", telefono: "+34 123 456 111", email: "correo1@gmail.com", contrasena: "usuario1", foto: UIImage(systemName: "person.circle.fill")!.pngData) //, foto: UIImage(imageLiteralResourceName: "person1"))
        addUsuario(nombre: "Usuario2", descripcion: "Soy el usuario 2", telefono: "+34 123 456 222", email: "correo2@gmail.com", contrasena: "usuario2", foto: UIImage(systemName: "person.circle.fill")!.pngData)
        addUsuario(nombre: "Usuario3", descripcion: "Soy el usuario 3", telefono: "+34 123 456 333", email: "correo3@gmail.com", contrasena: "usuario3", foto: UIImage(systemName: "person.circle.fill")!.pngData)
        addUsuario(nombre: "Usuario4", descripcion: "Soy el usuario 4", telefono: "+34 123 456 444", email: "correo4@gmail.com", contrasena: "usuario4", foto: UIImage(systemName: "person.circle.fill")!.pngData)
        addUsuario(nombre: "Usuario5", descripcion: "Soy el usuario 5", telefono: "+34 123 456 555", email: "correo5@gmail.com", contrasena: "usuario5", foto: UIImage(systemName: "person.circle.fill")!.pngData)
        addUsuario(nombre: "Usuario6", descripcion: "Soy el usuario 6", telefono: "+34 123 456 666", email: "correo6@gmail.com", contrasena: "usuario6", foto: UIImage(systemName: "person.circle.fill")!.pngData)
        
        guardarDatos()
        cargarDatos()

        // carga 6x5=30 experimentos
        addExperimento(usuario: usuariosArray[0], nombre: "Exp. Flotado 00-01", fechaToma: Date(), descripcion: "Flotado 01", fechaCreacion: Date(), inRef: 1.51793, magnesio: 3.50, aluminio: 1.12, potasio: 0.64, Calcio: 8.77, Bario: 0.00, tipo: "Cristal flotado")
        addExperimento(usuario: usuariosArray[0], nombre: "Exp. Flotado 00-02", fechaToma: Date(), descripcion: "Flotado 02", fechaCreacion: Date(), inRef: 1.51643, magnesio: 3.52, aluminio: 1.35, potasio: 0.57, Calcio: 8.53, Bario: 0.00, tipo: "Cristal flotado")
        addExperimento(usuario: usuariosArray[0], nombre: "Exp. Flotado 00-03", fechaToma: Date(), descripcion: "Flotado 03", fechaCreacion: Date(), inRef: 1.51793, magnesio: 3.48, aluminio: 1.41, potasio: 0.59, Calcio: 8.43, Bario: 0.00, tipo: "Cristal flotado")
        addExperimento(usuario: usuariosArray[0], nombre: "Exp. Vajilla 00-04", fechaToma: Date(), descripcion: "Vajilla 01", fechaCreacion: Date(), inRef: 1.51299, magnesio: 1.74, aluminio: 1.54, potasio: 0.00, Calcio: 7.59, Bario: 0.00, tipo: "Cristal de vajilla")
        addExperimento(usuario: usuariosArray[0], nombre: "Exp. No Flot 00-05", fechaToma: Date(), descripcion: "No flot 01", fechaCreacion: Date(), inRef: 1.53393, magnesio: 0.00, aluminio: 1.00, potasio: 0.12, Calcio:16.19, Bario: 0.00, tipo: "Cristal no flotado")

        addExperimento(usuario: usuariosArray[1], nombre: "Exp. No Flot 01-01", fechaToma: Date(), descripcion: "No flot 02", fechaCreacion: Date(), inRef: 1.51655, magnesio: 2.85, aluminio: 1.44, potasio: 0.57, Calcio: 8.79, Bario: 0.11, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[1], nombre: "Exp. Parab F 01-02", fechaToma: Date(), descripcion: "ParabrF 01", fechaCreacion: Date(), inRef: 1.51779, magnesio: 3.65, aluminio: 0.65, potasio: 0.06, Calcio: 8.93, Bario: 0.00, tipo: "Parabrisas flotado")
        addExperimento(usuario: usuariosArray[1], nombre: "Exp. Flotado 01-03", fechaToma: Date(), descripcion: "Flotado 04", fechaCreacion: Date(), inRef: 1.51837, magnesio: 2.84, aluminio: 1.28, potasio: 0.55, Calcio: 9.07, Bario: 0.00, tipo: "Cristal flotado")
        addExperimento(usuario: usuariosArray[1], nombre: "Exp. de Faro 01-04", fechaToma: Date(), descripcion: "De Faro 01", fechaCreacion: Date(), inRef: 1.51545, magnesio: 0.00, aluminio: 2.68, potasio: 0.08, Calcio: 9.07, Bario: 0.61, tipo: "Cristal de faro")
        addExperimento(usuario: usuariosArray[1], nombre: "Exp. No Flot 01-05", fechaToma: Date(), descripcion: "No flot 03", fechaCreacion: Date(), inRef: 1.51789, magnesio: 3.90, aluminio: 1.30, potasio: 0.55, Calcio: 8.44, Bario: 0.00, tipo: "Cristal no flotado")

        addExperimento(usuario: usuariosArray[2], nombre: "Exp. No Flot 02-01", fechaToma: Date(), descripcion: "No flot 04", fechaCreacion: Date(), inRef: 1.51625, magnesio: 3.59, aluminio: 1.49, potasio: 0.45, Calcio: 8.21, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[2], nombre: "Exp. No Flot 02-02", fechaToma: Date(), descripcion: "No flot 05", fechaCreacion: Date(), inRef: 1.51743, magnesio: 3.25, aluminio: 1.16, potasio: 0.62, Calcio: 8.90, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[2], nombre: "Exp. Flotado 01-03", fechaToma: Date(), descripcion: "Flotado 05", fechaCreacion: Date(), inRef: 1.52223, magnesio: 3.77, aluminio: 0.79, potasio: 0.13, Calcio:10.02, Bario: 0.00, tipo: "Cristal flotado")
        addExperimento(usuario: usuariosArray[2], nombre: "Exp. Parab F 01-04", fechaToma: Date(), descripcion: "ParabrF 02", fechaCreacion: Date(), inRef: 1.52121, magnesio: 3.76, aluminio: 0.58, potasio: 0.11, Calcio: 9.65, Bario: 0.00, tipo: "Parabrisas flotado")
        addExperimento(usuario: usuariosArray[2], nombre: "Exp. Parab F 01-05", fechaToma: Date(), descripcion: "ParabrF 03", fechaCreacion: Date(), inRef: 1.51655, magnesio: 3.45, aluminio: 1.76, potasio: 0.60, Calcio: 8.38, Bario: 0.00, tipo: "Parabrisas flotado")

        addExperimento(usuario: usuariosArray[3], nombre: "Exp. No Flot 03-01", fechaToma: Date(), descripcion: "No flot 06", fechaCreacion: Date(), inRef: 1.51707, magnesio: 3.48, aluminio: 1.71, potasio: 0.62, Calcio: 7.99, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[3], nombre: "Exp. de Faro 03-02", fechaToma: Date(), descripcion: "De Faro 02", fechaCreacion: Date(), inRef: 1.51719, magnesio: 0.00, aluminio: 2.00, potasio: 0.00, Calcio: 8.53, Bario: 1.59, tipo: "Cristal de faro")
        addExperimento(usuario: usuariosArray[3], nombre: "Exp. No Flot 03-03", fechaToma: Date(), descripcion: "No flot 07", fechaCreacion: Date(), inRef: 1.51629, magnesio: 3.33, aluminio: 1.49, potasio: 0.67, Calcio: 8.24, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[3], nombre: "Exp. Recipi. 03-04", fechaToma: Date(), descripcion: "Recipi. 01", fechaCreacion: Date(), inRef: 1.51994, magnesio: 0.00, aluminio: 1.76, potasio: 0.47, Calcio:11.32, Bario: 0.00, tipo: "Cristal de recipiente")
        addExperimento(usuario: usuariosArray[3], nombre: "Exp. No Flot 03-05", fechaToma: Date(), descripcion: "No flot 08", fechaCreacion: Date(), inRef: 1.51811, magnesio: 2.96, aluminio: 1.43, potasio: 0.60, Calcio: 8.79, Bario: 0.14, tipo: "Cristal no flotado")

        addExperimento(usuario: usuariosArray[4], nombre: "Exp. Flotado 04-01", fechaToma: Date(), descripcion: "Flotado 06", fechaCreacion: Date(), inRef: 1.52152, magnesio: 3.65, aluminio: 0.87, potasio: 0.19, Calcio: 9.85, Bario: 0.00, tipo: "Cristal flotado")
        addExperimento(usuario: usuariosArray[4], nombre: "Exp. No Flot 04-02", fechaToma: Date(), descripcion: "No flot 09", fechaCreacion: Date(), inRef: 1.52475, magnesio: 0.00, aluminio: 1.88, potasio: 0.81, Calcio:13.24, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[4], nombre: "Exp. No Flot 04-03", fechaToma: Date(), descripcion: "No flot 10", fechaCreacion: Date(), inRef: 1.51841, magnesio: 3.74, aluminio: 1.11, potasio: 0.64, Calcio: 8.96, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[4], nombre: "Exp. Flotado 04-04", fechaToma: Date(), descripcion: "Flotado 07", fechaCreacion: Date(), inRef: 1.51754, magnesio: 3.66, aluminio: 1.19, potasio: 0.57, Calcio: 9.85, Bario: 0.00, tipo: "Cristal flotado")  
        addExperimento(usuario: usuariosArray[4], nombre: "Exp. Recipi. 04-05", fechaToma: Date(), descripcion: "Recipi. 02", fechaCreacion: Date(), inRef: 1.52058, magnesio: 1.61, aluminio: 2.17, potasio: 0.76, Calcio: 9.70, Bario: 0.24, tipo: "Cristal de recipiente")    

        addExperimento(usuario: usuariosArray[5], nombre: "Exp. No Flot 05-01", fechaToma: Date(), descripcion: "No flot 11", fechaCreacion: Date(), inRef: 1.51569, magnesio: 3.49, aluminio: 1.47, potasio: 0.38, Calcio: 8.03, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[5], nombre: "Exp. No Flot 05-02", fechaToma: Date(), descripcion: "No flot 12", fechaCreacion: Date(), inRef: 1.51590, magnesio: 3.52, aluminio: 1.90, potasio: 0.69, Calcio: 7.97, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[5], nombre: "Exp. de Faro 05-03", fechaToma: Date(), descripcion: "De Faro 03", fechaCreacion: Date(), inRef: 1.51683, magnesio: 0.00, aluminio: 1.98, potasio: 0.00, Calcio: 8.52, Bario: 1.57, tipo: "Cristal de faro")
        addExperimento(usuario: usuariosArray[5], nombre: "Exp. No Flot 05-04", fechaToma: Date(), descripcion: "No flot 13", fechaCreacion: Date(), inRef: 1.51687, magnesio: 3.54, aluminio: 1.48, potasio: 0.56, Calcio: 8.10, Bario: 0.00, tipo: "Cristal no flotado")
        addExperimento(usuario: usuariosArray[5], nombre: "Exp. Parab F 05-05", fechaToma: Date(), descripcion: "ParabrF 02", fechaCreacion: Date(), inRef: 1.51610, magnesio: 3.53, aluminio: 1.34, potasio: 0.56, Calcio: 8.33, Bario: 0.00, tipo: "Parabrisas flotado")
    }
    
    func cargarDatos(){
        experimentosArray.removeAll()
        usuariosArray.removeAll()
        let fetchUsuarios = NSFetchRequest<UsuarioEntity>(entityName: "UsuarioEntity")
        let fetchExperimentos = NSFetchRequest<ExperimentoEntity>(entityName: "ExperimentoEntity")
        do{
            self.usuariosArray = try gestorCoreData.contexto.fetch(fetchUsuarios).sorted(){$0.nombre! < $1.nombre!}
            self.experimentosArray = try gestorCoreData.contexto.fetch(fetchExperimentos).sorted(){$0.nombre! < $1.nombre!}
            
        }catch let error{
            print("Error al cargar los datos: \(error)")
        }
    }
    
    func guardarDatos(){   //no eficiente, pero hay pocos datos
        gestorCoreData.save()
        cargarDatos()
    }

  
    func addExperimento(usuario: UsuarioEntity, nombre: String, fechaToma: Date, descripcion: String, fechaCreacion: Date, inRef: Double, magnesio: Double, aluminio: Double, potasio: Double, Calcio: Double, Bario: Double, tipo: String){
        
        let nuevoExperimento = ExperimentoEntity(context: gestorCoreData.contexto)
        nuevoExperimento.usuariosRelation = usuario
        nuevoExperimento.nombre = nombre
        nuevoExperimento.usuariosRelation = usuario
        nuevoExperimento.fechaToma = fechaToma
        nuevoExperimento.fechaCreacion = fechaCreacion
        nuevoExperimento.descripcion = descripcion
        nuevoExperimento.iR = inRef
        nuevoExperimento.magnesio = magnesio
        nuevoExperimento.aluminio = aluminio
        nuevoExperimento.potasio = potasio
        nuevoExperimento.calcio = Calcio
        nuevoExperimento.bario = Bario
        nuevoExperimento.fechaCreacion = Date()
        nuevoExperimento.tipo = tipo
        guardarDatos()
    }
    
    func registrarUsuario(nombre: String, contrasena: String, email: String){
        let nuevoUsuario = UsuarioEntity(context: gestorCoreData.contexto)
        nuevoUsuario.nombre = nombre
        nuevoUsuario.email = email
        nuevoUsuario.contrasena = contrasena
        nuevoUsuario.foto = UIImage(systemName: "person.circle.fill")!.pngData()
        nuevoUsuario.telefono = "+42 333 666 999"
        nuevoUsuario.descripcion = "Nada por ahora :P"
        nuevoUsuario.fondo = UIImage(named: "kraken")?.pngData()
        guardarDatos()
    }
    
    
    
    func addUsuario(nombre : String, descripcion: String, telefono : String, email: String, contrasena: String, foto: UIImage){
        let nuevoUsuario = UsuarioEntity(context: gestorCoreData.contexto)
        nuevoUsuario.nombre = nombre
        nuevoUsuario.descripcion = descripcion
        nuevoUsuario.telefono = telefono
        nuevoUsuario.email = email
        nuevoUsuario.contrasena = contrasena
        nuevoUsuario.foto = foto.pngData()
        guardarDatos()
    }

    func deleteMascota(experimento: ExperimentoEntity){
        gestorCoreData.contexto.delete(experimento)
        guardarDatos()
    }
    
    func deleteExperimento(experimento: ExperimentoEntity){
            gestorCoreData.contexto.delete(experimento)
            guardarDatos()
    }
    
    func deleteUsuario(usuario: UsuarioEntity){
            gestorCoreData.contexto.delete(usuario)
            guardarDatos()
    }
    
}