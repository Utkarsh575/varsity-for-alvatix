import SwiftUI


struct NavItem: Identifiable , Hashable {
    var id = UUID();
    var name  : String ;
    var menu : Menu;
    
    
    
}
enum Menu : String {
    case basic
    case intermediate
    case advance
}
struct TopicView: View {
    @State public var currentIndex = 1;

    @State public var currPage : Int = 0;


    @State public var showTopicView : Bool ;
    
    
    let navItems = [
        NavItem(name:  "Crytpo Currency Basics 🙇‍♂️" , menu: .basic),
        NavItem( name: "Using Alvatix to ace the game 🧠" , menu : .intermediate),
        NavItem(name: "Metrics to identify good trades 🔎" , menu : .advance )

    ]
    var body: some View {
        VStack{
            
        
//            Text("Topics").foregroundColor(.white)
//            Text(String(currPage)).foregroundColor(.white)
            
//            HStack{
//                ForEach(0..<7) { _ in
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(Color.blue)
//                        .frame(width: 150, height: 200)
//                        .padding(10)
            //                }
//            }
            
            NavigationStack{
                Text("Select a Module to start learning📚 ").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading).padding(.leading,20).padding(.top,30).bold().font(.largeTitle) 
                List(navItems , id : \.self) { item in NavigationLink(item.name , value:item).padding(25).font(.largeTitle).bold()        .navigationDestination(for: NavItem.self, destination: {
                    item in switch item.menu {
                    
                    case .basic :
                        ContentView(curPage: 1)
                    case .intermediate :
                        ContentView(curPage: 2)
                    case .advance :
                        ContentView(curPage: 3)
                    }    
                 })
                }
                Image("Hero").resizable().frame(width: 600 , height: 450).cornerRadius(10)

            }.navigationTitle("Select a Module to begin").frame(height: .infinity)
//            VStack(spacing: 10) {
//                
//                HStack(spacing:2){
//                    
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(Color.green)
//                        .frame(width: 230, height: 200)
//                        .padding(10)
//                        .overlay { 
//                            VStack{
//                                Text("Crypto currency Basics").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
//                                Text("01").font(.subheadline).italic().padding(.leading,170).padding(.top,75)
//
//                            }           
//                        }.onTapGesture{
//                            currPage = 1;
//                            showTopicView = true;
//                        }
//                    
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(Color.blue)
//                        .frame(width: 230, height: 200)
//                        .padding(10)
//                }
//                
//                HStack(spacing:2){
//                    
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(Color.blue)
//                        .frame(width: 230, height: 200)
//                        .padding(10)
//                        .overlay { 
//                            Text("meow")
//                        }
//                    
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(Color.blue)
//                        .frame(width: 230, height: 200)
//                        .padding(10)
//                }
//
//                }

                
            
            
            
            
        
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity , alignment: .top).background(.black)

    }

    
}

