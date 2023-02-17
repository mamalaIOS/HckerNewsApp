//
//  ContentView.swift
//  HackerNews
//
//  Created by Amel Sbaihi on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataManager = DataManager()
    
    
    
    var body: some View {
        
        NavigationView
        {
            List(dataManager.posts) { post in
                
              
                    NavigationLink(destination: DetailView(url: post.url)) {
                        
                        HStack {
                            Text(String(post.points))
                            Text(post.title)                    }
                        
                    }
                        
                    }
                    
                    
                  
            }
            
        
        .navigationTitle("hellouuu")
        
        .onAppear{
            dataManager.fetchData()
        }
        
    }
        
        }
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


