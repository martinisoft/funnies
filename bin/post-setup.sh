#!/bin/sh
# Bundle post-deploy task

bundle install --without=development test
