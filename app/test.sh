#!/bin/bash

if ! lsof -i:80 > /dev/null; then
  echo 'exist'
else
  echo 'not exist'
fi

echo 'test program done'
