module Html.ElementsSpec (spec) where

import Prelude hiding (div)
import Test.Hspec
import Html.Elements
import Html.Attributes (class_, href)

exampleFragment :: Html'
exampleFragment = div [class_ "container"] [
        a [class_ "btn", href "http://foo.com"] [text "click me"],
        p [class_ "quote"] [
            blockquote [] [
                text "The quick brown fox..."
            ]
        ]
    ]

spec :: Spec
spec = do
    describe "serialize" $ do
        it "serializes the ast as an html string" $ do
            putStrLn $ serialize exampleFragment
