function! Psalm()
    tabnew Psalm
    let changed_files = system('git status -s')
    for changed_file in split(changed_files, '\n')
        call append(line('$'), changed_file[3:])
        redir => message
        :execute "!psalm " . changed_file[3:] . " --language-server"
        redir END
        silent put=message
    endfor
endfunction

command! Psalm call Psalm()
