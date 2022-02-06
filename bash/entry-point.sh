#!/usr/bin/env bash


BASEDIR=$(realpath "$(dirname $0)")
pushd $BASEDIR || exit 11

# Colors
B=$'\033[1m'
N=$'\033[0m'
RED='$\033[0;31m'
BLUE=$'\033[0;34m'
GREEN=$'\033[92m'
BG_YELLOW=$'\033[43m'
BG_LBLUE=$'\033[104m'
BG_LGRAY=$'\033[47m'
FG_BLACK=$'\033[30m'
FG_CYAN=$'\033[96m'
BANNER="${B}${BG_LGRAY}${FG_BLACK}"

echo-status() { echo -e "${FG_CYAN}$(date +"%Y-%m-%dT%T")${N} $@" 1>&2; }
echo-error() { echo -e "${FG_CYAN}$(date +"%Y-%m-%dT%T")${N} ${RED}$@${N}" 1>&2; }
echo-status-bold() { echo -e "${FG_CYAN}$(date +"%Y-%m-%dT%T")${N} ${B}$@${N}" 1>&2; }
echo-warn() { echo -e "${FG_CYAN}$(date +"%Y-%m-%dT%T")${N} ${FG_YELLOW}${B}$@${N}" 1>&2; }


function Main() {
  echo-status-bold "This script does nothing"
  cat <<HEADER
${BANNER}=      Banner for nothing         =${N}

  Settings:
  - USER=${USER}
  - HOME=${HOME}
  - BASEDIR=${BASEDIR}
- - - - - - - - - - - - - - - - - - - - - - - -

HEADER

}

#
#   Script main part -- which target to call
#

TARGET=$1

if [ -n "$TARGET" ]; then
    if [[ `type -t $TARGET` == 'function' ]]; then
        shift
        $TARGET "${@}"
    else
        echo-error "Wrong target $TARGET specified"
        exit 1
    fi
else
    echo-status-bold "No target given, running Main"
    Main
fi

popd
