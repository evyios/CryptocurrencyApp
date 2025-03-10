//
//  DetailSource.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 9.03.25.
//

import Foundation
import Combine


class DetailSource {
    
    @Published var coinDetails: CoinDetail? = nil
    
    var detailSubscription: AnyCancellable?
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        fetchCoinDetail()
    }
    
    private func fetchCoinDetail() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        detailSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                        response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
        }
            .receive(on: DispatchQueue.main)
            .decode(type: CoinDetail.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] downloadedCoinsDetail in
                self?.coinDetails = downloadedCoinsDetail
                self?.detailSubscription?.cancel()
            }

    }
}
