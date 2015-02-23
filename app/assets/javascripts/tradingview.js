
function loadTradingView(symbol) {
    new TradingView.widget({
      "width": 750,
      "height": 610,
      "symbol": symbol,
      "interval": "W",
      "timezone": "exchange",
      "theme": "White",
      "style": "3",
      "toolbar_bg": "#f1f3f6",
      "withdateranges": true,
      "allow_symbol_change": true,
      "details": true,
      "hideideas": true,
    });
};

