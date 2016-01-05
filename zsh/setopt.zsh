# ===== Basics
setopt no_beep
setopt interactive_comments

# ===== Changing Directories
setopt auto_cd
setopt cdable_vars
setopt pushd_ignore_dups

# ===== Expansion and Globbing
setopt extended_glob

# ===== History
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history

# ===== Completion
setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt complete_in_word

unsetopt menu_complete

# ===== Correction
setopt no_correct_all

# ===== Prompt
setopt prompt_subst
setopt transient_rprompt

# ===== Scripts and Functions
setopt multios
