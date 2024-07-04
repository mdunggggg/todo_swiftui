//
//  NoItemsView.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 4/7/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animated : Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 10){
                    Text("There are no items!")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                        .padding(.bottom)
                    NavigationLink {
                        AddTodoView()
                    } label: {
                        Text("Add something 🥳")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(animated ? .red : .accentColor)
                            .cornerRadius(10)
                            .padding(.horizontal, animated ? 50 : 30)
                            .scaleEffect(animated ? 1.0 : 1.1)
                            .offset(y: animated ? -7 : 0)
                            .shadow(color: animated ? .red : .accentColor, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }


                }
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimate)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Title")
        }
    }
    
    func addAnimate(){
        guard !animated else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(.easeInOut(duration: 1.5).repeatForever()){
                animated.toggle()
            }
        })
    }
}

#Preview {
    NoItemsView()
}
