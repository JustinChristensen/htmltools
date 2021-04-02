-- Generated. See gentool.js.
module Html.Elements where

import Html.Attributes (Attribute)

data Element a = 
      A [Attribute a] [Element a]
    | Abbr [Attribute a] [Element a]
    | Address [Attribute a] [Element a]
    | Area [Attribute a] [Element a]
    | Article [Attribute a] [Element a]
    | Aside [Attribute a] [Element a]
    | Audio [Attribute a] [Element a]
    | B [Attribute a] [Element a]
    | Base [Attribute a] [Element a]
    | Bdi [Attribute a] [Element a]
    | Bdo [Attribute a] [Element a]
    | Blockquote [Attribute a] [Element a]
    | Body [Attribute a] [Element a]
    | Br [Attribute a] [Element a]
    | Button [Attribute a] [Element a]
    | Canvas [Attribute a] [Element a]
    | Caption [Attribute a] [Element a]
    | Cite [Attribute a] [Element a]
    | Code [Attribute a] [Element a]
    | Col [Attribute a] [Element a]
    | Colgroup [Attribute a] [Element a]
    | Data [Attribute a] [Element a]
    | Datalist [Attribute a] [Element a]
    | Dd [Attribute a] [Element a]
    | Del [Attribute a] [Element a]
    | Details [Attribute a] [Element a]
    | Dfn [Attribute a] [Element a]
    | Dialog [Attribute a] [Element a]
    | Div [Attribute a] [Element a]
    | Dl [Attribute a] [Element a]
    | Dt [Attribute a] [Element a]
    | Em [Attribute a] [Element a]
    | Embed [Attribute a] [Element a]
    | Fieldset [Attribute a] [Element a]
    | Figcaption [Attribute a] [Element a]
    | Figure [Attribute a] [Element a]
    | Footer [Attribute a] [Element a]
    | Form [Attribute a] [Element a]
    | H1 [Attribute a] [Element a]
    | H2 [Attribute a] [Element a]
    | H3 [Attribute a] [Element a]
    | H4 [Attribute a] [Element a]
    | H5 [Attribute a] [Element a]
    | H6 [Attribute a] [Element a]
    | Head [Attribute a] [Element a]
    | Header [Attribute a] [Element a]
    | Hgroup [Attribute a] [Element a]
    | Hr [Attribute a] [Element a]
    | Html [Attribute a] [Element a]
    | I [Attribute a] [Element a]
    | Iframe [Attribute a] [Element a]
    | Img [Attribute a] [Element a]
    | Input [Attribute a] [Element a]
    | Ins [Attribute a] [Element a]
    | Kbd [Attribute a] [Element a]
    | Label [Attribute a] [Element a]
    | Legend [Attribute a] [Element a]
    | Li [Attribute a] [Element a]
    | Link [Attribute a] [Element a]
    | Main [Attribute a] [Element a]
    | Map [Attribute a] [Element a]
    | Mark [Attribute a] [Element a]
    | Math [Attribute a] [Element a]
    | Menu [Attribute a] [Element a]
    | Meta [Attribute a] [Element a]
    | Meter [Attribute a] [Element a]
    | Nav [Attribute a] [Element a]
    | Noscript [Attribute a] [Element a]
    | Object [Attribute a] [Element a]
    | Ol [Attribute a] [Element a]
    | Optgroup [Attribute a] [Element a]
    | Option [Attribute a] [Element a]
    | Output [Attribute a] [Element a]
    | P [Attribute a] [Element a]
    | Param [Attribute a] [Element a]
    | Picture [Attribute a] [Element a]
    | Pre [Attribute a] [Element a]
    | Progress [Attribute a] [Element a]
    | Q [Attribute a] [Element a]
    | Rp [Attribute a] [Element a]
    | Rt [Attribute a] [Element a]
    | Ruby [Attribute a] [Element a]
    | S [Attribute a] [Element a]
    | Samp [Attribute a] [Element a]
    | Script [Attribute a] [Element a]
    | Section [Attribute a] [Element a]
    | Select [Attribute a] [Element a]
    | Slot [Attribute a] [Element a]
    | Small [Attribute a] [Element a]
    | Source [Attribute a] [Element a]
    | Span [Attribute a] [Element a]
    | Strong [Attribute a] [Element a]
    | Style [Attribute a] [Element a]
    | Sub [Attribute a] [Element a]
    | Summary [Attribute a] [Element a]
    | Sup [Attribute a] [Element a]
    | Svg [Attribute a] [Element a]
    | Table [Attribute a] [Element a]
    | Tbody [Attribute a] [Element a]
    | Td [Attribute a] [Element a]
    | Template [Attribute a] [Element a]
    | Textarea [Attribute a] [Element a]
    | Tfoot [Attribute a] [Element a]
    | Th [Attribute a] [Element a]
    | Thead [Attribute a] [Element a]
    | Time [Attribute a] [Element a]
    | Title [Attribute a] [Element a]
    | Tr [Attribute a] [Element a]
    | Track [Attribute a] [Element a]
    | U [Attribute a] [Element a]
    | Ul [Attribute a] [Element a]
    | Var [Attribute a] [Element a]
    | Video [Attribute a] [Element a]
    | Wbr [Attribute a] [Element a]
    deriving (Show)

a, abbr, address, area, article, aside, audio, b, base, bdi, bdo, blockquote, body, br, button, canvas, caption, cite, code, col, colgroup, data_, datalist, dd, del, details, dfn, dialog, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, head, header, hgroup, hr, html, i, iframe, img, input, ins, kbd, label, legend, li, link, main, map, mark, math, menu, meta, meter, nav, noscript, object, ol, optgroup, option, output, p, param, picture, pre, progress, q, rp, rt, ruby, s, samp, script, section, select, slot, small, source, span, strong, style, sub, summary, sup, svg, table, tbody, td, template, textarea, tfoot, th, thead, time, title, tr, track, u, ul, var, video, wbr :: [Attribute a] -> [Element a] -> Element a
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
main = Main
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