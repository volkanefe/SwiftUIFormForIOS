//
//  ContentView.swift
//  testIOS
//
//  Created by VOLKAN EFE on 26.03.2024.
//

import SwiftUI





struct ContentView: View {

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var shouldSendNewsletter = false
    @State private var numberOfLikes = 1

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Information")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                }

                Section(header: Text("Actions")){
                    Toggle("Send Newsletter", isOn: $shouldSendNewsletter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number Of Likes", value: $numberOfLikes, in: 1...100)
                    Text("This number is \(numberOfLikes)")
                    Link("Apple",destination: URL(string: "https://www.apple.com")!)

                }
            }

            .navigationTitle("Account")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        hideKeyboard()
                    }label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }

                    Button("Save", action: saveUser)
                }
            }
        }
        .accentColor(.red)
    }

    
    func saveUser(){
        print("User saved.")
    }
}

//struct MyPreviewProvider_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


