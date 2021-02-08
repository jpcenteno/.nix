#! /bin/sh
set -eu

# ------------------------------------------------------------------------------
# Logging
# ------------------------------------------------------------------------------

LOG_CO_INFO='\033[0;36m' # Cyan.
LOG_CO_RESET='\033[0m'

_log() {
    COLOR="${1}"
    LEVEL="${2}"
    shift 2
    echo "${COLOR}[${LEVEL} $(date -u)]${LOG_CO_RESET} ${*}"
}

_log_info() {
    _log "${LOG_CO_INFO}" "INFO" "${@}"
}

# ------------------------------------------------------------------------------
# Setup
# ------------------------------------------------------------------------------

# Install nix
_log_info "installing nix..."
curl -L https://nixos.org/nix/install | sh
_log_info "sourcing nix..."
. "${HOME}/.nix-profile/etc/profile.d/nix.sh"

# Install home manager

_log_info "Installing home-manager"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install


_log_info "home-manager switch"
home-manager switch
