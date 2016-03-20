# async.vim
normalize async job control api for vim and neovim

## sample usage

```vim
function! s:handler(job_id, data, event_type)
    echo a:job_id . ' ' . a:event_type
    echo a:data
endfunction

if has('win32') || has('win64')
    let argv = ['cmd', '/c', 'dir c:\ /b']
else
    let argv = ['bash', '-c', 'ls']
endif

let job = async#job#start(argv, {
    \ 'on_stdout': function('s:handler'),
    \ 'on_stderr': function('s:handler'),
    \ 'on_exit': function('s:handler'),
\ })

" call async#job#stop(job)
```
