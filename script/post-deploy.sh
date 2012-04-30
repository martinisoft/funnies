#!/usr/bin/env bash
# Bundle post-deploy task

bundle install --without=development test
