//
//  ContentView.swift
//  ButtonTesting
//
//  Created by Jason Cox on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedAge: Int = 18
    @State private var votingMessage: String = "Register to Vote!"
    @State private var textInput = ""
    @State private var textInput2 = ""
    @FocusState private var focus: FormFieldFocus?

    enum FormFieldFocus: Hashable {
        case firstname, lastname
    }
    
    var body: some View {
        VStack {
            Image(systemName: "highlighter")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            TextField("First Name", text: $textInput)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    print("Thanks for registering, \(textInput)")
                }
                .focused($focus, equals: .firstname)
            
            TextField("Last Name", text: $textInput2)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .focused($focus, equals: .lastname)
                         
            Menu {
                ForEach(15...25, id: \.self) { age in
                    Button(action: { selectAge(age) }) {
                        Text("\(age)")
                    }
                }
            } label: {
                Label("Choose your age", systemImage: "list.bullet")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .onAppear {
                focus = .firstname
            }
            
            
            Text(votingMessage)
                .foregroundColor(selectedAge >= 18 ? .green : .red)
                .font(.title)
                .padding()
        }
        .padding()
        
        
    }
    
    

    func selectAge(_ age: Int) {
        selectedAge = age
        if age >= 18 {
            votingMessage = "\(textInput), you can vote!"
        } else {
            votingMessage = "\(textInput), you can't vote :("
        }
    }
}
#Preview {
    ContentView()
}
