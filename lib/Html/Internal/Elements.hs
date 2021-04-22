-- Generated. See gentool.js.
{-# LANGUAGE OverloadedStrings, StandaloneDeriving, FlexibleInstances, QuantifiedConstraints #-}
module Html.Internal.Elements where

import Html.Internal.Attributes (Attribute)
import Data.String (IsString)

data Tag = 
      A
    | Abbr
    | Address
    | Area
    | Article
    | Aside
    | Audio
    | B
    | Base
    | Bdi
    | Bdo
    | Blockquote
    | Body
    | Br
    | Button
    | Canvas
    | Caption
    | Cite
    | Code
    | Col
    | Colgroup
    | Data
    | Datalist
    | Dd
    | Del
    | Details
    | Dfn
    | Dialog
    | Div
    | Dl
    | Dt
    | Em
    | Embed
    | Fieldset
    | Figcaption
    | Figure
    | Footer
    | Form
    | H1
    | H2
    | H3
    | H4
    | H5
    | H6
    | Head
    | Header
    | Hgroup
    | Hr
    | Html
    | I
    | Iframe
    | Img
    | Input
    | Ins
    | Kbd
    | Label
    | Legend
    | Li
    | Link
    | Main
    | Map
    | Mark
    | Math
    | Menu
    | Meta
    | Meter
    | Nav
    | Noscript
    | Object
    | Ol
    | Optgroup
    | Option
    | Output
    | P
    | Param
    | Picture
    | Pre
    | Progress
    | Q
    | Rp
    | Rt
    | Ruby
    | S
    | Samp
    | Script
    | Section
    | Select
    | Slot
    | Small
    | Source
    | Span
    | Strong
    | Style
    | Sub
    | Summary
    | Sup
    | Svg
    | Table
    | Tbody
    | Td
    | Template
    | Textarea
    | Tfoot
    | Th
    | Thead
    | Time
    | Title
    | Tr
    | Track
    | U
    | Ul
    | Var
    | Video
    | Wbr
    deriving (Eq, Ord, Show, Read)

data Html t a = 
      Element Tag (t (Attribute a)) (t (Html t a))
    | Doctype
    | Text a
    | Comment a

deriving instance (Eq a, forall b. Eq b => Eq (t b)) => Eq (Html t a)
deriving instance (Show a, forall b. Show b => Show (t b)) => Show (Html t a)
deriving instance (Read a, forall b. Read b => Read (t b)) => Read (Html t a)

a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data_, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main_, map, mark, math, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, param, picture, pre, progress, q, rp, rt, ruby, s, samp, script, section, select, slot, small, source, span, strong, style, sub, summary, sup, svg, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr :: IsString a => t (Attribute a) -> t (Html t a) -> Html t a
a = Element A
abbr = Element Abbr
address = Element Address
area = Element Area
article = Element Article
aside = Element Aside
audio = Element Audio
b = Element B
base = Element Base
bdi = Element Bdi
bdo = Element Bdo
blockquote = Element Blockquote
body = Element Body
br = Element Br
button = Element Button
canvas = Element Canvas
caption = Element Caption
cite = Element Cite
code = Element Code
col = Element Col
colgroup = Element Colgroup
data_ = Element Data
datalist = Element Datalist
dd = Element Dd
del = Element Del
details = Element Details
dfn = Element Dfn
dialog = Element Dialog
div = Element Div
dl = Element Dl
dt = Element Dt
em = Element Em
embed = Element Embed
fieldset = Element Fieldset
figcaption = Element Figcaption
figure = Element Figure
footer = Element Footer
form = Element Form
h1 = Element H1
h2 = Element H2
h3 = Element H3
h4 = Element H4
h5 = Element H5
h6 = Element H6
head = Element Head
header = Element Header
hgroup = Element Hgroup
hr = Element Hr
html = Element Html
i = Element I
iframe = Element Iframe
img = Element Img
input = Element Input
ins = Element Ins
kbd = Element Kbd
label = Element Label
legend = Element Legend
li = Element Li
link = Element Link
main_ = Element Main
map = Element Map
mark = Element Mark
math = Element Math
menu = Element Menu
meta = Element Meta
meter = Element Meter
nav = Element Nav
noscript = Element Noscript
object = Element Object
ol = Element Ol
optgroup = Element Optgroup
option = Element Option
output = Element Output
p = Element P
param = Element Param
picture = Element Picture
pre = Element Pre
progress = Element Progress
q = Element Q
rp = Element Rp
rt = Element Rt
ruby = Element Ruby
s = Element S
samp = Element Samp
script = Element Script
section = Element Section
select = Element Select
slot = Element Slot
small = Element Small
source = Element Source
span = Element Span
strong = Element Strong
style = Element Style
sub = Element Sub
summary = Element Summary
sup = Element Sup
svg = Element Svg
table = Element Table
tbody = Element Tbody
td = Element Td
template = Element Template
textarea = Element Textarea
tfoot = Element Tfoot
th = Element Th
thead = Element Thead
time = Element Time
title = Element Title
tr = Element Tr
track = Element Track
u = Element U
ul = Element Ul
var = Element Var
video = Element Video
wbr = Element Wbr

area', base', br', col', embed', hr', img', input', link', meta', param', source', track', wbr' :: (IsString a, forall b. Monoid (t b)) => t (Attribute a) -> Html t a
area' as = Element Area as mempty
base' as = Element Base as mempty
br' as = Element Br as mempty
col' as = Element Col as mempty
embed' as = Element Embed as mempty
hr' as = Element Hr as mempty
img' as = Element Img as mempty
input' as = Element Input as mempty
link' as = Element Link as mempty
meta' as = Element Meta as mempty
param' as = Element Param as mempty
source' as = Element Source as mempty
track' as = Element Track as mempty
wbr' as = Element Wbr as mempty

tagName :: IsString a => Tag -> a
tagName A = "a"
tagName Abbr = "abbr"
tagName Address = "address"
tagName Area = "area"
tagName Article = "article"
tagName Aside = "aside"
tagName Audio = "audio"
tagName B = "b"
tagName Base = "base"
tagName Bdi = "bdi"
tagName Bdo = "bdo"
tagName Blockquote = "blockquote"
tagName Body = "body"
tagName Br = "br"
tagName Button = "button"
tagName Canvas = "canvas"
tagName Caption = "caption"
tagName Cite = "cite"
tagName Code = "code"
tagName Col = "col"
tagName Colgroup = "colgroup"
tagName Data = "data"
tagName Datalist = "datalist"
tagName Dd = "dd"
tagName Del = "del"
tagName Details = "details"
tagName Dfn = "dfn"
tagName Dialog = "dialog"
tagName Div = "div"
tagName Dl = "dl"
tagName Dt = "dt"
tagName Em = "em"
tagName Embed = "embed"
tagName Fieldset = "fieldset"
tagName Figcaption = "figcaption"
tagName Figure = "figure"
tagName Footer = "footer"
tagName Form = "form"
tagName H1 = "h1"
tagName H2 = "h2"
tagName H3 = "h3"
tagName H4 = "h4"
tagName H5 = "h5"
tagName H6 = "h6"
tagName Head = "head"
tagName Header = "header"
tagName Hgroup = "hgroup"
tagName Hr = "hr"
tagName Html = "html"
tagName I = "i"
tagName Iframe = "iframe"
tagName Img = "img"
tagName Input = "input"
tagName Ins = "ins"
tagName Kbd = "kbd"
tagName Label = "label"
tagName Legend = "legend"
tagName Li = "li"
tagName Link = "link"
tagName Main = "main"
tagName Map = "map"
tagName Mark = "mark"
tagName Math = "math"
tagName Menu = "menu"
tagName Meta = "meta"
tagName Meter = "meter"
tagName Nav = "nav"
tagName Noscript = "noscript"
tagName Object = "object"
tagName Ol = "ol"
tagName Optgroup = "optgroup"
tagName Option = "option"
tagName Output = "output"
tagName P = "p"
tagName Param = "param"
tagName Picture = "picture"
tagName Pre = "pre"
tagName Progress = "progress"
tagName Q = "q"
tagName Rp = "rp"
tagName Rt = "rt"
tagName Ruby = "ruby"
tagName S = "s"
tagName Samp = "samp"
tagName Script = "script"
tagName Section = "section"
tagName Select = "select"
tagName Slot = "slot"
tagName Small = "small"
tagName Source = "source"
tagName Span = "span"
tagName Strong = "strong"
tagName Style = "style"
tagName Sub = "sub"
tagName Summary = "summary"
tagName Sup = "sup"
tagName Svg = "svg"
tagName Table = "table"
tagName Tbody = "tbody"
tagName Td = "td"
tagName Template = "template"
tagName Textarea = "textarea"
tagName Tfoot = "tfoot"
tagName Th = "th"
tagName Thead = "thead"
tagName Time = "time"
tagName Title = "title"
tagName Tr = "tr"
tagName Track = "track"
tagName U = "u"
tagName Ul = "ul"
tagName Var = "var"
tagName Video = "video"
tagName Wbr = "wbr"

voidElement :: Tag -> Bool
voidElement A = False
voidElement Abbr = False
voidElement Address = False
voidElement Area = True
voidElement Article = False
voidElement Aside = False
voidElement Audio = False
voidElement B = False
voidElement Base = True
voidElement Bdi = False
voidElement Bdo = False
voidElement Blockquote = False
voidElement Body = False
voidElement Br = True
voidElement Button = False
voidElement Canvas = False
voidElement Caption = False
voidElement Cite = False
voidElement Code = False
voidElement Col = True
voidElement Colgroup = False
voidElement Data = False
voidElement Datalist = False
voidElement Dd = False
voidElement Del = False
voidElement Details = False
voidElement Dfn = False
voidElement Dialog = False
voidElement Div = False
voidElement Dl = False
voidElement Dt = False
voidElement Em = False
voidElement Embed = True
voidElement Fieldset = False
voidElement Figcaption = False
voidElement Figure = False
voidElement Footer = False
voidElement Form = False
voidElement H1 = False
voidElement H2 = False
voidElement H3 = False
voidElement H4 = False
voidElement H5 = False
voidElement H6 = False
voidElement Head = False
voidElement Header = False
voidElement Hgroup = False
voidElement Hr = True
voidElement Html = False
voidElement I = False
voidElement Iframe = False
voidElement Img = True
voidElement Input = True
voidElement Ins = False
voidElement Kbd = False
voidElement Label = False
voidElement Legend = False
voidElement Li = False
voidElement Link = True
voidElement Main = False
voidElement Map = False
voidElement Mark = False
voidElement Math = False
voidElement Menu = False
voidElement Meta = True
voidElement Meter = False
voidElement Nav = False
voidElement Noscript = False
voidElement Object = False
voidElement Ol = False
voidElement Optgroup = False
voidElement Option = False
voidElement Output = False
voidElement P = False
voidElement Param = True
voidElement Picture = False
voidElement Pre = False
voidElement Progress = False
voidElement Q = False
voidElement Rp = False
voidElement Rt = False
voidElement Ruby = False
voidElement S = False
voidElement Samp = False
voidElement Script = False
voidElement Section = False
voidElement Select = False
voidElement Slot = False
voidElement Small = False
voidElement Source = True
voidElement Span = False
voidElement Strong = False
voidElement Style = False
voidElement Sub = False
voidElement Summary = False
voidElement Sup = False
voidElement Svg = False
voidElement Table = False
voidElement Tbody = False
voidElement Td = False
voidElement Template = False
voidElement Textarea = False
voidElement Tfoot = False
voidElement Th = False
voidElement Thead = False
voidElement Time = False
voidElement Title = False
voidElement Tr = False
voidElement Track = True
voidElement U = False
voidElement Ul = False
voidElement Var = False
voidElement Video = False
voidElement Wbr = True
