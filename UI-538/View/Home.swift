//
//  Home.swift
//  UI-538
//
//  Created by nyannyan0328 on 2022/04/13.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            
            HStack{
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "slider.vertical.3")
                        .font(.system(size: 20, weight: .bold))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }


            }
            .overlay(content: {
                
                Text("Nyan Nyan Graph".uppercased())
                    .font(.body.weight(.semibold))
                    .foregroundColor(.white)
                    .shadow(color: .red.opacity(0.9), radius: 5, x: 5, y: 5)
                    .shadow(color: .red.opacity(0.5), radius: 5, x: +5, y: -5)
                    
            })
            .padding(.horizontal)
            .foregroundColor(.black)
            
            
            
            VStack{
                
                
                Text("Total Balance")
                    .font(.title2.weight(.semibold))
                    .padding(.bottom,5)
                
                Text("51 200")
                    .font(.largeTitle.weight(.black))
                
            }
                
                
                Button {
                    
                } label: {
                    
                    Label {
                        
                        Image(systemName: "chevron.down")
                        
                    } icon: {
                        
                        Text("Income")
                    }

                }
                .foregroundColor(.black)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background{
                    
                    Capsule()
                        .fill(.white)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: +5, y: -5)
                }
            
            
            LineGraph(data: sample)
                .frame(height:250)
            
            
            Text("ShortCuts".uppercased())
                .font(.largeTitle.weight(.black))
                .padding(.leading,10)
                .lLeading()
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:20){
                    
                    
                    
                    CardView(image: "youtube", title: "YOU TUBE", price: "$ 26", color: Color("Gradient1"))
                    
                    CardView(image: "apple", title: "Apple", price: "$ 2600", color: Color("Gradient2"))
                    
                    CardView(image: "xbox", title: "XBox", price: "$120", color: Color.red)
                    
                }
                .padding()
                
            }
                
                
            
            
            
            
            
        }
        .maxTop()
        .background{
            
            Color("BG")
        }
    }
    @ViewBuilder
    func CardView(image : String,title : String,price : String,color : Color)->some View{
        
        
        VStack(spacing:18){
            
            
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .padding(16)
                .background(
                
                Capsule()
                    .fill(color)
                )
            
            Text(title)
                .font(.title3.weight(.medium))
                .foregroundColor(color)
            
            
            Text(price)
                .font(.title.weight(.black))
                .foregroundColor(.gray)
            
            
                
            
        }
        .padding(.vertical)
        .padding(.horizontal,30)
        
        .background(
        
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
        
        )
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let sample : [CGFloat] = [

    989,1200,750,790,650,950,1200,600,500,600,890,1203,1400,900,1250,
1600,1200

]



extension View{
    
    func getRect()->CGRect{
        
        
        return UIScreen.main.bounds
    }
    
    func lLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
    func lTreading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .trailing)
    }
    func lCenter()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .center)
    }
    
    func maxHW()->some View{
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity)
        
    
    }

 func maxTop() -> some View{
        
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
            
    }
    
}
