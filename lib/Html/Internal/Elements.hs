-- Generated. See gentool.js.
{-# LANGUAGE OverloadedStrings, StandaloneDeriving, FlexibleInstances #-}
module Html.Internal.Elements where

import Html.Internal.Attributes (Attribute)
import Data.String (IsString)

data Element t a = 
      A (t (Attribute a)) (t (Element t a))
    | Abbr (t (Attribute a)) (t (Element t a))
    | Address (t (Attribute a)) (t (Element t a))
    | Area (t (Attribute a)) (t (Element t a))
    | Article (t (Attribute a)) (t (Element t a))
    | Aside (t (Attribute a)) (t (Element t a))
    | Audio (t (Attribute a)) (t (Element t a))
    | B (t (Attribute a)) (t (Element t a))
    | Base (t (Attribute a)) (t (Element t a))
    | Bdi (t (Attribute a)) (t (Element t a))
    | Bdo (t (Attribute a)) (t (Element t a))
    | Blockquote (t (Attribute a)) (t (Element t a))
    | Body (t (Attribute a)) (t (Element t a))
    | Br (t (Attribute a)) (t (Element t a))
    | Button (t (Attribute a)) (t (Element t a))
    | Canvas (t (Attribute a)) (t (Element t a))
    | Caption (t (Attribute a)) (t (Element t a))
    | Cite (t (Attribute a)) (t (Element t a))
    | Code (t (Attribute a)) (t (Element t a))
    | Col (t (Attribute a)) (t (Element t a))
    | Colgroup (t (Attribute a)) (t (Element t a))
    | Data (t (Attribute a)) (t (Element t a))
    | Datalist (t (Attribute a)) (t (Element t a))
    | Dd (t (Attribute a)) (t (Element t a))
    | Del (t (Attribute a)) (t (Element t a))
    | Details (t (Attribute a)) (t (Element t a))
    | Dfn (t (Attribute a)) (t (Element t a))
    | Dialog (t (Attribute a)) (t (Element t a))
    | Div (t (Attribute a)) (t (Element t a))
    | Dl (t (Attribute a)) (t (Element t a))
    | Dt (t (Attribute a)) (t (Element t a))
    | Em (t (Attribute a)) (t (Element t a))
    | Embed (t (Attribute a)) (t (Element t a))
    | Fieldset (t (Attribute a)) (t (Element t a))
    | Figcaption (t (Attribute a)) (t (Element t a))
    | Figure (t (Attribute a)) (t (Element t a))
    | Footer (t (Attribute a)) (t (Element t a))
    | Form (t (Attribute a)) (t (Element t a))
    | H1 (t (Attribute a)) (t (Element t a))
    | H2 (t (Attribute a)) (t (Element t a))
    | H3 (t (Attribute a)) (t (Element t a))
    | H4 (t (Attribute a)) (t (Element t a))
    | H5 (t (Attribute a)) (t (Element t a))
    | H6 (t (Attribute a)) (t (Element t a))
    | Head (t (Attribute a)) (t (Element t a))
    | Header (t (Attribute a)) (t (Element t a))
    | Hgroup (t (Attribute a)) (t (Element t a))
    | Hr (t (Attribute a)) (t (Element t a))
    | Html (t (Attribute a)) (t (Element t a))
    | I (t (Attribute a)) (t (Element t a))
    | Iframe (t (Attribute a)) (t (Element t a))
    | Img (t (Attribute a)) (t (Element t a))
    | Input (t (Attribute a)) (t (Element t a))
    | Ins (t (Attribute a)) (t (Element t a))
    | Kbd (t (Attribute a)) (t (Element t a))
    | Label (t (Attribute a)) (t (Element t a))
    | Legend (t (Attribute a)) (t (Element t a))
    | Li (t (Attribute a)) (t (Element t a))
    | Link (t (Attribute a)) (t (Element t a))
    | Main (t (Attribute a)) (t (Element t a))
    | Map (t (Attribute a)) (t (Element t a))
    | Mark (t (Attribute a)) (t (Element t a))
    | Math (t (Attribute a)) (t (Element t a))
    | Menu (t (Attribute a)) (t (Element t a))
    | Meta (t (Attribute a)) (t (Element t a))
    | Meter (t (Attribute a)) (t (Element t a))
    | Nav (t (Attribute a)) (t (Element t a))
    | Noscript (t (Attribute a)) (t (Element t a))
    | Object (t (Attribute a)) (t (Element t a))
    | Ol (t (Attribute a)) (t (Element t a))
    | Optgroup (t (Attribute a)) (t (Element t a))
    | Option (t (Attribute a)) (t (Element t a))
    | Output (t (Attribute a)) (t (Element t a))
    | P (t (Attribute a)) (t (Element t a))
    | Param (t (Attribute a)) (t (Element t a))
    | Picture (t (Attribute a)) (t (Element t a))
    | Pre (t (Attribute a)) (t (Element t a))
    | Progress (t (Attribute a)) (t (Element t a))
    | Q (t (Attribute a)) (t (Element t a))
    | Rp (t (Attribute a)) (t (Element t a))
    | Rt (t (Attribute a)) (t (Element t a))
    | Ruby (t (Attribute a)) (t (Element t a))
    | S (t (Attribute a)) (t (Element t a))
    | Samp (t (Attribute a)) (t (Element t a))
    | Script (t (Attribute a)) (t (Element t a))
    | Section (t (Attribute a)) (t (Element t a))
    | Select (t (Attribute a)) (t (Element t a))
    | Slot (t (Attribute a)) (t (Element t a))
    | Small (t (Attribute a)) (t (Element t a))
    | Source (t (Attribute a)) (t (Element t a))
    | Span (t (Attribute a)) (t (Element t a))
    | Strong (t (Attribute a)) (t (Element t a))
    | Style (t (Attribute a)) (t (Element t a))
    | Sub (t (Attribute a)) (t (Element t a))
    | Summary (t (Attribute a)) (t (Element t a))
    | Sup (t (Attribute a)) (t (Element t a))
    | Svg (t (Attribute a)) (t (Element t a))
    | Table (t (Attribute a)) (t (Element t a))
    | Tbody (t (Attribute a)) (t (Element t a))
    | Td (t (Attribute a)) (t (Element t a))
    | Template (t (Attribute a)) (t (Element t a))
    | Textarea (t (Attribute a)) (t (Element t a))
    | Tfoot (t (Attribute a)) (t (Element t a))
    | Th (t (Attribute a)) (t (Element t a))
    | Thead (t (Attribute a)) (t (Element t a))
    | Time (t (Attribute a)) (t (Element t a))
    | Title (t (Attribute a)) (t (Element t a))
    | Tr (t (Attribute a)) (t (Element t a))
    | Track (t (Attribute a)) (t (Element t a))
    | U (t (Attribute a)) (t (Element t a))
    | Ul (t (Attribute a)) (t (Element t a))
    | Var (t (Attribute a)) (t (Element t a))
    | Video (t (Attribute a)) (t (Element t a))
    | Wbr (t (Attribute a)) (t (Element t a))
    | Text a

deriving instance Show a => Show (Element [] a)

a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data_, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main_, map, mark, math, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, param, picture, pre, progress, q, rp, rt, ruby, s, samp, script, section, select, slot, small, source, span, strong, style, sub, summary, sup, svg, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr :: t (Attribute a) -> t (Element t a) -> Element t a
a = A
abbr = Abbr
address = Address
area = Area
article = Article
aside = Aside
audio = Audio
b = B
base = Base
bdi = Bdi
bdo = Bdo
blockquote = Blockquote
body = Body
br = Br
button = Button
canvas = Canvas
caption = Caption
cite = Cite
code = Code
col = Col
colgroup = Colgroup
data_ = Data
datalist = Datalist
dd = Dd
del = Del
details = Details
dfn = Dfn
dialog = Dialog
div = Div
dl = Dl
dt = Dt
em = Em
embed = Embed
fieldset = Fieldset
figcaption = Figcaption
figure = Figure
footer = Footer
form = Form
h1 = H1
h2 = H2
h3 = H3
h4 = H4
h5 = H5
h6 = H6
head = Head
header = Header
hgroup = Hgroup
hr = Hr
html = Html
i = I
iframe = Iframe
img = Img
input = Input
ins = Ins
kbd = Kbd
label = Label
legend = Legend
li = Li
link = Link
main_ = Main
map = Map
mark = Mark
math = Math
menu = Menu
meta = Meta
meter = Meter
nav = Nav
noscript = Noscript
object = Object
ol = Ol
optgroup = Optgroup
option = Option
output = Output
p = P
param = Param
picture = Picture
pre = Pre
progress = Progress
q = Q
rp = Rp
rt = Rt
ruby = Ruby
s = S
samp = Samp
script = Script
section = Section
select = Select
slot = Slot
small = Small
source = Source
span = Span
strong = Strong
style = Style
sub = Sub
summary = Summary
sup = Sup
svg = Svg
table = Table
tbody = Tbody
td = Td
template = Template
textarea = Textarea
tfoot = Tfoot
th = Th
thead = Thead
time = Time
title = Title
tr = Tr
track = Track
u = U
ul = Ul
var = Var
video = Video
wbr = Wbr

text :: a -> Element t a
text = Text

elemName :: IsString a => Element t a -> a
elemName (A _ _) = "a"
elemName (Abbr _ _) = "abbr"
elemName (Address _ _) = "address"
elemName (Area _ _) = "area"
elemName (Article _ _) = "article"
elemName (Aside _ _) = "aside"
elemName (Audio _ _) = "audio"
elemName (B _ _) = "b"
elemName (Base _ _) = "base"
elemName (Bdi _ _) = "bdi"
elemName (Bdo _ _) = "bdo"
elemName (Blockquote _ _) = "blockquote"
elemName (Body _ _) = "body"
elemName (Br _ _) = "br"
elemName (Button _ _) = "button"
elemName (Canvas _ _) = "canvas"
elemName (Caption _ _) = "caption"
elemName (Cite _ _) = "cite"
elemName (Code _ _) = "code"
elemName (Col _ _) = "col"
elemName (Colgroup _ _) = "colgroup"
elemName (Data _ _) = "data"
elemName (Datalist _ _) = "datalist"
elemName (Dd _ _) = "dd"
elemName (Del _ _) = "del"
elemName (Details _ _) = "details"
elemName (Dfn _ _) = "dfn"
elemName (Dialog _ _) = "dialog"
elemName (Div _ _) = "div"
elemName (Dl _ _) = "dl"
elemName (Dt _ _) = "dt"
elemName (Em _ _) = "em"
elemName (Embed _ _) = "embed"
elemName (Fieldset _ _) = "fieldset"
elemName (Figcaption _ _) = "figcaption"
elemName (Figure _ _) = "figure"
elemName (Footer _ _) = "footer"
elemName (Form _ _) = "form"
elemName (H1 _ _) = "h1"
elemName (H2 _ _) = "h2"
elemName (H3 _ _) = "h3"
elemName (H4 _ _) = "h4"
elemName (H5 _ _) = "h5"
elemName (H6 _ _) = "h6"
elemName (Head _ _) = "head"
elemName (Header _ _) = "header"
elemName (Hgroup _ _) = "hgroup"
elemName (Hr _ _) = "hr"
elemName (Html _ _) = "html"
elemName (I _ _) = "i"
elemName (Iframe _ _) = "iframe"
elemName (Img _ _) = "img"
elemName (Input _ _) = "input"
elemName (Ins _ _) = "ins"
elemName (Kbd _ _) = "kbd"
elemName (Label _ _) = "label"
elemName (Legend _ _) = "legend"
elemName (Li _ _) = "li"
elemName (Link _ _) = "link"
elemName (Main _ _) = "main"
elemName (Map _ _) = "map"
elemName (Mark _ _) = "mark"
elemName (Math _ _) = "math"
elemName (Menu _ _) = "menu"
elemName (Meta _ _) = "meta"
elemName (Meter _ _) = "meter"
elemName (Nav _ _) = "nav"
elemName (Noscript _ _) = "noscript"
elemName (Object _ _) = "object"
elemName (Ol _ _) = "ol"
elemName (Optgroup _ _) = "optgroup"
elemName (Option _ _) = "option"
elemName (Output _ _) = "output"
elemName (P _ _) = "p"
elemName (Param _ _) = "param"
elemName (Picture _ _) = "picture"
elemName (Pre _ _) = "pre"
elemName (Progress _ _) = "progress"
elemName (Q _ _) = "q"
elemName (Rp _ _) = "rp"
elemName (Rt _ _) = "rt"
elemName (Ruby _ _) = "ruby"
elemName (S _ _) = "s"
elemName (Samp _ _) = "samp"
elemName (Script _ _) = "script"
elemName (Section _ _) = "section"
elemName (Select _ _) = "select"
elemName (Slot _ _) = "slot"
elemName (Small _ _) = "small"
elemName (Source _ _) = "source"
elemName (Span _ _) = "span"
elemName (Strong _ _) = "strong"
elemName (Style _ _) = "style"
elemName (Sub _ _) = "sub"
elemName (Summary _ _) = "summary"
elemName (Sup _ _) = "sup"
elemName (Svg _ _) = "svg"
elemName (Table _ _) = "table"
elemName (Tbody _ _) = "tbody"
elemName (Td _ _) = "td"
elemName (Template _ _) = "template"
elemName (Textarea _ _) = "textarea"
elemName (Tfoot _ _) = "tfoot"
elemName (Th _ _) = "th"
elemName (Thead _ _) = "thead"
elemName (Time _ _) = "time"
elemName (Title _ _) = "title"
elemName (Tr _ _) = "tr"
elemName (Track _ _) = "track"
elemName (U _ _) = "u"
elemName (Ul _ _) = "ul"
elemName (Var _ _) = "var"
elemName (Video _ _) = "video"
elemName (Wbr _ _) = "wbr"
elemName (Text _) = ""

attrs :: IsString a => Element t a -> t (Attribute a)
attrs (A as _) = as
attrs (Abbr as _) = as
attrs (Address as _) = as
attrs (Area as _) = as
attrs (Article as _) = as
attrs (Aside as _) = as
attrs (Audio as _) = as
attrs (B as _) = as
attrs (Base as _) = as
attrs (Bdi as _) = as
attrs (Bdo as _) = as
attrs (Blockquote as _) = as
attrs (Body as _) = as
attrs (Br as _) = as
attrs (Button as _) = as
attrs (Canvas as _) = as
attrs (Caption as _) = as
attrs (Cite as _) = as
attrs (Code as _) = as
attrs (Col as _) = as
attrs (Colgroup as _) = as
attrs (Data as _) = as
attrs (Datalist as _) = as
attrs (Dd as _) = as
attrs (Del as _) = as
attrs (Details as _) = as
attrs (Dfn as _) = as
attrs (Dialog as _) = as
attrs (Div as _) = as
attrs (Dl as _) = as
attrs (Dt as _) = as
attrs (Em as _) = as
attrs (Embed as _) = as
attrs (Fieldset as _) = as
attrs (Figcaption as _) = as
attrs (Figure as _) = as
attrs (Footer as _) = as
attrs (Form as _) = as
attrs (H1 as _) = as
attrs (H2 as _) = as
attrs (H3 as _) = as
attrs (H4 as _) = as
attrs (H5 as _) = as
attrs (H6 as _) = as
attrs (Head as _) = as
attrs (Header as _) = as
attrs (Hgroup as _) = as
attrs (Hr as _) = as
attrs (Html as _) = as
attrs (I as _) = as
attrs (Iframe as _) = as
attrs (Img as _) = as
attrs (Input as _) = as
attrs (Ins as _) = as
attrs (Kbd as _) = as
attrs (Label as _) = as
attrs (Legend as _) = as
attrs (Li as _) = as
attrs (Link as _) = as
attrs (Main as _) = as
attrs (Map as _) = as
attrs (Mark as _) = as
attrs (Math as _) = as
attrs (Menu as _) = as
attrs (Meta as _) = as
attrs (Meter as _) = as
attrs (Nav as _) = as
attrs (Noscript as _) = as
attrs (Object as _) = as
attrs (Ol as _) = as
attrs (Optgroup as _) = as
attrs (Option as _) = as
attrs (Output as _) = as
attrs (P as _) = as
attrs (Param as _) = as
attrs (Picture as _) = as
attrs (Pre as _) = as
attrs (Progress as _) = as
attrs (Q as _) = as
attrs (Rp as _) = as
attrs (Rt as _) = as
attrs (Ruby as _) = as
attrs (S as _) = as
attrs (Samp as _) = as
attrs (Script as _) = as
attrs (Section as _) = as
attrs (Select as _) = as
attrs (Slot as _) = as
attrs (Small as _) = as
attrs (Source as _) = as
attrs (Span as _) = as
attrs (Strong as _) = as
attrs (Style as _) = as
attrs (Sub as _) = as
attrs (Summary as _) = as
attrs (Sup as _) = as
attrs (Svg as _) = as
attrs (Table as _) = as
attrs (Tbody as _) = as
attrs (Td as _) = as
attrs (Template as _) = as
attrs (Textarea as _) = as
attrs (Tfoot as _) = as
attrs (Th as _) = as
attrs (Thead as _) = as
attrs (Time as _) = as
attrs (Title as _) = as
attrs (Tr as _) = as
attrs (Track as _) = as
attrs (U as _) = as
attrs (Ul as _) = as
attrs (Var as _) = as
attrs (Video as _) = as
attrs (Wbr as _) = as
attrs (Text _) = error "text nodes cannot have attributes"

elems :: IsString a => Element t a -> t (Element t a)
elems (A _ es) = es
elems (Abbr _ es) = es
elems (Address _ es) = es
elems (Area _ es) = es
elems (Article _ es) = es
elems (Aside _ es) = es
elems (Audio _ es) = es
elems (B _ es) = es
elems (Base _ es) = es
elems (Bdi _ es) = es
elems (Bdo _ es) = es
elems (Blockquote _ es) = es
elems (Body _ es) = es
elems (Br _ es) = es
elems (Button _ es) = es
elems (Canvas _ es) = es
elems (Caption _ es) = es
elems (Cite _ es) = es
elems (Code _ es) = es
elems (Col _ es) = es
elems (Colgroup _ es) = es
elems (Data _ es) = es
elems (Datalist _ es) = es
elems (Dd _ es) = es
elems (Del _ es) = es
elems (Details _ es) = es
elems (Dfn _ es) = es
elems (Dialog _ es) = es
elems (Div _ es) = es
elems (Dl _ es) = es
elems (Dt _ es) = es
elems (Em _ es) = es
elems (Embed _ es) = es
elems (Fieldset _ es) = es
elems (Figcaption _ es) = es
elems (Figure _ es) = es
elems (Footer _ es) = es
elems (Form _ es) = es
elems (H1 _ es) = es
elems (H2 _ es) = es
elems (H3 _ es) = es
elems (H4 _ es) = es
elems (H5 _ es) = es
elems (H6 _ es) = es
elems (Head _ es) = es
elems (Header _ es) = es
elems (Hgroup _ es) = es
elems (Hr _ es) = es
elems (Html _ es) = es
elems (I _ es) = es
elems (Iframe _ es) = es
elems (Img _ es) = es
elems (Input _ es) = es
elems (Ins _ es) = es
elems (Kbd _ es) = es
elems (Label _ es) = es
elems (Legend _ es) = es
elems (Li _ es) = es
elems (Link _ es) = es
elems (Main _ es) = es
elems (Map _ es) = es
elems (Mark _ es) = es
elems (Math _ es) = es
elems (Menu _ es) = es
elems (Meta _ es) = es
elems (Meter _ es) = es
elems (Nav _ es) = es
elems (Noscript _ es) = es
elems (Object _ es) = es
elems (Ol _ es) = es
elems (Optgroup _ es) = es
elems (Option _ es) = es
elems (Output _ es) = es
elems (P _ es) = es
elems (Param _ es) = es
elems (Picture _ es) = es
elems (Pre _ es) = es
elems (Progress _ es) = es
elems (Q _ es) = es
elems (Rp _ es) = es
elems (Rt _ es) = es
elems (Ruby _ es) = es
elems (S _ es) = es
elems (Samp _ es) = es
elems (Script _ es) = es
elems (Section _ es) = es
elems (Select _ es) = es
elems (Slot _ es) = es
elems (Small _ es) = es
elems (Source _ es) = es
elems (Span _ es) = es
elems (Strong _ es) = es
elems (Style _ es) = es
elems (Sub _ es) = es
elems (Summary _ es) = es
elems (Sup _ es) = es
elems (Svg _ es) = es
elems (Table _ es) = es
elems (Tbody _ es) = es
elems (Td _ es) = es
elems (Template _ es) = es
elems (Textarea _ es) = es
elems (Tfoot _ es) = es
elems (Th _ es) = es
elems (Thead _ es) = es
elems (Time _ es) = es
elems (Title _ es) = es
elems (Tr _ es) = es
elems (Track _ es) = es
elems (U _ es) = es
elems (Ul _ es) = es
elems (Var _ es) = es
elems (Video _ es) = es
elems (Wbr _ es) = es
elems (Text _) = error "text nodes cannot have child elements"
