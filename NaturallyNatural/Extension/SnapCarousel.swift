//
//  SnapCarousel.swift
//  NaturallyNatural
//
//  Created by JunHyuk Lim on 7/12/2022.
//

import SwiftUI

struct SnapCarousel<Content: View, T: Identifiable>: View {
    //MARK: - PROPERTIES
    var content: (T) -> Content
    var list :[T]
    
    var spacing: CGFloat
    var trailingSpace : CGFloat
    @Binding var index : Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items:[T], @ViewBuilder content : @escaping (T) -> Content){
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    //Offset
    @GestureState var offset : CGFloat = 0
    @State var currentIndex : Int = 0
    
    //MARK: - BODY
    var body: some View {
        GeometryReader{proxy in
 
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing){
                ForEach(list){item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            //Setting only after 0th index
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundInex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundInex),list.count - 1),0)
                        
                        currentIndex = index
                        
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundInex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundInex),list.count - 1),0)

                    })
            )
        }
        //Animating when offset = 0
        .animation(.easeInOut, value: offset == 0)
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
