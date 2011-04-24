#!/bin/sh
# Bundle post-deploy task

sudo bundle install --without=development test
