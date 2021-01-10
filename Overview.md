## Know error so far
1. When you click left/right hand icon button in the home page repeatedly in fast pace, then it will throw an error of: 
 ```
The following assertion was thrown while finalizing the widget tree:
_AnimateButtonState#47e2d(tickers: tracking 1 ticker) was disposed with an active Ticker.

_AnimateButtonState created a Ticker via its TickerProviderStateMixin, but at the time dispose() was called on the mixin, that Ticker was still active. All Tickers must be disposed before calling super.dispose().
```

- Had to fix this


https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51