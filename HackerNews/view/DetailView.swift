//
//  DetailView.swift
//  HackerNews
//
//  Created by Amel Sbaihi on 11/14/22.
//

import SwiftUI
import WebKit

struct DetailView: View {
    var url : String?
    
    var body: some View {
        webView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "google.com")
    }
}

struct webView : UIViewRepresentable


{
    
    let urlString : String?
    func makeUIView(context: Context) -> webView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safeString = urlString
        {
            if let url = URL(string: safeString ) {
                
                let request = URLRequest(url: url)
                uiView.load(request)
                    
            }
                
                
            
        }
        
    }
    
}
