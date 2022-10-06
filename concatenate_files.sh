#!/bin/bash

mkdir output
cat database scripts/*.sql > output/fullDemoDatabase.sql
