{-# LANGUAGE OverloadedStrings #-}
module Html.Elements (
    module Html.Internal.Elements,
    serialize
) where

import Html.Attributes (serializeAttr)
import Html.Internal.Elements 
import Data.String (IsString)
import Data.Foldable (foldl')

serialize :: (Foldable t, Semigroup a, IsString a) => Element t a -> a
serialize (Text t) = t
serialize el = foldl' plusEl startTag (elems el) <> endTag
    where 
        plusEl str = (str <>) . serialize 
        attributes = foldl' (\str attr -> str <> " " <> serializeAttr attr) "" (attrs el)
        name = elemName el 
        startTag = ("<" <> name <> attributes <> ">")
        endTag = "</" <> name <> ">" 