# vim9-agent-context

Yank file location references to the system clipboard, ready to paste into an AI agent prompt.

When working with an AI coding agent, you often need to tell it *where* to look. This plugin lets you grab a precise file reference.

Try it with `Focus on <paste>` or `see <paste>` in your prompt.

## What gets yanked

| Mode | Yanked |
|------|--------|
| Normal | `path/to/file.py` |
| Visual (single line) | `path/to/file.py#L42` |
| Visual (range) | `path/to/file.py#L42-L57` |

Paths are relative to the current working directory when beneath the cwd, absolute otherwise.

## Mapping

The default mapping is `<Leader>a` in both normal and visual mode. To use a different key, add this to your vimrc before the plugin loads:

```vim
nmap <Leader>yc <Plug>(YankContext)
xmap <Leader>yc <Plug>(YankContext)
```

... where `<Leader>yc` is your preferred alternate mapping.
# vim9-agent-context
