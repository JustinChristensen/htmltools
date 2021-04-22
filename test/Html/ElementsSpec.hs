module Html.ElementsSpec (spec) where

import Prelude hiding (div, span, head)
import Test.Hspec
import Html.Elements
import Html.Attributes (class_, href, name, content, rel)

exampleFragment :: Html'
exampleFragment = div [class_ "container"] [
        a [class_ "btn", href "http://foo.com"] [text "click me"],
        p [class_ "quote"] [
            blockquote [] [
                span [] [
                    text "The quick brown fox..."
                ]
            ]
        ]
    ]

voidElFragment :: Html'
voidElFragment = head [] [
        title [] [text "so much fun"],
        meta' [name "description", content "foo bar"],
        meta' [name "viewport", content "width=device-width"],
        link' [rel "stylesheet", href "css/style.css"]
    ]

spec :: Spec
spec = do
    describe "serialize" $ do
        it "serializes the ast as an html string" $ do
            putStrLn $ serialize exampleFragment
        it "serializes void elements" $ do
            putStrLn $ serialize voidElFragment
