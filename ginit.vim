if exists('g:fvim_loaded')
    set guifont=Iosevka\ Slab:h16
    FVimCursorSmoothMove v:true
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
    " UI options (all default to v:false)
    FVimBackgroundComposition 'acrylic'   " 'none', 'blur' or 'acrylic'
    FVimBackgroundOpacity 0.85            " value between 0 and 1, default bg opacity.
    FVimBackgroundAltOpacity 0.85         " value between 0 and 1, non-default bg opacity."
endif
