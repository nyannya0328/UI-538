//
//  LineGraph.swift
//  UI-538
//
//  Created by nyannyan0328 on 2022/04/13.
//

import SwiftUI

struct LineGraph: View {
    var data : [CGFloat]
    
    @GestureState var isDragging : Bool = false
    @State var currentPlot : String = ""
    
    @State var offset : CGSize = .zero
    
    
    @State var showPlot : Bool = false
    @State var translation : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            let height = proxy.size.height
            let widht = (proxy.size.width) / CGFloat(data.count - 1)
            let maxPoint = data.max() ?? 0
            
            
            let points = data.enumerated().compactMap { item -> CGPoint in
                
                
                let progress = item.element / maxPoint
                
                let pathHeight = progress * height
                
                let pathWidh = widht * CGFloat(item.offset)
                
                return CGPoint(x: pathWidh, y: -pathHeight + height)
                
            }
            
            ZStack{
                
                Path{path in
                    
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLines(points)
                }
                .stroke(style: StrokeStyle(lineWidth: 1.3, lineCap: .round, lineJoin: .round))
                .fill(
                
                
                    LinearGradient(colors: [
                    
                    
                        Color("Gradient1"),
                        Color("Gradient2"),
                    
                    ], startPoint: .leading, endPoint: .trailing)
                )
                
                
                FillBG()
                    .clipShape(
                    
                        
                        Path{path in
                            
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLines(points)
                            path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                            path.addLine(to: CGPoint(x: 0, y: height))
                        }
                    
                    )
                
                
                
                
            }
            .overlay(alignment: .bottomLeading, content: {
                
                
                VStack(spacing:0){
                    
                    Text(currentPlot)
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .padding(.vertical,6)
                        .padding(.horizontal,10)
                        .background(
                            
                            Capsule()
                                .fill(Color("Gradient1")))
                        .offset(x: translation < 10 ? 30 : 0)
                        .offset(x: translation > (proxy.size.width - 60) ? -30 : 0)
                    
                    Rectangle()
                        .fill(Color("Gradient1"))
                        .frame(width: 1, height: 40)
                        .padding(.top)
                    
                    Circle()
                        .fill(Color("Gradient1"))
                        .frame(width: 22, height: 22)
                        .overlay {
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 10, height: 10)
                        }
                    
                    
                    
                    Rectangle()
                        .fill(Color("Gradient1"))
                        .frame(width: 1, height: 50)
                    
                    
                    
                        
                    
                }
                .frame(width: 80, height: 170)
                .offset(offset)
                .offset(y: 70)
                .opacity(showPlot ? 1 : 0)
              
                
            })
            .contentShape(Rectangle())
            .gesture(
            
                DragGesture().updating($isDragging, body: { _, out, _ in
                    out = true
                }).onChanged({ value in
                    
                    withAnimation{showPlot = true}
                    
                    let traslation = value.location.x - 20
                    
                    let index = max(min(Int((traslation / widht).rounded() + 1), data.count - 1)
                                    , 0)
                    currentPlot = "$\(data[index])"
                    
                    self.translation = traslation
                    
                    offset = CGSize(width: points[index].x - 40, height: points[index].y - height)
                    
                   
                    
                }).onEnded({ value in
                    
                    withAnimation{showPlot = false}
                })
                
                
                
            
            
            )
            
           
        }
      
        .overlay(alignment: .leading, content: {
            
            
            VStack(alignment: .leading, spacing: 13) {
                
                let max = data.max() ?? 0
                
                Text("\(Int(max))")
                
                
                Spacer()
                
                
                Text("$0")
                    .font(.caption.bold())
                
            }
            
            
        })
        .padding(.horizontal,10)
    }
    @ViewBuilder
    func FillBG()->some View{
        
        LinearGradient(colors: [
            
            
            Color("Gradient2").opacity(0.3),
            Color("Gradient2").opacity(0.2),
            Color("Gradient2").opacity(0.1),
            Color("Gradient1").opacity(0.3),
        
        
        
        
        ] + Array(repeating: Color("Gradient1").opacity(0.1), count: 4) + Array(repeating: .clear.opacity(0.1), count: 2) , startPoint: .top, endPoint: .bottom)
    }
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
