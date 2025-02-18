//Created by me on 24/10/20

import Foundation
import UIKit
import RealityKit
import Combine

class Model {
    var modelName:String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable : AnyCancellable? = nil
    
    init(modelName:String) {
        self.modelName=modelName
        self.image=UIImage(named: modelName)!
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {loadCompletion in
                //Handle error
                print("DEBUG: unable to load module \(self.modelName)")
            }, receiveValue: {modelEntity in
                self.modelEntity = modelEntity
                print("DEBUG: Model successfully loaded: \(self.modelName)")
            })
    }
}
