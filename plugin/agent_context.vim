vim9script

if exists('g:loaded_agent_context')
    finish
endif
g:loaded_agent_context = true

# Yank file path (+ line range when in visual mode) to the system clipboard.
def g:YankContext()
    var m = mode()
    var path = expand('%:.')
    var result: string

    if m == 'v' || m == 'V' || m == "\<C-v>"
        var start_line = line('v')
        var end_line = line('.')
        if start_line > end_line
            [start_line, end_line] = [end_line, start_line]
        endif
        if start_line == end_line
            result = printf('%s#L%d', path, start_line)
        else
            result = printf('%s#L%d-L%d', path, start_line, end_line)
        endif
    else
        result = path
    endif

    setreg('*', result)
    setreg('+', result)
    echo 'Yanked: ' .. result
enddef

nnoremap <Plug>(YankContext) <Cmd>call g:YankContext()<CR>
xnoremap <Plug>(YankContext) <Cmd>call g:YankContext()<CR>

if !hasmapto('<Plug>(YankContext)', 'n')
    nmap <Leader>a <Plug>(YankContext)
endif
if !hasmapto('<Plug>(YankContext)', 'x')
    xmap <Leader>a <Plug>(YankContext)
endif

