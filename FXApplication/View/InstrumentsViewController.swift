//
//  InstrumentsViewController.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 1.02.2023.
//

import UIKit

class InstrumentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    //private var currencyRatesViewModel : CurrencyViewModel
    //private var exchangeCurrencyViewModel : ExchangeCurrencyViewModel!
    private var responseListViewModel : ResponseListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 0/255, green: 107/255, blue: 214/255, alpha: 1.0),
            UIColor(red: 0/255, green: 163/255, blue: 196/255, alpha: 1.0),
            UIColor(red: 0/255, green: 84/255, blue: 168/255, alpha: 1.0),
            UIColor(red: 0/255, green: 59/255, blue: 112/255, alpha: 1.0),
            UIColor(red: 0/255, green: 198/255, blue: 229/255, alpha: 1.0)
        ]
        
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.responseListViewModel == nil ? 0 : self.responseListViewModel.numberOfRowsInSection()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyTableViewCell
        
        let responseViewModel = self.responseListViewModel.responseAtIndex(indexPath.row)
        cell.currencyText.text = responseViewModel.symbol
        cell.priceText.text = responseViewModel.currentPrice
        cell.priceSellText.text = responseViewModel.low
        
        let currencyCodeArray = responseViewModel.symbol.components(separatedBy: "/")
        let convertedCode = currencyCodeArray[0]
        
        cell.buyText.text = "\(convertedCode) SELL"
        cell.sellText.text = "\(convertedCode) BUY"
        
        
        cell.backgroundColor = self.colorArray[indexPath.row % 5]
        
        return cell
    }
    
    func getData() {
        let url = URL(string: "https://fcsapi.com/api-v3/forex/latest?symbol=EUR/USD,USD/JPY,GBP/CHF&access_key=oHgoAvl7sQpOyzdKFmsHhRe4t")!
        
        let allForexUrl = URL(string: "https://fcsapi.com/api-v3/forex/candle?symbol=all_forex&period=1h&access_key=oHgoAvl7sQpOyzdKFmsHhRe4t")!
        /*var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("97zGQLYNBsOzd7lK6qL80ch93qH2T8D8", forHTTPHeaderField: "apikey")*/
     
        ExchangeRatesService().getExchangeCurrencies(url: allForexUrl) { currencies in
        
            if let currencies = currencies {
                self.responseListViewModel = ResponseListViewModel(responseList: currencies.response)
                print(self.responseListViewModel)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            /*if let exchangeCurrencies = exchangeCurrencies {
                //self.exchangeCurrencyViewModel = ExchangeCurrencyViewModel(exchangeCurrency: exchangeCurrencies)
                self.responseListViewModel = ResponseListViewModel(responseList: exchangeCurrencies.response)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }*/
        }
    }
}
