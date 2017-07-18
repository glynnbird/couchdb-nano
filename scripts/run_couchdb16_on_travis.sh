#!/usr/bin/env bash

if [ ! -z $TRAVIS ]; then
	# Install CouchDB Master
	echo "Starting CouchDB 1.6 Docker"
	docker run --ulimit nofile=2048:2048 -d -p 5984:5984 --name couchdb16 couchdb

	# wait for couchdb to start
	while [ '200' != $(curl -s -o /dev/null -w %{http_code} http://127.0.0.1:5984) ]; do
	  echo waiting for couch to load... ;
	  sleep 1;
	done
fi