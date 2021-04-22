-- Generated. See gentool.js.
{-# LANGUAGE OverloadedStrings #-}
module Html.Internal.Attributes where

import Data.String (IsString)

data Attribute a = 
      Abbr a
    | Accept a
    | AcceptCharset a
    | AccessKey a
    | Action a
    | Allow a
    | AllowFullScreen a
    | Alt a
    | As a
    | Async a
    | AutoCapitalize a
    | AutoComplete a
    | AutoFocus a
    | AutoPlay a
    | Charset a
    | Checked a
    | Cite a
    | Class a
    | Color a
    | Cols a
    | Colspan a
    | Content a
    | ContentEditable a
    | Controls a
    | Coords a
    | CrossOrigin a
    | Data a
    | DateTime a
    | Decoding a
    | Default a
    | Defer a
    | Dir a
    | Dirname a
    | Disabled a
    | DownLoad a
    | Draggable a
    | Enctype a
    | EnterKeyHint a
    | For a
    | Form a
    | FormAction a
    | FormEnctype a
    | FormMethod a
    | FormNoValidate a
    | FormTarget a
    | Headers a
    | Height a
    | Hidden a
    | High a
    | Href a
    | HrefLang a
    | HttpEquiv a
    | Id a
    | ImageSizes a
    | ImageSrcSet a
    | InputMode a
    | Integrity a
    | Is a
    | IsMap a
    | ItemId a
    | ItemProp a
    | ItemRef a
    | ItemScope a
    | ItemType a
    | Kind a
    | Label a
    | Lang a
    | List a
    | Loading a
    | Loop a
    | Low a
    | Max a
    | MaxLength a
    | Media a
    | Method a
    | Min a
    | MinLength a
    | Multiple a
    | Muted a
    | Name a
    | NoModule a
    | NoValidate a
    | Nonce a
    | OnAbort a
    | OnAfterPrint a
    | OnAuxClick a
    | OnBeforePrint a
    | OnBeforeUnload a
    | OnBlur a
    | OnCanPlay a
    | OnCanPlayThrough a
    | OnCancel a
    | OnChange a
    | OnClick a
    | OnClose a
    | OnContextMenu a
    | OnCopy a
    | OnCueChange a
    | OnCut a
    | OnDblClick a
    | OnDrag a
    | OnDragEnd a
    | OnDragEnter a
    | OnDragLeave a
    | OnDragOver a
    | OnDragStart a
    | OnDrop a
    | OnDurationChange a
    | OnEmptied a
    | OnEnded a
    | OnError a
    | OnFocus a
    | OnFormData a
    | OnHashChange a
    | OnInput a
    | OnInvalid a
    | OnKeyDown a
    | OnKeyPress a
    | OnKeyup a
    | OnLanguageChange a
    | OnLoad a
    | OnLoadStart a
    | OnLoadedData a
    | OnLoadedMetaData a
    | OnMessage a
    | OnMessageError a
    | OnMouseDown a
    | OnMouseEnter a
    | OnMouseLeave a
    | OnMouseMove a
    | OnMouseOut a
    | OnMouseOver a
    | OnMouseUp a
    | OnOffline a
    | OnOnline a
    | OnPageHide a
    | OnPageShow a
    | OnPaste a
    | OnPause a
    | OnPlay a
    | OnPlaying a
    | OnPopState a
    | OnProgress a
    | OnRateChange a
    | OnRejectionHandled a
    | OnReset a
    | OnResize a
    | OnScroll a
    | OnSecurityPolicyViolation a
    | OnSeeked a
    | OnSeeking a
    | OnSelect a
    | OnSlotChange a
    | OnStalled a
    | OnStorage a
    | OnSubmit a
    | OnSuspend a
    | OnTimeUpdate a
    | OnToggle a
    | OnUnhandledRejection a
    | OnUnload a
    | OnVolumeChange a
    | OnWaiting a
    | OnWheel a
    | Open a
    | Optimum a
    | Pattern a
    | Ping a
    | Placeholder a
    | PlaysInline a
    | Poster a
    | Preload a
    | Readonly a
    | ReferrerPolicy a
    | Rel a
    | Required a
    | Reversed a
    | Rows a
    | Rowspan a
    | Sandbox a
    | Scope a
    | Selected a
    | Shape a
    | Size a
    | Sizes a
    | Slot a
    | Span a
    | SpellCheck a
    | Src a
    | SrcLang a
    | SrcSet a
    | Srcdoc a
    | Start a
    | Step a
    | Style a
    | TabIndex a
    | Target a
    | Title a
    | Translate a
    | Type a
    | UseMap a
    | Value a
    | Width a
    | Wrap a
    deriving (Eq, Ord, Show, Read)

abbr, accept, acceptCharset, accessKey, action, allow, allowFullScreen, alt, as, async, autoCapitalize, autoComplete, autoFocus, autoPlay, charset, checked, cite, class_, color, cols, colspan, content, contentEditable, controls, coords, crossOrigin, data_, dateTime, decoding, default_, defer, dir, dirname, disabled, downLoad, draggable, enctype, enterKeyHint, for, form, formAction, formEnctype, formMethod, formNoValidate, formTarget, headers, height, hidden, high, href, hrefLang, httpEquiv, id, imageSizes, imageSrcSet, inputMode, integrity, is, isMap, itemId, itemProp, itemRef, itemScope, itemType, kind, label, lang, list, loading, loop, low, max, maxLength, media, method, min, minLength, multiple, muted, name, noModule, nonce, noValidate, onAbort, onAfterPrint, onAuxClick, onBeforePrint, onBeforeUnload, onBlur, onCancel, onCanPlay, onCanPlayThrough, onChange, onClick, onClose, onContextMenu, onCopy, onCueChange, onCut, onDblClick, onDrag, onDragEnd, onDragEnter, onDragLeave, onDragOver, onDragStart, onDrop, onDurationChange, onEmptied, onEnded, onError, onFocus, onFormData, onHashChange, onInput, onInvalid, onKeyDown, onKeyPress, onKeyup, onLanguageChange, onLoad, onLoadedData, onLoadedMetaData, onLoadStart, onMessage, onMessageError, onMouseDown, onMouseEnter, onMouseLeave, onMouseMove, onMouseOut, onMouseOver, onMouseUp, onOffline, onOnline, onPageHide, onPageShow, onPaste, onPause, onPlay, onPlaying, onPopState, onProgress, onRateChange, onRejectionHandled, onReset, onResize, onScroll, onSecurityPolicyViolation, onSeeked, onSeeking, onSelect, onSlotChange, onStalled, onStorage, onSubmit, onSuspend, onTimeUpdate, onToggle, onUnhandledRejection, onUnload, onVolumeChange, onWaiting, onWheel, open, optimum, pattern_, ping, placeholder, playsInline, poster, preload, readonly, referrerPolicy, rel, required, reversed, rows, rowspan, sandbox, scope, selected, shape, size, sizes, slot, span, spellCheck, src, srcdoc, srcLang, srcSet, start, step, style, tabIndex, target, title, translate, type_, useMap, value, width, wrap :: a -> Attribute a
abbr = Abbr
accept = Accept
acceptCharset = AcceptCharset
accessKey = AccessKey
action = Action
allow = Allow
allowFullScreen = AllowFullScreen
alt = Alt
as = As
async = Async
autoCapitalize = AutoCapitalize
autoComplete = AutoComplete
autoFocus = AutoFocus
autoPlay = AutoPlay
charset = Charset
checked = Checked
cite = Cite
class_ = Class
color = Color
cols = Cols
colspan = Colspan
content = Content
contentEditable = ContentEditable
controls = Controls
coords = Coords
crossOrigin = CrossOrigin
data_ = Data
dateTime = DateTime
decoding = Decoding
default_ = Default
defer = Defer
dir = Dir
dirname = Dirname
disabled = Disabled
downLoad = DownLoad
draggable = Draggable
enctype = Enctype
enterKeyHint = EnterKeyHint
for = For
form = Form
formAction = FormAction
formEnctype = FormEnctype
formMethod = FormMethod
formNoValidate = FormNoValidate
formTarget = FormTarget
headers = Headers
height = Height
hidden = Hidden
high = High
href = Href
hrefLang = HrefLang
httpEquiv = HttpEquiv
id = Id
imageSizes = ImageSizes
imageSrcSet = ImageSrcSet
inputMode = InputMode
integrity = Integrity
is = Is
isMap = IsMap
itemId = ItemId
itemProp = ItemProp
itemRef = ItemRef
itemScope = ItemScope
itemType = ItemType
kind = Kind
label = Label
lang = Lang
list = List
loading = Loading
loop = Loop
low = Low
max = Max
maxLength = MaxLength
media = Media
method = Method
min = Min
minLength = MinLength
multiple = Multiple
muted = Muted
name = Name
noModule = NoModule
nonce = Nonce
noValidate = NoValidate
onAbort = OnAbort
onAfterPrint = OnAfterPrint
onAuxClick = OnAuxClick
onBeforePrint = OnBeforePrint
onBeforeUnload = OnBeforeUnload
onBlur = OnBlur
onCancel = OnCancel
onCanPlay = OnCanPlay
onCanPlayThrough = OnCanPlayThrough
onChange = OnChange
onClick = OnClick
onClose = OnClose
onContextMenu = OnContextMenu
onCopy = OnCopy
onCueChange = OnCueChange
onCut = OnCut
onDblClick = OnDblClick
onDrag = OnDrag
onDragEnd = OnDragEnd
onDragEnter = OnDragEnter
onDragLeave = OnDragLeave
onDragOver = OnDragOver
onDragStart = OnDragStart
onDrop = OnDrop
onDurationChange = OnDurationChange
onEmptied = OnEmptied
onEnded = OnEnded
onError = OnError
onFocus = OnFocus
onFormData = OnFormData
onHashChange = OnHashChange
onInput = OnInput
onInvalid = OnInvalid
onKeyDown = OnKeyDown
onKeyPress = OnKeyPress
onKeyup = OnKeyup
onLanguageChange = OnLanguageChange
onLoad = OnLoad
onLoadedData = OnLoadedData
onLoadedMetaData = OnLoadedMetaData
onLoadStart = OnLoadStart
onMessage = OnMessage
onMessageError = OnMessageError
onMouseDown = OnMouseDown
onMouseEnter = OnMouseEnter
onMouseLeave = OnMouseLeave
onMouseMove = OnMouseMove
onMouseOut = OnMouseOut
onMouseOver = OnMouseOver
onMouseUp = OnMouseUp
onOffline = OnOffline
onOnline = OnOnline
onPageHide = OnPageHide
onPageShow = OnPageShow
onPaste = OnPaste
onPause = OnPause
onPlay = OnPlay
onPlaying = OnPlaying
onPopState = OnPopState
onProgress = OnProgress
onRateChange = OnRateChange
onRejectionHandled = OnRejectionHandled
onReset = OnReset
onResize = OnResize
onScroll = OnScroll
onSecurityPolicyViolation = OnSecurityPolicyViolation
onSeeked = OnSeeked
onSeeking = OnSeeking
onSelect = OnSelect
onSlotChange = OnSlotChange
onStalled = OnStalled
onStorage = OnStorage
onSubmit = OnSubmit
onSuspend = OnSuspend
onTimeUpdate = OnTimeUpdate
onToggle = OnToggle
onUnhandledRejection = OnUnhandledRejection
onUnload = OnUnload
onVolumeChange = OnVolumeChange
onWaiting = OnWaiting
onWheel = OnWheel
open = Open
optimum = Optimum
pattern_ = Pattern
ping = Ping
placeholder = Placeholder
playsInline = PlaysInline
poster = Poster
preload = Preload
readonly = Readonly
referrerPolicy = ReferrerPolicy
rel = Rel
required = Required
reversed = Reversed
rows = Rows
rowspan = Rowspan
sandbox = Sandbox
scope = Scope
selected = Selected
shape = Shape
size = Size
sizes = Sizes
slot = Slot
span = Span
spellCheck = SpellCheck
src = Src
srcdoc = Srcdoc
srcLang = SrcLang
srcSet = SrcSet
start = Start
step = Step
style = Style
tabIndex = TabIndex
target = Target
title = Title
translate = Translate
type_ = Type
useMap = UseMap
value = Value
width = Width
wrap = Wrap

attrName :: IsString a => Attribute a -> a
attrName (Abbr _) = "abbr"
attrName (Accept _) = "accept"
attrName (AcceptCharset _) = "accept-charset"
attrName (AccessKey _) = "accesskey"
attrName (Action _) = "action"
attrName (Allow _) = "allow"
attrName (AllowFullScreen _) = "allowfullscreen"
attrName (Alt _) = "alt"
attrName (As _) = "as"
attrName (Async _) = "async"
attrName (AutoCapitalize _) = "autocapitalize"
attrName (AutoComplete _) = "autocomplete"
attrName (AutoFocus _) = "autofocus"
attrName (AutoPlay _) = "autoplay"
attrName (Charset _) = "charset"
attrName (Checked _) = "checked"
attrName (Cite _) = "cite"
attrName (Class _) = "class"
attrName (Color _) = "color"
attrName (Cols _) = "cols"
attrName (Colspan _) = "colspan"
attrName (Content _) = "content"
attrName (ContentEditable _) = "contenteditable"
attrName (Controls _) = "controls"
attrName (Coords _) = "coords"
attrName (CrossOrigin _) = "crossorigin"
attrName (Data _) = "data"
attrName (DateTime _) = "datetime"
attrName (Decoding _) = "decoding"
attrName (Default _) = "default"
attrName (Defer _) = "defer"
attrName (Dir _) = "dir"
attrName (Dirname _) = "dirname"
attrName (Disabled _) = "disabled"
attrName (DownLoad _) = "download"
attrName (Draggable _) = "draggable"
attrName (Enctype _) = "enctype"
attrName (EnterKeyHint _) = "enterkeyhint"
attrName (For _) = "for"
attrName (Form _) = "form"
attrName (FormAction _) = "formaction"
attrName (FormEnctype _) = "formenctype"
attrName (FormMethod _) = "formmethod"
attrName (FormNoValidate _) = "formnovalidate"
attrName (FormTarget _) = "formtarget"
attrName (Headers _) = "headers"
attrName (Height _) = "height"
attrName (Hidden _) = "hidden"
attrName (High _) = "high"
attrName (Href _) = "href"
attrName (HrefLang _) = "hreflang"
attrName (HttpEquiv _) = "http-equiv"
attrName (Id _) = "id"
attrName (ImageSizes _) = "imagesizes"
attrName (ImageSrcSet _) = "imagesrcset"
attrName (InputMode _) = "inputmode"
attrName (Integrity _) = "integrity"
attrName (Is _) = "is"
attrName (IsMap _) = "ismap"
attrName (ItemId _) = "itemid"
attrName (ItemProp _) = "itemprop"
attrName (ItemRef _) = "itemref"
attrName (ItemScope _) = "itemscope"
attrName (ItemType _) = "itemtype"
attrName (Kind _) = "kind"
attrName (Label _) = "label"
attrName (Lang _) = "lang"
attrName (List _) = "list"
attrName (Loading _) = "loading"
attrName (Loop _) = "loop"
attrName (Low _) = "low"
attrName (Max _) = "max"
attrName (MaxLength _) = "maxlength"
attrName (Media _) = "media"
attrName (Method _) = "method"
attrName (Min _) = "min"
attrName (MinLength _) = "minlength"
attrName (Multiple _) = "multiple"
attrName (Muted _) = "muted"
attrName (Name _) = "name"
attrName (NoModule _) = "nomodule"
attrName (Nonce _) = "nonce"
attrName (NoValidate _) = "novalidate"
attrName (OnAbort _) = "onabort"
attrName (OnAfterPrint _) = "onafterprint"
attrName (OnAuxClick _) = "onauxclick"
attrName (OnBeforePrint _) = "onbeforeprint"
attrName (OnBeforeUnload _) = "onbeforeunload"
attrName (OnBlur _) = "onblur"
attrName (OnCancel _) = "oncancel"
attrName (OnCanPlay _) = "oncanplay"
attrName (OnCanPlayThrough _) = "oncanplaythrough"
attrName (OnChange _) = "onchange"
attrName (OnClick _) = "onclick"
attrName (OnClose _) = "onclose"
attrName (OnContextMenu _) = "oncontextmenu"
attrName (OnCopy _) = "oncopy"
attrName (OnCueChange _) = "oncuechange"
attrName (OnCut _) = "oncut"
attrName (OnDblClick _) = "ondblclick"
attrName (OnDrag _) = "ondrag"
attrName (OnDragEnd _) = "ondragend"
attrName (OnDragEnter _) = "ondragenter"
attrName (OnDragLeave _) = "ondragleave"
attrName (OnDragOver _) = "ondragover"
attrName (OnDragStart _) = "ondragstart"
attrName (OnDrop _) = "ondrop"
attrName (OnDurationChange _) = "ondurationchange"
attrName (OnEmptied _) = "onemptied"
attrName (OnEnded _) = "onended"
attrName (OnError _) = "onerror"
attrName (OnFocus _) = "onfocus"
attrName (OnFormData _) = "onformdata"
attrName (OnHashChange _) = "onhashchange"
attrName (OnInput _) = "oninput"
attrName (OnInvalid _) = "oninvalid"
attrName (OnKeyDown _) = "onkeydown"
attrName (OnKeyPress _) = "onkeypress"
attrName (OnKeyup _) = "onkeyup"
attrName (OnLanguageChange _) = "onlanguagechange"
attrName (OnLoad _) = "onload"
attrName (OnLoadedData _) = "onloadeddata"
attrName (OnLoadedMetaData _) = "onloadedmetadata"
attrName (OnLoadStart _) = "onloadstart"
attrName (OnMessage _) = "onmessage"
attrName (OnMessageError _) = "onmessageerror"
attrName (OnMouseDown _) = "onmousedown"
attrName (OnMouseEnter _) = "onmouseenter"
attrName (OnMouseLeave _) = "onmouseleave"
attrName (OnMouseMove _) = "onmousemove"
attrName (OnMouseOut _) = "onmouseout"
attrName (OnMouseOver _) = "onmouseover"
attrName (OnMouseUp _) = "onmouseup"
attrName (OnOffline _) = "onoffline"
attrName (OnOnline _) = "ononline"
attrName (OnPageHide _) = "onpagehide"
attrName (OnPageShow _) = "onpageshow"
attrName (OnPaste _) = "onpaste"
attrName (OnPause _) = "onpause"
attrName (OnPlay _) = "onplay"
attrName (OnPlaying _) = "onplaying"
attrName (OnPopState _) = "onpopstate"
attrName (OnProgress _) = "onprogress"
attrName (OnRateChange _) = "onratechange"
attrName (OnRejectionHandled _) = "onrejectionhandled"
attrName (OnReset _) = "onreset"
attrName (OnResize _) = "onresize"
attrName (OnScroll _) = "onscroll"
attrName (OnSecurityPolicyViolation _) = "onsecuritypolicyviolation"
attrName (OnSeeked _) = "onseeked"
attrName (OnSeeking _) = "onseeking"
attrName (OnSelect _) = "onselect"
attrName (OnSlotChange _) = "onslotchange"
attrName (OnStalled _) = "onstalled"
attrName (OnStorage _) = "onstorage"
attrName (OnSubmit _) = "onsubmit"
attrName (OnSuspend _) = "onsuspend"
attrName (OnTimeUpdate _) = "ontimeupdate"
attrName (OnToggle _) = "ontoggle"
attrName (OnUnhandledRejection _) = "onunhandledrejection"
attrName (OnUnload _) = "onunload"
attrName (OnVolumeChange _) = "onvolumechange"
attrName (OnWaiting _) = "onwaiting"
attrName (OnWheel _) = "onwheel"
attrName (Open _) = "open"
attrName (Optimum _) = "optimum"
attrName (Pattern _) = "pattern"
attrName (Ping _) = "ping"
attrName (Placeholder _) = "placeholder"
attrName (PlaysInline _) = "playsinline"
attrName (Poster _) = "poster"
attrName (Preload _) = "preload"
attrName (Readonly _) = "readonly"
attrName (ReferrerPolicy _) = "referrerpolicy"
attrName (Rel _) = "rel"
attrName (Required _) = "required"
attrName (Reversed _) = "reversed"
attrName (Rows _) = "rows"
attrName (Rowspan _) = "rowspan"
attrName (Sandbox _) = "sandbox"
attrName (Scope _) = "scope"
attrName (Selected _) = "selected"
attrName (Shape _) = "shape"
attrName (Size _) = "size"
attrName (Sizes _) = "sizes"
attrName (Slot _) = "slot"
attrName (Span _) = "span"
attrName (SpellCheck _) = "spellcheck"
attrName (Src _) = "src"
attrName (Srcdoc _) = "srcdoc"
attrName (SrcLang _) = "srclang"
attrName (SrcSet _) = "srcset"
attrName (Start _) = "start"
attrName (Step _) = "step"
attrName (Style _) = "style"
attrName (TabIndex _) = "tabindex"
attrName (Target _) = "target"
attrName (Title _) = "title"
attrName (Translate _) = "translate"
attrName (Type _) = "type"
attrName (UseMap _) = "usemap"
attrName (Value _) = "value"
attrName (Width _) = "width"
attrName (Wrap _) = "wrap"

attrVal :: IsString a => Attribute a -> a
attrVal (Abbr v) = v
attrVal (Accept v) = v
attrVal (AcceptCharset v) = v
attrVal (AccessKey v) = v
attrVal (Action v) = v
attrVal (Allow v) = v
attrVal (AllowFullScreen v) = v
attrVal (Alt v) = v
attrVal (As v) = v
attrVal (Async v) = v
attrVal (AutoCapitalize v) = v
attrVal (AutoComplete v) = v
attrVal (AutoFocus v) = v
attrVal (AutoPlay v) = v
attrVal (Charset v) = v
attrVal (Checked v) = v
attrVal (Cite v) = v
attrVal (Class v) = v
attrVal (Color v) = v
attrVal (Cols v) = v
attrVal (Colspan v) = v
attrVal (Content v) = v
attrVal (ContentEditable v) = v
attrVal (Controls v) = v
attrVal (Coords v) = v
attrVal (CrossOrigin v) = v
attrVal (Data v) = v
attrVal (DateTime v) = v
attrVal (Decoding v) = v
attrVal (Default v) = v
attrVal (Defer v) = v
attrVal (Dir v) = v
attrVal (Dirname v) = v
attrVal (Disabled v) = v
attrVal (DownLoad v) = v
attrVal (Draggable v) = v
attrVal (Enctype v) = v
attrVal (EnterKeyHint v) = v
attrVal (For v) = v
attrVal (Form v) = v
attrVal (FormAction v) = v
attrVal (FormEnctype v) = v
attrVal (FormMethod v) = v
attrVal (FormNoValidate v) = v
attrVal (FormTarget v) = v
attrVal (Headers v) = v
attrVal (Height v) = v
attrVal (Hidden v) = v
attrVal (High v) = v
attrVal (Href v) = v
attrVal (HrefLang v) = v
attrVal (HttpEquiv v) = v
attrVal (Id v) = v
attrVal (ImageSizes v) = v
attrVal (ImageSrcSet v) = v
attrVal (InputMode v) = v
attrVal (Integrity v) = v
attrVal (Is v) = v
attrVal (IsMap v) = v
attrVal (ItemId v) = v
attrVal (ItemProp v) = v
attrVal (ItemRef v) = v
attrVal (ItemScope v) = v
attrVal (ItemType v) = v
attrVal (Kind v) = v
attrVal (Label v) = v
attrVal (Lang v) = v
attrVal (List v) = v
attrVal (Loading v) = v
attrVal (Loop v) = v
attrVal (Low v) = v
attrVal (Max v) = v
attrVal (MaxLength v) = v
attrVal (Media v) = v
attrVal (Method v) = v
attrVal (Min v) = v
attrVal (MinLength v) = v
attrVal (Multiple v) = v
attrVal (Muted v) = v
attrVal (Name v) = v
attrVal (NoModule v) = v
attrVal (Nonce v) = v
attrVal (NoValidate v) = v
attrVal (OnAbort v) = v
attrVal (OnAfterPrint v) = v
attrVal (OnAuxClick v) = v
attrVal (OnBeforePrint v) = v
attrVal (OnBeforeUnload v) = v
attrVal (OnBlur v) = v
attrVal (OnCancel v) = v
attrVal (OnCanPlay v) = v
attrVal (OnCanPlayThrough v) = v
attrVal (OnChange v) = v
attrVal (OnClick v) = v
attrVal (OnClose v) = v
attrVal (OnContextMenu v) = v
attrVal (OnCopy v) = v
attrVal (OnCueChange v) = v
attrVal (OnCut v) = v
attrVal (OnDblClick v) = v
attrVal (OnDrag v) = v
attrVal (OnDragEnd v) = v
attrVal (OnDragEnter v) = v
attrVal (OnDragLeave v) = v
attrVal (OnDragOver v) = v
attrVal (OnDragStart v) = v
attrVal (OnDrop v) = v
attrVal (OnDurationChange v) = v
attrVal (OnEmptied v) = v
attrVal (OnEnded v) = v
attrVal (OnError v) = v
attrVal (OnFocus v) = v
attrVal (OnFormData v) = v
attrVal (OnHashChange v) = v
attrVal (OnInput v) = v
attrVal (OnInvalid v) = v
attrVal (OnKeyDown v) = v
attrVal (OnKeyPress v) = v
attrVal (OnKeyup v) = v
attrVal (OnLanguageChange v) = v
attrVal (OnLoad v) = v
attrVal (OnLoadedData v) = v
attrVal (OnLoadedMetaData v) = v
attrVal (OnLoadStart v) = v
attrVal (OnMessage v) = v
attrVal (OnMessageError v) = v
attrVal (OnMouseDown v) = v
attrVal (OnMouseEnter v) = v
attrVal (OnMouseLeave v) = v
attrVal (OnMouseMove v) = v
attrVal (OnMouseOut v) = v
attrVal (OnMouseOver v) = v
attrVal (OnMouseUp v) = v
attrVal (OnOffline v) = v
attrVal (OnOnline v) = v
attrVal (OnPageHide v) = v
attrVal (OnPageShow v) = v
attrVal (OnPaste v) = v
attrVal (OnPause v) = v
attrVal (OnPlay v) = v
attrVal (OnPlaying v) = v
attrVal (OnPopState v) = v
attrVal (OnProgress v) = v
attrVal (OnRateChange v) = v
attrVal (OnRejectionHandled v) = v
attrVal (OnReset v) = v
attrVal (OnResize v) = v
attrVal (OnScroll v) = v
attrVal (OnSecurityPolicyViolation v) = v
attrVal (OnSeeked v) = v
attrVal (OnSeeking v) = v
attrVal (OnSelect v) = v
attrVal (OnSlotChange v) = v
attrVal (OnStalled v) = v
attrVal (OnStorage v) = v
attrVal (OnSubmit v) = v
attrVal (OnSuspend v) = v
attrVal (OnTimeUpdate v) = v
attrVal (OnToggle v) = v
attrVal (OnUnhandledRejection v) = v
attrVal (OnUnload v) = v
attrVal (OnVolumeChange v) = v
attrVal (OnWaiting v) = v
attrVal (OnWheel v) = v
attrVal (Open v) = v
attrVal (Optimum v) = v
attrVal (Pattern v) = v
attrVal (Ping v) = v
attrVal (Placeholder v) = v
attrVal (PlaysInline v) = v
attrVal (Poster v) = v
attrVal (Preload v) = v
attrVal (Readonly v) = v
attrVal (ReferrerPolicy v) = v
attrVal (Rel v) = v
attrVal (Required v) = v
attrVal (Reversed v) = v
attrVal (Rows v) = v
attrVal (Rowspan v) = v
attrVal (Sandbox v) = v
attrVal (Scope v) = v
attrVal (Selected v) = v
attrVal (Shape v) = v
attrVal (Size v) = v
attrVal (Sizes v) = v
attrVal (Slot v) = v
attrVal (Span v) = v
attrVal (SpellCheck v) = v
attrVal (Src v) = v
attrVal (Srcdoc v) = v
attrVal (SrcLang v) = v
attrVal (SrcSet v) = v
attrVal (Start v) = v
attrVal (Step v) = v
attrVal (Style v) = v
attrVal (TabIndex v) = v
attrVal (Target v) = v
attrVal (Title v) = v
attrVal (Translate v) = v
attrVal (Type v) = v
attrVal (UseMap v) = v
attrVal (Value v) = v
attrVal (Width v) = v
attrVal (Wrap v) = v
