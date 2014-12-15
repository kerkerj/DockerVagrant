#!/bin/bash

sudo docker run -it -p 8080:8080 -d --link mongodb:mongodb --name nodejsapp kerkerj:nodejsapp
