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
            //cargarDatos()
        
            //addUsuario(nombre: String, descripcion: String, telefono: String, email: String, contrasena: String, foto: UIImage(systemName: "person")!)
           // addExperimento(usuario: UsuarioEntity, nombre: String, descripcion: String, tipo: String, fechaToma: Date, fechaCreacion: Date,iR: Decimal, al: Decimal, ba: Decimal, ca: Decimal, mg: Decimal, k: Decimal)
            addUsuario(nombre: "obalova", descripcion: "La descripción", telefono: "+34 123 456 789" , email: "Correo@dominio.com", contrasena: "usuario", foto: UIImage(imageLiteralResourceName: "person1"))//UIImage(systemName: "person")!)
            
        addExperimento(usuario: usuariosArray[0], nombre: "Exp1", fechaToma: Date(), descripcion: "exp1 hola", fechaCreacion: Date(), inRef: 1.1, magnesio: 1.2, aluminio: 1.3, potasio: 1.4, Calcio: 1.5, Bario: 1.6, tipo: "Cristal")
        guardarDatos()
        cargarDatos()
            //addExperimento(usuario: usuariosArray[0], nombre: "Exp1", descripcion: "Descripción del experimento 1", tipo: "Tipo 1", fechaToma: Date(), fechaCreacion: Date(), iR: 1.1, al: 0.01, ba: 0.02, ca: 0.03, mg: 0.04, k: 0.05)
            //addExperimento(usuario: usuariosArray[0], nombre: "Exp2", descripcion: "Descripción del experimento 2", tipo: "Tipo 2", fechaToma: Date(), fechaCreacion: Date(), iR: 1.1, al: 0.01, ba: 0.02, ca: 0.03, mg: 0.04, k: 0.05)
            //addExperimento(usuario: usuariosArray[0], nombre: "Exp3", descripcion: "Descripción del experimento 2", tipo: "Tipo 3", fechaToma: Date(), fechaCreacion: Date(), iR: 1.1, al: 0.01, ba: 0.02, ca: 0.03, mg: 0.04, k: 0.05)
            //addExperimento(usuario: usuariosArray[0], nombre: "Exp4", descripcion: "Descripción del experimento 2", tipo: "Tipo 4", fechaToma: Date(), fechaCreacion: Date(), iR: 1.1, al: 0.01, ba: 0.02, ca: 0.03, mg: 0.04, k: 0.05)
                    
            
            
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

