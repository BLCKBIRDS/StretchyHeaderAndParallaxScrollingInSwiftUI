//File: ContentView.swift
//Project: StretchyHeaderAndParallaxEffect

//Created at 24.11.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                ZStack {
                    if geometry.frame(in: .global).minY <= 0 {
                        Image("header")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .clipped()
                    } else {
                        Image("header")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
                .frame(height: 400)
            VStack(alignment: .leading) {
                HStack {
                    Image("author")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Article by")
                            .font(.custom("AvenirNext-Regular", size: 15))
                            .foregroundColor(.gray)
                        Text("John Doe")
                            .font(.custom("AvenirNext-Demibold", size: 15))
                    }
                }
                    .padding(.top, 20)
                Text("Lorem ipsum dolor sit amet")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .lineLimit(nil)
                    .padding(.top, 10)
                Text("3 min read • 22. November 2019")
                    .font(.custom("AvenirNext-Regular", size: 15))
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                Text(articleContent)
                    .font(.custom("AvenirNext-Regular", size: 20))
                    .lineLimit(nil)
                    .padding(.top, 30)
            }
                .frame(width: 350)
        }
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let articleContent =

"""
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

At vero eos et accusam et justo duo dolores et ea rebum.

Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""
