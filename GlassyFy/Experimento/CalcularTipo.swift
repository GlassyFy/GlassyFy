//
//  calcularTipo.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 29/12/22.
//

import Foundation

class TreeNode {
  let condition: String
  let leftChild: TreeNode?
  let rightChild: TreeNode?
  let className: String?

  init(condition: String, leftChild: TreeNode? = nil, rightChild: TreeNode? = nil, className: String? = nil) {
    self.condition = condition
    self.leftChild = leftChild
    self.rightChild = rightChild
    self.className = className
  }
}


