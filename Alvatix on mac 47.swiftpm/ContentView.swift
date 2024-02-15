import SwiftUI
import AVKit
struct Card: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let url : String?
    let image : String
}

struct ContentView: View {
 
    
    @State public var currentIndex = 0;
    @State public var curPage : Int ;
    
    let cards: [Card] = [
        Card(title: "Types of Tokens", description: "So many token which one to pick??", url:"", image: ""),
        Card(title: "Types of Traders", description: "Low Risk low reward vs High risk high reward", url:"" ,image: ""),
        Card(title: "How to identify Good trades?", description: "Metrics used by Alvatix", url:"" , image:"")
    ]
    var body: some View {
        VStack{
//            Text("Varsity by Alvatix").foregroundColor(.white).font(.largeTitle).bold().padding(.top , 5)
            
            GeometryReader { geometry in
                
                ZStack {
                    ForEach(cards.indices) { index in
                        CardView(card: cards[index] , currentIndex : index , currpage: curPage)
                            .offset(x: CGFloat(index - currentIndex) * geometry.size.width)
                            .gesture(
                                DragGesture()
                                    .onEnded { value in
                                        withAnimation {
                                            if value.translation.width < -50 && currentIndex < cards.count - 1 {
                                                currentIndex += 1
                                            } else if value.translation.width > 50 && currentIndex > 0 {
                                                currentIndex -= 1
                                            }
                                        }
                                    }
                            )
                    }
                }
            }
            ProgressView(value: Float(currentIndex)/2)
            
        }.background(Image("Group 1-2"))
        
    }
    
}




struct CardView: View {
    let card: Card
    let currentIndex : Int
    let currpage : Int
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.black).shadow(radius: 10)
        //            .background(Image("Group 1").resizable())
            .frame(width: .infinity, height: .infinity)
            .overlay(
                VStack {
        
                    Image(card.image)
                    VStack{
                       if(currpage == 1){
                           Text("Types of Tokens")
                               .font(.title)
                               .fontWeight(.bold)
                               .foregroundColor(.white)
                               .padding(.top, 20)
                           Text("So many token which one to pick??")
                               .foregroundColor(.white)
                               .multilineTextAlignment(.center)
                               .padding().font(.title)
                           
                           if(currentIndex==0){
                   
                           
                               Text("Currency Tokens💰").font(.title2).bold().frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,20)
                               Text("Like Bitcoin and Litecoin, designed primarily as digital currencies for peer-to-peer transactions and store of value.").font(.callout).padding(.horizontal,30).padding(.top,10)
                               Image("currency-tokens").resizable().frame(width: 400 , height: 230).cornerRadius(10)
                               
                               
                               Text("Platform Tokens🎟️").font(.title2).bold().frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10)
                               Text("Such as Ethereum's Ether, utilized to fuel decentralized applications (dApps) and execute smart contracts on their respective platforms.").font(.callout).padding(.horizontal,30).padding(.top,10)
                               Image("platform-token").resizable().frame(width: 400 , height: 230).cornerRadius(10)

                               
                               
                               
                               Spacer()
                               
                           }
                           if(currentIndex==1){

                               Text("Stablecoins🏦").font(.title2).bold().frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,20)

                               Text("Pegged to stable assets like fiat currencies, providing stability and facilitating seamless transactions in the volatile cryptocurrency market.").font(.callout).padding(.horizontal,30).padding(.top,10)
                               Image("stable-coins").resizable().frame(width: 400 , height: 230).cornerRadius(10)

                               Text("Utility Tokens🎫").font(.title2).bold().frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,20)

                           
                               Text("Offered by blockchain projects for accessing specific services or products within their ecosystems, like Binance Coin for reduced trading fees.").font(.callout).padding(.horizontal,30).padding(.top,10)
                               Image("utility-token").resizable().frame(width: 400 , height: 230).cornerRadius(10)

                               
                               
                               Spacer()

                               
                           }
                           if(currentIndex==2){
                               Text("Meme Coins🤡").font(.title2).bold().frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,20)
                               Text("Like Dogecoin and Shiba Inu, originally started as internet jokes, now traded for speculative purposes and community engagement.").font(.callout).padding(.horizontal,30).padding(.top,10)
                               Image("meme-tokens").resizable().frame(width: 400 , height: 230).cornerRadius(10).border(Color.gray).cornerRadius(10)
                               Text("The motive for investment must be clear \nIf you are confident about a platform's growth then go with platform tokens , but if you have faith in the underlying technloogy invest in stable coins and Layer 1 tokens.").font(.callout).padding(.horizontal,30).padding(.top,10)

                               
                               
                               Spacer()

                               
                           }
                       }
                        if(currpage==2){
                            Text("Simplifying your Trading workflows")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 10)

                            if(currentIndex==1){
                                Text("Feartures of Alvatix")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10)

                                VideoPlayerView(videoURL: Bundle.main.url(forResource: "alvatix-features", withExtension: "mp4")!)
                                    .frame(width: 400, height: 200)
                                Text("Risk and Reward Calibration").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10).bold().font(.title3)

                                Text("Trade setups come with clear risk-reward ratios and stop-loss indications, allowing for well-informed decision-making.").font(.callout).padding(.horizontal,20).padding(.top,20)

                                Text("Real-Time Analytics").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,20).bold().font(.title3)
                                
                                Text("Real-time data analytics ensures that users have access to the latest information available in the market.").font(.callout).padding(.horizontal,20).padding(.top,20)
                                
                                
                                Text("All-Encompassing Metrics & Indicators").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,20).bold().font(.title3)
                                
                                Text("From widely-used technical indicators like MACD and RSI to essential on-chain metrics like TVL and Hashrate, Alvatix offers a holistic view of the market.").font(.callout).padding(.horizontal,20).padding(.top,20)

                                
                                Text("Democratized Access to Trading Intelligence").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,20).bold().font(.title3)
                                
                                Text("A freemium model offers basic trading features to everyone, with advanced tools available for premium users.").font(.callout).padding(.horizontal,20).padding(.top,10)
                                
                                
                                
                                Spacer()
                            }
                            
                            if(currentIndex==0){
                                Text("What is Alvatix")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10)
                                
