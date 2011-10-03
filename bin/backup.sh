#!/bin/sh

export ROOT_PATH=/Users/mike/.backup
export TRIGGER=$1
export TRIGGER_PATH=$ROOT_PATH/$TRIGGER

mkdir -p $ROOT_PATH

bundle exec backup perform \
  --trigger $TRIGGER \
  --config-file=$TRIGGER/config.rb \
  --data-path=$TRIGGER_PATH/data \
  --tmp-path=$TRIGGER_PATH/tmp \
  --log-path=$TRIGGER_PATH/log \
  --cache-path=$TRIGGER_PATH/cache
