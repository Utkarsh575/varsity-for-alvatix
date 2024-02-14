import SwiftUI


@main
struct MyApp: App {
    @State private var showSplashScreen : Bool = true;
     @State  public var currScreen : Int = 0;
    @State public var showPerticularTopic : Bool = false;
    
    var body: some Scene {
        WindowGroup {
            if showSplashScreen{
                Image("AlvatixLogo").resizable()
                    .frame(width: 300, height: 70)
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation (Animation.easeInOut(duration: 1.0).repeatForever()) {
                                
                                showSplashScreen = false
                            }
                        }
                    }
                
            }
            else{
//                ContentView()
                
//                if(showPerticularTopic == false) {
                    TopicView(currPage: currScreen , showTopicView: showPerticularTopic)
//              }
//                if(showPerticularTopic==true){
//                    ContentView(curPage: currScreen)
//                }
            }
        }
    }
}