//                                VideoPlayerView(videoURL: Bundle.main.url(forResource: "alvatix-features", withExtension: "mp4")!)
//                                    .frame(width: 400, height: 200)
//                                Text("Risk and Reward Calibration").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10).bold().font(.title3)
                                
                                Text("Alvatix provides a range of AI-driven cryptocurrency trading tools and strategies, including signals and automated bots designed to accommodate diverse financial objectives and levels of expertise.").font(.callout).padding(.horizontal,30).padding(.top,20)
                                
                                Text("What is our mission?")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10)

                                Text("Our mission is to simplify the cryptocurrency trading environment by consolidating intricate and fragmented data sources, such as on-chain metrics, exchange data, whale wallet activities, technical analysis, and more, into actionable insights and automated strategies.\n\nWe are committed to leveling the playing field in crypto trading by democratizing hedge-fund-grade AI. With Alvatix, we are working towards a cryptocurrency trading landscape that is more accessible and inclusive. For broader participation we will also introduce a token, stay tuned for additional details.").font(.callout).padding(.horizontal,30).padding(.top,10)
                                
                                Text("Why should you use Alvatix?")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10)
                                
                                Text("Profitable trades require research and expertise. The sheer volume of data and market noise in the crypto market can be overwhelming, often leading traders to miss out on valuable opportunities or make ill-informed decisions\n\nWith the power of over 40 AI-driven predictive models, we expertly process an immense 15TB+ of data daily. We monitor over 120 blockchains and more than 1 million labeled wallets. With the integration of comprehensive exchange data dating back to 2020 and the incorporation of 50+ technical indicators, Alvatix delivers precise trading signals and effective strategies. This makes it an invaluable asset for traders in the fast-paced crypto market.").font(.callout).padding(.horizontal,30).padding(.top,10)
                                
                                
                                
    
                                
                                Spacer()
                            }
                            if(currentIndex==2){
                                Text("Fundamentals of Trading")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,10)
                                                                
                                Text("Some trading fundamentals are to be known by a person before they can start trading.").font(.callout).padding(.horizontal,30).padding(.top,10)
                                
                                Text("Entry")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("Entry in trading refers to the price point at which you initially buy or sell an asset, often determined by your trading strategy and analysis. It's essentially the starting point for your trade.").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                Text("Stop Loss")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("Stop loss in trading is a safety net order that automatically sells your asset when it hits a specific price, limiting potential losses and preventing emotional decisions. Think of it as a pre-set `sell if things go bad` .").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                Text("Timeframe")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("Timeframe in trading defines the duration each data point on a chart represents, impacting trading opportunities, holding periods, and risk. Choose a timeframe that aligns with your trading style and goals.").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                Text("R:R")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("R:R stands for Risk-to-Reward ratio. It compares your potential profit to potential loss on a trade. Higher ratios (e.g., 3:1) mean bigger potential gains for the risk you take. Think of it as balancing risk and reward before entering a trade").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                
                                VideoPlayerView(videoURL: Bundle.main.url(forResource: "trade-features", withExtension: "mp4")!).frame(width: 500, height: 220)                                
                                
                                Spacer()
                            }
                        }
                        if(currpage == 3){
                            
                            if(currentIndex == 0){
                                Text("Understang metrics can be hard")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                                Text("Let us simplify it for you")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .font(.title2).padding(.top,10)
                                
                                
                                Text("OnChain⛓")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("provide insights into cryptocurrency trading by analyzing blockchain data, aiding in understanding market trends and investor behavior .").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                
                                Text("Whale Flow🐳")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("Whale flow analysis provides crucial insights into large-scale cryptocurrency transactions, influencing market sentiment and trading decisions .").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                Text("Social Sentiment👥")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("Social sentiment analysis gauges public perception of cryptocurrencies, impacting market sentiment and influencing trading decisions.").font(.callout).padding(.horizontal,30).padding(.top,5)

                                Text("Delta C𝝙P")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("Delta Cap analysis helps identify extremes in Bitcoin market cycles, informing traders about potential turning points and guiding trading strategies").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                
                                Text("Exchange Flow💱")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("Exchange flow monitoring tracks the movement of cryptocurrencies into and out of exchanges, providing valuable insights into investor behavior and market liquidity, influencing trading decisions.").font(.callout).padding(.horizontal,30).padding(.top,5)
                                
                                Text("Technical Analysis🧐")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,30).padding(.top ,5)
                                
                                Text("It utilizes price trends and patterns to inform crypto traders' decisions, influencing their choice of entry and exit points in the market.").font(.callout).padding(.horizontal,30).padding(.top,5)
                                Spacer()

                            }
                        }                    }
                    
                    
                    //                               Text("* **Long term trader** : Adhere to the `HODL` strategy prioritize capital preservation over maximizing returns. They favor established cryptocurrencies like Bitcoin and Ethereum for their stability and widespread adoption. By employing strategies such as dollar-cost averaging and long-term holding, they aim for steady, albeit modest gains. While this approach may bypass the potential for quick, high returns seen in speculative investments, HODLers prioritize stability and consistency in their investment portfolios. This conservative mindset ensures resilience against market volatility and aligns with their goal of long-term wealth preservation. \n\n    * **Short term traders** :  The thrill-seekers, chasing the adrenaline rush of potentially massive gains. They gravitate towards volatile assets and speculative cryptocurrencies, eager to capitalize on price fluctuations. With a penchant for risk-taking, they deploy aggressive trading strategies like day trading and leveraged trading, aiming for quick profits. These traders thrive on market volatility, often embracing the mantra `go big or go home.` While their approach carries significant risks of losses, they are driven by the allure of substantial returns, making each trade an exhilarating gamble in pursuit of financial fortune." as LocalizedStringKey).multilineTextAlignment(.leading).padding().font(.callout)
                    //                               
                    //                               Image("hodl-meme").resizable().frame(width: 350 ,height: 230).cornerRadius(10)
                    
                    
                    
