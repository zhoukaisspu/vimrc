#!/bin/bash

logInfo() {
	DATETIME=$(date)
	echo "${DATETIME}: $1"
}

#$2: Error message
#$3: Success message
checkExitCode() {
	if [[ $1 -ne 0 ]];then
		echo "ReturnCode: $1, Error: $2"
		exit $1
	fi
	logInfo "$3"
}


BUNDLE_DIR="$HOME/.vim/bundle"
VUNDLE_DIR="${BUNDLE_DIR}/Vundle.vim"

mkdir -p ${BUNDLE_DIR}
checkExitCode $? "create vundle dir error" "Create vundle dir success"

if [[ -d "${VUNDLE_DIR}" ]]; then
	cd "${VUNDLE_DIR}"
	git pull
else
	git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE_DIR"
fi
checkExitCode $? "Clone Vundle.vim error" "Clone Vundle.vim success"


