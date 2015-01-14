let s:configuration_dir = '$HOME/.vim/config/'
let s:configuration_ext = '.vim'

function s:find_configuration_files()
  return split(glob(s:configuration_dir . '[^init]*' . s:configuration_ext), '\n')
endfunction

function s:load()
  let initial_file_path = glob(s:configuration_dir . 'init' . s:configuration_ext)
  if filereadable(initial_file_path)
    execute 'source ' . initial_file_path
  endif
  for file in s:find_configuration_files()
    if filereadable(file)
      execute 'source ' . file
    else
      echo "Couldn't load " . file
    endif
  endfor
endfunction

call s:load()
