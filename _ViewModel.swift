//
//  SwiftUIView.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import Foundation
import CoreData
import UIKit

class ViewModel: ObservableObject {
    let gestorCoreData = CoreDataManager.instance //singleton (1 sola instancia)


    @Published var experimentosArray: [ExperimentoEntity] = []
    @Published var usuariosArray: [UsuarioEntity] = []
    
    init(){
        cargarDatos()
        //addUsuario(nombre: "usuario1", descripcion: "La descripción", telefono: "+34 123 456 789" , email: "correo1@gmail.com", contrasena: "usuario1", foto: UIImage(imageLiteralResourceName: "person1"))//UIImage(systemName: "person")!)
        //addUsuario(nombre: "usuario2", descripcion: "La descripción", telefono: "+34 123 456 789" , email: "correo2@gmail.com", contrasena: "usuario2", foto: UIImage(imageLiteralResourceName: "person1"))//UIImage(systemName: "person")!)
        //addUsuario(nombre: "usuario3", descripcion: "La descripción", telefono: "+34 123 456 789" , email: "correo3@gmail.com", contrasena: "usuario3", foto: UIImage(imageLiteralResourceName: "person1"))//UIImage(systemName: "person")!)
        //addUsuario(nombre: "obalova", descripcion: "La descripción", telefono: "+34 123 456 789" , email: "ovalova@gmail.com", contrasena: "obalova", foto: UIImage(imageLiteralResourceName: "person1"))//UIImage(systemName: "person")!)
         
        //guardarDatos()
        // cargarDatos()
        //addExperimento(usuario: usuariosArray[0], nombre: "Exp1", fechaToma: Date(), descripcion: "exp1 hola", fechaCreacion: Date(), inRef: 1.51793, magnesio: 3.5, aluminio: 1.12, potasio: 0.64, Calcio: 8.77, Bario: 0.0, tipo: "buildWindFloat")
        //addExperimento(usuario: usuariosArray[0], nombre: "Exp2", fechaToma: Date(), descripcion: "exp3 hola", fechaCreacion: Date(), inRef: 1.53393, magnesio: 0, aluminio: 1, potasio: 0.12, Calcio: 16.19, Bario: 0.0, tipo: "buildWindNonFloat")
        //addExperimento(usuario: usuariosArray[0], nombre: "Exp3", fechaToma: Date(), descripcion: "exp4 hola", fechaCreacion: Date(), inRef: 1.51643, magnesio: 3.52, aluminio: 1.35, potasio: 0.57, Calcio: 8.53, Bario: 0.0, tipo: "vehicWindFloat")
        //addExperimento(usuario: usuariosArray[0], nombre: "Exp3", fechaToma: Date(), descripcion: "exp4 hola", fechaCreacion: Date(), inRef: 1.1, magnesio: 1.2, aluminio: 1.3, potasio: 1.4, Calcio: 1.5, Bario: 1.6, tipo: "vehicWindNonFloat")
        //addExperimento(usuario: usuariosArray[0], nombre: "Exp3", fechaToma: Date(), descripcion: "exp4 hola", fechaCreacion: Date(), inRef: 1.51994, magnesio: 0, aluminio: 1.76, potasio: 0.47, Calcio: 11.32, Bario: 0.0, tipo: "containers")
        //addExperimento(usuario: usuariosArray[0], nombre: "Exp3", fechaToma: Date(), descripcion: "exp4 hola", fechaCreacion: Date(), inRef: 1.51299, magnesio: 1.74, aluminio: 1.54, potasio: 0, Calcio: 7.59, Bario: 0.0, tipo: "tableware")
        //addExperimento(usuario: usuariosArray[0], nombre: "Exp3", fechaToma: Date(), descripcion: "exp4 hola", fechaCreacion: Date(), inRef: 1.51545, magnesio: 0.0, aluminio: 2.68, potasio: 0.08, Calcio: 9.07, Bario: 0.61, tipo: "headlamps")       
            
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
    
}

