{-# LANGUAGE OverloadedStrings, RankNTypes, NamedFieldPuns #-}
module Html.Elements (
    module Html.Internal.Elements,
    Html',
    doctype, comment, text,
    attrs, elems,
    defaultSerializeOpts,
    serializeOpts,
    serialize
) where

import Html.Attributes (Attribute, serializeAttr)
import Html.Internal.Elements 
import Data.String (IsString)
import Data.Foldable (foldl')

type Html' = Html [] String

data SerializeOpts = SerializeOpts {
        voidEl :: Tag -> Bool
    } 

defaultSerializeOpts :: SerializeOpts
defaultSerializeOpts = SerializeOpts { 
        voidEl = voidElement
    } 

serializeOpts :: (Foldable t, Semigroup a, IsString a) => SerializeOpts -> Html t a -> a
serializeOpts _ Doctype = "<!DOCTYPE html>"
serializeOpts _ (Text t) = t
serializeOpts _ (Comment t) = "<!-- " <> t <> " -->"
serializeOpts opts@SerializeOpts{ voidEl } (Element tag as es) 
    | voidEl tag = startTag <> " />"
    | otherwise = foldl' plusEl (startTag <> ">") es <> endTag 
    where 
        plusEl str = (str <>) . serializeOpts opts
        attributes = foldl' (\str attr -> str <> " " <> serializeAttr attr) "" as
        name = tagName tag 
        startTag = "<" <> name <> attributes
        endTag = "</" <> name <> ">" 

serialize :: (Foldable t, Semigroup a, IsString a) => Html t a -> a
serialize = serializeOpts defaultSerializeOpts

doctype :: Html t a
doctype = Doctype

comment :: a -> Html t a
comment = Comment

text :: a -> Html t a
text = Text

attrs :: IsString a => Html t a -> t (Attribute a)
attrs (Element _ as _) = as
attrs Doctype = error "doctypes cannot have attributes"
attrs (Text _) = error "text nodes cannot have attributes"
attrs (Comment _) = error "comments cannot have attributes"

elems :: IsString a => Html t a -> t (Html t a)
elems (Element _ _ es) = es
elems Doctype = error "doctypes cannot have child elements"
elems (Text _) = error "text nodes cannot have child elements"
elems (Comment _) = error "comments cannot have child elements"
