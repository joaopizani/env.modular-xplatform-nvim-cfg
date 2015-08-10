let $NVIM_RUNTIME = expand("$NVIM_ROOT") . '/runtime'
let $NVIM_CONFIG = expand("$NVIM_ROOT") . '/config'

let $NVIM_BUNDLES = expand("$NVIM_RUNTIME") . '/bundle'
let $NVIM_CACHES = expand("$NVIM_RUNTIME") . '/caches'

let $NVIM_CFG_REC = expand("$NVIM_CONFIG") . '/recommended'
let $NVIM_CFG_EXT = expand("$NVIM_CONFIG") . '/extra'


" simple part - can be used with no extra plugins installed
for f in glob(expand("$NVIM_CFG_REC") . '/simple-cfgs/*.vim', 1, 1)   | exe 'source' f | endfor
for f in glob(expand("$NVIM_CFG_EXT") . '/*/simple-cfgs/*.vim', 1, 1) | exe 'source' f | endfor


" detects whether the vimplug plugin manager is present and loads plugins and respective configs
let $VIMPLUG_BOOTSTRAP_FILE = expand("$NVIM_BUNDLES") . "/plug.vim"
let s:vimplug_present = filereadable(expand("$VIMPLUG_BOOTSTRAP_FILE"))

if(s:vimplug_present)
    if has('vim_starting') | exe 'source' expand("$VIMPLUG_BOOTSTRAP_FILE") | endif

    call plug#begin(expand('$NVIM_BUNDLES/'))

    for f in glob(expand("$NVIM_CFG_REC") . '/plugin-lists/*.vim', 1, 1)   | exe 'source' f | endfor
    for f in glob(expand("$NVIM_CFG_EXT") . '/*/plugin-lists/*.vim', 1, 1) | exe 'source' f | endfor

    call plug#end()

    for f in glob(expand("$NVIM_CFG_REC") . '/plugin-cfgs/*.vim', 1, 1)   | exe 'source' f | endfor
    for f in glob(expand("$NVIM_CFG_EXT") . '/*/plugin-cfgs/*.vim', 1, 1) | exe 'source' f | endfor
endif

