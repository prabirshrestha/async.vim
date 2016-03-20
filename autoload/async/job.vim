let s:save_cpo = &cpo
set cpo&vim

let s:nvim_jobcontrol = has('nvim')

function! WarnNotSupported()
    echo 'async job not supported'
endfunction

function async#job#start(argv, opts) abort
    if s:nvim_jobcontrol
        return jobstart(a:argv, a:opts)
    else
        call WarnNotSupported()
    endif
endfunction

function async#job#stop(job_id) abort
    if s:nvim_jobcontrol
        call jobstop(a:job_id)
    else
        call WarnNotSupported()
    endif
endfunction

function async#job#send(job_id, data) abort
    if s:nvim_jobcontrol
        call jobsend(a:job_id, a:data)
    else
        call WarnNotSupported()
    endif
endfunction

