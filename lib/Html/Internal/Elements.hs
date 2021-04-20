-- Generated. See gentool.js.
{-# LANGUAGE OverloadedStrings, StandaloneDeriving, FlexibleInstances #-}
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
    deriving (Eq, Ord, Show)

data Html t a = 
      Element Tag (t (Attribute a)) (t (Html t a))
    | Text a
    | Comment a

deriving instance Eq a => Eq (Html [] a)
deriving instance Ord a => Ord (Html [] a)
deriving instance Show a => Show (Html [] a)

a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data_, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main_, map, mark, math, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, param, picture, pre, progress, q, rp, rt, ruby, s, samp, script, section, select, slot, small, source, span, strong, style, sub, summary, sup, svg, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr :: t (Attribute a) -> t (Html t a) -> Html t a
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
