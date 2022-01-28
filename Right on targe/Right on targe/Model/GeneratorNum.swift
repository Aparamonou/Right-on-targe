//
//  Generator.swift
//  Right on targe
//
//  Created by Alex Paramonov on 19.01.22.
//

import Foundation


protocol GeneratorNumProtocol {
     
     func getNewRandomValue () -> Int
     
}

class GeneratorNum : GeneratorNumProtocol {
     
     private var  minSecretValue: Int
     private var maxSecretValue: Int
     
     init?(startValue: Int, endValue: Int) {
          
          guard startValue <= endValue else {
               return nil
          }
          
          minSecretValue = startValue
          maxSecretValue = endValue
     }
     
     func getNewRandomValue () -> Int {
          (minSecretValue...maxSecretValue).randomElement()!
	}

}
