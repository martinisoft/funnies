#!/bin/sh
# Bundle post-deploy task

bundle install --deployment --without=development test
