//
//  ContentView.swift
//  newReferences
//
//  Created by Nathaniel Mcdowell on 10/21/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var myObj:testObject
    @State private var isShown:Bool = false
    var body: some View {
        Text("Hello, world! - from \(myObj.name)")
            .padding()
        Button("Launch", action: {
            print("works")
            isShown = true
        }).sheet(isPresented: $isShown, onDismiss: {print("dismissed")}, content: {
            sheetView(localObj: myObj)
          
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(myObj: testObject())
    }
}

struct sheetView:View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var localObj:testObject
    var body: some View {
    Text("I'll have a burrito!")
    //Toggle("Move the parent's Bool", isOn: <#T##Binding<Bool>#>)
    TextField("my name is:", text: $localObj.name)
    Button("Dismiss Me!!!",action: {
        self.presentationMode.wrappedValue.dismiss()
    })
    }
}
