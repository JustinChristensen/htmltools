{-# LANGUAGE OverloadedStrings #-}
module Html.Attributes (
    module Html.Internal.Attributes,
    serializeAttr
) where

import Html.Internal.Attributes
import Data.String (IsString)

serializeAttr :: (Semigroup a, IsString a) => Attribute a -> a
serializeAttr attr = attrName attr <> "=" <> quote (attrVal attr)
    where quote x = "\"" <> x <> "\""