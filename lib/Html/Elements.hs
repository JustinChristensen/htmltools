{-# LANGUAGE OverloadedStrings, RankNTypes, NamedFieldPuns #-}
module Html.Elements (
    module Html.Internal.Elements,
    Html',
    comment, text,
    attrs, elems,
    defaultSerializeOpts,
    serializeOpts,
    serialize
) where

import Html.Attributes (Attribute, serializeAttr)
import Html.Internal.Elements 
import Data.String (IsString)
import Data.Foldable (foldl')

data SerializeOpts = SerializeOpts {
        voidEl :: forall t a. Html t a -> Bool
    } 

type Html' = Html [] String

defaultSerializeOpts :: SerializeOpts
defaultSerializeOpts = SerializeOpts { 
        voidEl = const False
    } 

serializeOpts :: (Foldable t, Semigroup a, IsString a) => SerializeOpts -> Html t a -> a
serializeOpts _ (Text t) = t
serializeOpts _ (Comment t) = "<!-- " <> t <> " -->"
serializeOpts opts@SerializeOpts{ } (Element tag as es) = foldl' plusEl startTag es <> endTag
    where 
        plusEl str = (str <>) . serializeOpts opts
        attributes = foldl' (\str attr -> str <> " " <> serializeAttr attr) "" as
        name = tagName tag 
        startTag = ("<" <> name <> attributes <> ">")
        endTag = "</" <> name <> ">" 

serialize :: (Foldable t, Semigroup a, IsString a) => Html t a -> a
serialize = serializeOpts defaultSerializeOpts

comment :: a -> Html t a
comment = Comment

text :: a -> Html t a
text = Text

attrs :: IsString a => Html t a -> t (Attribute a)
attrs (Element _ as _) = as
attrs (Text _) = error "text nodes cannot have attributes"
attrs (Comment _) = error "comments cannot have attributes"

elems :: IsString a => Html t a -> t (Html t a)
elems (Element _ _ es) = es
elems (Text _) = error "text nodes cannot have child elements"
elems (Comment _) = error "comments cannot have child elements"
