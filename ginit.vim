if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility
    set guifont=Iosevka\ Slab:h16
    " FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    " Font tweaks
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontSubpixel v:true
    FVimFontLcdRender v:true
    FVimFontHintLevel 'full'
    " Try to snap the fonts to the pixels, reduces blur
    " in some situations (e.g. 100% DPI).
    FVimFontAutoSnap v:true
endif
