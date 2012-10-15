#!/usr/bin/env bash
#
# Magical Unicorn script
#
# Since unicorn creates a new pid on restart/reload, it needs a little extra love to
# manage with runit. Instead of managing unicorn directly, we simply trap signal calls
# to the service and redirect them to unicorn directly.
#

function is_unicorn_alive {
    set +e
    if [ -n $1 ] && kill -0 $1 >/dev/null 2>&1; then
        echo "yes"
    fi
    set -e
}

# RVM Sourcing
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

fi


echo "Service PID: $$"

CUR_PID_FILE=/srv/funnies/shared/pids/unicorn.pid
OLD_PID_FILE=$CUR_PID_FILE.oldbin

if [ -e $OLD_PID_FILE ]; then
    OLD_PID=$(cat $OLD_PID_FILE)
    echo "Waiting for existing master ($OLD_PID) to exit"
    while [ -n "$(is_unicorn_alive $OLD_PID)" ]; do
        /bin/echo -n '.'
        sleep 2
    done
fi

if [ -e $CUR_PID_FILE ]; then
    CUR_PID=$(cat $CUR_PID_FILE)
    if [ -n "$(is_unicorn_alive $CUR_PID)" ]; then
        echo "Unicorn master already running. PID: $CUR_PID"
        RUNNING=true
    fi
fi

if [ ! $RUNNING ]; then
    echo "Starting unicorn"
    bundle exec unicorn -p $PORT -c /srv/funnies/current/config/unicorn.rb
    sleep 3
    CUR_PID=$(cat $CUR_PID_FILE)
fi

function restart {
    echo "Initialize new master with USR2"
    kill -USR2 $CUR_PID
    # Make runit restart to pick up new unicorn pid
    sleep 2
    echo "Restarting service to capture new pid"
    exit
}

function graceful_shutdown {
    echo "Initializing graceful shutdown"
    kill -QUIT $CUR_PID
}

trap restart HUP QUIT
trap graceful_shutdown INT TERM

echo "Waiting for current master to die. PID: ($CUR_PID)"
while [ -n "$(is_unicorn_alive $CUR_PID)" ]; do
    /bin/echo -n '.'
    sleep 2
done
echo "You've killed a unicorn!"
