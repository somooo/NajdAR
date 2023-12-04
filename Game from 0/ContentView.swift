//
//  ContentView.swift
//  Test 11
//
//  Created by Muna Aiman Al-hajj on 08/05/1445 AH.
//

import SwiftUI
import RealityKit
import ARKit
//import FocusEntity

struct ContentView : View {
    
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedPlacement: Model?
    
    private var Models: [Model] = {
        //Dinamically get our model filenames
        let filemanager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try?
                filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        var availableModels: [Model] = []
        for filename in files where
        filename.hasSuffix(".usdz"){
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            let Model = Model(ModelName: modelName)
            availableModels.append(Model)
        }
        
        return availableModels
    }()

    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedPlacement)
            
            if self.isPlacementEnabled{
                PlacementButtonView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedPlacement)
            }else{
                ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, Models: self.Models)

            }
           
            
        }//zstack

    }//var body
    
}//struct view

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: Model?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context){
        
        if let Model = self.modelConfirmedForPlacement{
            
            if let modelEntity = Model.modelEntity {
                print("DEBUG: adding model to scene - \(Model.ModelName)")
                
                let anchorEntity = AnchorEntity(plane: .horizontal)
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                let scaleFactor: Float = 0.1
                
                anchorEntity.scale = [scaleFactor, scaleFactor, scaleFactor]
                

                uiView.scene.addAnchor(anchorEntity)
            } else {
                print("DEBUG: Unable to load modelEntity for \(Model.ModelName)")
            }
            
            DispatchQueue.main.async{
                self.modelConfirmedForPlacement = nil
            }
            
        }
        
    }
    
}

/*class CustomARview: ARView {
    let focusSquare = FESquare()
    
    required init(frame frameRect: CGRect){
        super.init(frame: frameRect)
        
        focusSquare.viewDebugData = self
        focusSquare.delgate = self
        focusSquare.setAutoUpdate(to: true)
        
        self.setupARview()
        
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupARview(){
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
        self.session.run(config)
        
    }
}

extension CustomARview: FocusEntityDelegate {
    func toTrackingState() {
        print("traking")
    }
    
    func toInitializingState() {
        print("initializing")
    }
}*/



    struct ModelPickerView:View {
        @Binding var isPlacementEnabled: Bool
        @Binding var selectedModel: Model?
        
        var Models: [Model]
        
        var body: some View{
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 30){
                    ForEach(0 ..< self.Models.count) {index
                        in
                        Button(action: {
                            print("DEBUG: selected Model with name: \(self.Models[index].ModelName)")
                            
                            self.selectedModel = self.Models[index]
                            
                            self.isPlacementEnabled = true
                            var scale: CGFloat {.zero}
                        })//Button
                        {
                            Image(uiImage: self.Models[index].image)
                                .resizable()
                                .frame(height: 48)
                                .aspectRatio(1/1, contentMode: .fit)
                                
                            
                        } .buttonStyle(PlainButtonStyle())
                        
                    }//ForEach
                    
                }//Hstak
                
            }//scrollView
            .padding(20)
            
        }
    }
    


struct PlacementButtonView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View {
        HStack{
            //cancel Button
            Button(action: {
                print("DEBUG: model placement cancelled.")
                
                self.reserPlacementParameters()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 40, height: 40)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            //confirm Button
            Button(action: {
                print("DEBUG: model placement confirmed.")
                
                self.modelConfirmedForPlacement = self.selectedModel
                
                self.reserPlacementParameters()
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 40, height: 40)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
        }
    }
    
    func reserPlacementParameters(){
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
    
}




#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
#endif
/*#Preview {
    ContentView()
}*/
