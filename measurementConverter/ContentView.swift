//
//  ContentView.swift
//  measurementConverter
//
//  Created by Tim Randall on 1/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var heightInputString: String = ""
    @State var weightInputString: String = ""
    @State var convertToInches: Bool = true
    @State var convertToPounds: Bool = true
    @State var heightOutput: Float = 0
    @State var weightOutput: Float = 0
    @State var heightDisplay: String = ""
    @State var weightDisplay: String = ""
    @State var feetInchDisplay: String = ""
    var body: some View {
        VStack {
            Text("Measurement Converter").fontWeight(.heavy)
                .padding()
            Spacer()
            HStack{
                TextField("Enter height", text: $heightInputString)
                Toggle("Cm to Inches (green) or Inches to Cm?", isOn: $convertToInches)
            }
            HStack{
                Text(heightDisplay)
                Spacer()
                Button("Convert", action:{
                    heightConverter()
                })
            }
            Text(feetInchDisplay)
                .padding()
            Spacer()
            HStack{
                TextField("Enter weight", text: $weightInputString)
                Toggle("Kg to pounds or pounds to kg (green)", isOn: $convertToPounds)
            }
            HStack{
                Text(weightDisplay)
                Spacer()
                Button("Convert", action:{
                    weightConverter()
                })
            }
            Spacer()
        }
    }
    func heightConverter() {
        let heightInput: Float = Float(heightInputString) ?? 0
        if convertToInches == true {
            let heightDisplayFloat = heightInput * 0.393701
            heightDisplay = String(heightDisplayFloat)
            let heightInt: Int = Int(heightDisplayFloat)
            let heightFeet: Int = heightInt / 12
            let heightInches: Int = heightInt % 12
            feetInchDisplay = "\(heightFeet) feet and \(heightInches) inches"
        }
        else {
            let heightDisplayFloat = heightInput * 2.54
            heightDisplay = String(heightDisplayFloat)
            feetInchDisplay = ""
        }
    }
    func weightConverter() {
        let weightInput: Float = Float(weightInputString) ?? 0
        if convertToPounds == true {
            let weightDisplayFloat = weightInput * 0.453592
            weightDisplay = String(weightDisplayFloat)
            feetInchDisplay = ""
        }
        else {
            let weightDisplayFloat = weightInput * 2.20462
            weightDisplay = String(weightDisplayFloat)
            feetInchDisplay = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
