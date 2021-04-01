PRAGMA foreign_keys = ON;

/* content model */
UPDATE elements 
SET contents = CASE name
    WHEN 'a' THEN 'transparent-with-a-exceptions'

    WHEN 'abbr' THEN 'phrasing-content'

    WHEN 'address' THEN 'flow-content-with-address-exceptions'

    /* area */

    WHEN 'article' THEN 'flow-content'

    WHEN 'aside' THEN 'flow-content'

    WHEN 'audio' THEN 'source-then-track-then-transparent-with-exceptions' 

    WHEN 'b' THEN 'phrasing-content'

    /* base */

    WHEN 'bdi' THEN 'phrasing-content' 

    WHEN 'bdo' THEN 'phrasing-content'

    WHEN 'blockquote' THEN 'flow-content'

    WHEN 'body' THEN 'flow-content'

    /* br */

    WHEN 'button' THEN 'phrasing-content-without-interactive-content-descendants'

    WHEN 'canvas' THEN 'transparent-with-canvas-exceptions'

    WHEN 'caption' THEN 'flow-content-without-table-descendants'

    WHEN 'cite' THEN 'phrasing-content'

    WHEN 'code' THEN 'phrasing-content'

    /* col */

    WHEN 'colgroup' THEN 'col-and-template-having-span-attribute'

    WHEN 'data' THEN 'phrasing-content'

    WHEN 'datalist' THEN 'phrasing-content-or-option-and-script-supporting'

    WHEN 'dd' THEN 'flow-content'

    WHEN 'del' THEN 'transparent'

    WHEN 'details' THEN 'summary-then-flow-content'

    WHEN 'dfn' THEN 'phrasing-content-without-dfn-descendants'

    WHEN 'dialog' THEN 'flow-content'

    WHEN 'div' THEN 'dt-then-dd-and-script-supporting-otherwise-flow-content'

    WHEN 'dl' THEN 'groups-of-dt-then-dd-or-divs-and-script-supporting'

    WHEN 'dt' THEN 'flow-content-with-dt-exceptions'

    WHEN 'em' THEN 'phrasing-content'

    /* embed */

    WHEN 'fieldset' THEN 'legend-followed-by-flow-content'

    WHEN 'figcaption' THEN 'flow-content'

    WHEN 'figure' THEN 'optional-figcaption-before-or-after-flow-content'

    WHEN 'footer' THEN 'flow-content-without-header-or-footer-descendants'

    WHEN 'form' THEN 'flow-content-without-form-descendants'

    WHEN 'h1' THEN 'phrasing-content'
    WHEN 'h2' THEN 'phrasing-content'
    WHEN 'h3' THEN 'phrasing-content'
    WHEN 'h4' THEN 'phrasing-content'
    WHEN 'h5' THEN 'phrasing-content'
    WHEN 'h6' THEN 'phrasing-content'

    WHEN 'head' THEN 'metadata-content-with-head-exceptions'

    WHEN 'header' THEN 'flow-content-without-header-or-footer-descendants'

    WHEN 'hgroup' THEN 'headings-and-script-supporting'

    /* hr */

    WHEN 'html' THEN 'head-then-body'

    WHEN 'i' THEN 'phrasing-content'

    /* iframe */

    /* img */

    /* input */

    WHEN 'ins' THEN 'transparent'

    WHEN 'kbd' THEN 'phrasing-content'

    WHEN 'label' THEN 'phrasing-content-with-single-labelable-descendant'

    WHEN 'legend' THEN 'phrasing-and-heading-content'

    WHEN 'li' THEN 'flow-content'

    /* link */

    WHEN 'main' THEN 'flow-content'

    WHEN 'map' THEN 'transparent'

    WHEN 'mark' THEN 'phrasing-content'

    /* TODO: math */
    
    WHEN 'menu' THEN 'li-and-script-supporting'

   /* meta */

    WHEN 'meter' THEN 'phrasing-content-without-meter-descendants'

    WHEN 'nav' THEN 'flow-content'

    WHEN 'noscript' THEN 'scripting-dependant-constraints'

    WHEN 'object' THEN 'param-then-transparent'

    WHEN 'ol' THEN 'li-and-script-supporting'

    WHEN 'optgroup' THEN 'option-and-script-supporting'

    WHEN 'option' THEN 'text-with-option-exceptions'

    WHEN 'output' THEN 'phrasing-content'

    WHEN 'p' THEN 'phrasing-content'

    /* param */

    WHEN 'picture' THEN 'source-then-single-img-and-script-supporting'

    WHEN 'pre' THEN 'phrasing-content'

    WHEN 'progress' THEN 'phrasing-content-without-progress-descendants'

    WHEN 'q' THEN 'phrasing-content'

    WHEN 'rp' THEN 'text'

    WHEN 'rt' THEN 'phrasing-content'

    WHEN 'ruby' THEN 'ruby-constraints'

    WHEN 's' THEN 'phrasing-content'

    WHEN 'samp' THEN 'phrasing-content'

    WHEN 'script' THEN 'script-constraints'

    WHEN 'section' THEN 'flow-content'

    WHEN 'select' THEN 'option-optgroup-and-script-supporting'

    WHEN 'slot' THEN 'transparent'

    WHEN 'small' THEN 'phrasing-content'

    /* source */

    WHEN 'span' THEN 'phrasing-content'

    WHEN 'strong' THEN 'phrasing-content'

    WHEN 'style' THEN 'stylesheet'

    WHEN 'sub' THEN 'phrasing-content'

    WHEN 'summary' THEN 'phrasing-and-heading-content'

    WHEN 'sup' THEN 'phrasing-content'

    /* TODO: svg */

    WHEN 'table' THEN 'table-constraints'

    WHEN 'tbody' THEN 'tr-and-script-supporting'

    WHEN 'td' THEN 'flow-content'

    /* template */

    WHEN 'textarea' THEN 'text'

    WHEN 'tfoot' THEN 'tr-and-script-supporting'

    WHEN 'th' THEN 'flow-content-without-header-footer-sectioning-or-heading-content-descendants'

    WHEN 'thead' THEN 'tr-and-script-supporting'

    WHEN 'time' THEN 'phrasing-content-having-datetime-attribute-otherwise-text'

    WHEN 'title' THEN 'text-without-ie-whitespace'

    WHEN 'tr' THEN 'td-th-and-script-supporting'

    /* track */

    WHEN 'u' THEN 'phrasing-content'

    WHEN 'ul' THEN 'li-and-script-supporting'

    WHEN 'var' THEN 'phrasing-content'

    WHEN 'video' THEN 'source-then-track-then-transparent-with-exceptions'

    /* wbr */

    ELSE contents
END;
