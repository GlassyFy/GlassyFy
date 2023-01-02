//
//  SwiftUIView.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//
import SwiftUI
import Foundation
import CoreData
import UIKit

class ViewModel: ObservableObject {
    let gestorCoreData = CoreDataManager.instance //singleton (1 sola instancia)
    @Published var usuariosArray: [UsuarioEntity] = []
    @Published var experimentosArray: [ExperimentoEntity] = []
    
    init(){
        cargarDatos()
    }
    
    func cargarDatos(){
        usuariosArray.removeAll()
        experimentosArray.removeAll()
        let fetchUsuarios = NSFetchRequest<UsuarioEntity>(entityName: "UsuarioEntity")
        let fetchExperimentos = NSFetchRequest<ExperimentoEntity>(entityName: "ExperimentoEntity")
        do{
            self.usuariosArray = try gestorCoreData.contexto.fetch(fetchUsuarios).sorted(){$0.nombre! < $1.nombre!}
            self.experimentosArray = try gestorCoreData.contexto.fetch(fetchExperimentos).sorted(){$0.nombre! < $1.nombre!}
        }catch let error{
            print("Error al cargar los datos: \(error)")
        }
    }
    
    func guardarDatos(){   //no es eficiente, pero hay pocos datos
        gestorCoreData.save()
        cargarDatos()
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

    func deleteUsuario(indexSet: IndexSet){
        for index in indexSet{  //podria eliminar varios a la vez
            gestorCoreData.contexto.delete(usuariosArray[index])
        }
        guardarDatos()
    }
    
    func addExperimento(usuario: UsuarioEntity, nombre: String, descripcion: String, tipo: String, fechaToma: Date, fechaCreacion: Date,
        iR: NSDecimalNumber, al: NSDecimalNumber, ba: NSDecimalNumber, ca: NSDecimalNumber, mg: NSDecimalNumber, k: NSDecimalNumber){
        let nuevoExperimento = ExperimentoEntity(context: gestorCoreData.contexto)
        nuevoExperimento.nombre = nombre
        nuevoExperimento.descripcion = descripcion
        nuevoExperimento.tipo = tipo
        nuevoExperimento.fechaToma = fechaToma
        nuevoExperimento.fechaCreacion = fechaCreacion
        nuevoExperimento.iR = iR
        nuevoExperimento.aluminio = al
        nuevoExperimento.bario = ba
        nuevoExperimento.calcio = ca
        nuevoExperimento.magnesio = mg
        nuevoExperimento.potasio = k
        nuevoExperimento.usuariosRelation = usuario
        guardarDatos()
    }
    
    func deleteExperimento(experimento: ExperimentoEntity){
        gestorCoreData.contexto.delete(experimento)
        guardarDatos()
    }
}
