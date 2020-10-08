#!/bin/bash
set -m
mongod --dbpath /var/data/db1 --port 27017 --bind_ip_all --replSet rs0 &
echo 'Started mongo instance 1'
mongod --dbpath /var/data/db2 --port 27018 --bind_ip_all --replSet rs0 --fork --syslog
echo 'Started mongo instance 2'
mongod --dbpath /var/data/db3 --port 27019 --bind_ip_all --replSet rs0 --fork --syslog
echo 'Started mongo instance 3'

mongo --port 27017 --eval 'rs.initiate({_id : "rs0", members: [{ _id: 0, host: "localhost:27017" },{ _id: 1, host: "localhost:27018" },{ _id: 2, host: "localhost:27019" }]})'
fg %-