//                    Text("* **OnChain⛓** : provide insights into cryptocurrency trading by analyzing blockchain data, aiding in understanding market trends and investor behavior. \n\n * **Whale Flow🐳** : Whale flow analysis provides crucial insights into large-scale cryptocurrency transactions, influencing market sentiment and trading decisions. \n\n * **Social Sentiment👥** : Social sentiment analysis gauges public perception of cryptocurrencies, impacting market sentiment and influencing trading decisions. \n\n * **Delta C𝝙P** : Delta Cap analysis helps identify extremes in Bitcoin market cycles, informing traders about potential turning points and guiding trading strategies. \n\n * **Exchange Flow💱** : Exchange flow monitoring tracks the movement of cryptocurrencies into and out of exchanges, providing valuable insights into investor behavior and market liquidity, influencing trading decisions. \n\n * **Technical Analysis🧐** : It utilizes price trends and patterns to inform crypto traders' decisions, influencing their choice of entry and exit points in the market." as LocalizedStringKey).multilineTextAlignment(.leading).padding().font(.callout)
//                    
//                    Image("metrics").resizable().frame(width: 450 ,height: 100).cornerRadius(10)
                    
                    
                    //                               Text("* **Currency🤑** :  Like Bitcoin and Litecoin, designed primarily as digital currencies for peer-to-peer transactions and store of value.\n\n * **Platform Tokens🎟️** : Such as Ethereum's Ether, utilized to fuel decentralized applications (dApps) and execute smart contracts on their respective platforms. \n\n * **Stablecoins🏦** : Pegged to stable assets like fiat currencies, providing stability and facilitating seamless transactions in the volatile cryptocurrency market \n\n * **Utility Tokens🎫** : Offered by blockchain projects for accessing specific services or products within their ecosystems, like Binance Coin for reduced trading fees. \n\n * **Meme Coins🤡** Like Dogecoin and Shiba Inu, originally started as internet jokes, now traded for speculative purposes and community engagement." as LocalizedStringKey).multilineTextAlignment(.leading).padding().font(.callout)
                    //                               Image("crypto-confused").resizable().frame(width: 430 , height: 270).cornerRadius(10)
                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity )
            ).padding(.horizontal,40).padding(.bottom , 30)
        
    }
}


struct VideoPlayerView: View {
    let player: AVPlayer
    
    init(videoURL: URL) {
        self.player = AVPlayer(url: videoURL)
        self.player.play() // Start playing the video immediately
    }
    
    var body: some View {
        VideoPlayer(player: player)
            .onDisappear {
                self.player.pause() // Pause the video when the view disappears
            }
    }
}
