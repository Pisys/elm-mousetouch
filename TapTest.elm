import Html exposing (div, text, button)
import TapBox exposing (TapBox, tapbox, click)
import Time exposing (second)

type Action = Increment | Decrement | NoOp

myTapBox : TapBox Action
myTapBox = tapbox NoOp second

view tapbox model =
  div [] 
    [ button ( tapbox.on click Decrement ) [ text "-" ]
    , div [] [ text (toString model) ]
    , button ( tapbox.on click Increment ) [ text "+" ]
    ]

update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
    
main = Signal.map (view myTapBox) 
       <| Signal.foldp update 0 myTapBox.signal
