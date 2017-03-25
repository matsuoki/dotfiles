# $FreeBSD: src/etc/root/dot.cshrc,v 1.29 2004/04/01 19:28:00 krion Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

# vim:set ts=8 tw=8 st=0 fenc=euc-jp :

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA


alias	vi	vim
alias ls	ls -G
alias jman       'env LC_CTYPE=ja_JP.eucJP jman'

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin)

#setenv	EDITOR	vi
#setenv	PAGER	more

setenv  PAGER  lv
setenv  LV     '-Ou8'
setenv	EDITOR		vim
setenv	BLOCKSIZE K

setenv PACKAGEROOT ftp://ftp.jp.freebsd.org/

# LANG
#
#setenv LANG    ja_JP.eucJP

switch ( $OSTYPE )
    case "linux*":          # Linux
        setenv LANG    ja_JP.UTF-8
        breaksw;
    case "freebsd*":        # FreeBSD
    case "FreeBSD*":        # FreeBSD
        setenv LANG    ja_JP.eucJP
        breaksw;
    case "darwin*":         # OS/X
        setenv LANG    ja_JP.UTF-8
    default:
endsw

setenv LANG    ja_JP.UTF-8

set correct=cmd
set correct=all
set autolist

# LS_COLORS & LSCOLORS
setenv LS_COLORS 'no=0:fi=0:di=01;32:ln=01;35:pi=33:so=01;33:bd=34:cd=36:ex=01;31'
setenv LSCOLORS  "CxFxDxdxBxexgxBxBx"


if ($?prompt) then
	# An interactive shell -- set some stuff up
#	set prompt = "`/bin/hostname -s`# "
#       set prompt = '%B%n@%M:%~%# %b'
	set prompt="%{\e[01;32m%}%n@%m:[\!]%{\e[0m%}:%{\e[01;34m%}%~%#%{\e[0m%} "


	set filec
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif

