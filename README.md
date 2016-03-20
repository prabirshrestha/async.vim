# async.vim
normalize async job control api for vim and neovim

## sample usage

```vim
function! s:handler(job_id, data, event_type)
    echo a:job_id . ' ' . a:event_type
    echo a:data
endfunction

let job = async#job#start(['bash', '-c', 'ls'], {
    \ 'on_stdout': function('s:handler'),
    \ 'on_stderr': function('s:handler'),
    \ 'on_exit': function('s:handler')
\ })

call async#job#stop(job)
```
