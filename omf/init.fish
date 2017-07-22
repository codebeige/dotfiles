fish_vi_key_bindings

set fish_pager_color_progress cyan

function fish_mode_prompt --description 'Displays the current mode'
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    switch $fish_bind_mode
      case default
        set_color cyan
        echo '[n]'
      case insert
        set_color green
        echo '[i]'
      case visual
        set_color magenta
        echo '[v]'
    end
    set_color normal
    echo -n ' '
  end
end
