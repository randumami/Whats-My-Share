#  Whats My Share

This is the beginning of an app where the user can add there shares and get the current valuation of the shares in their local currency.

to use the app the user needs to add a share symbol, number of shares bought, currency and perhaps date bought.

This is a play project for me, so feel free to comment any code, should you stumble upon this repo.

This project was created for me to play around with patterns MVVM and others. So please dont expect everything to be functioning at all times.

if you do want to compile it ....

## remember to make an enum with you api key from https://www.alphavantage.co/support/#api-key
```swift
 enum keys {
      static var api_advantage_key = "YOURKEYHERE"
 }
```

### ToDO:
- implement currency functionality, right now the exchange value is always 1.00 and everything is dollars
- play som more
- fix the errors...
