#!/bin/sh


api="https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/es.wikipedia/all-access/all-agents"

curl "$api/Catalu%C3%B1a/daily/2017090100/2017110100" | jq '.items[] | .views ' > Cataluña-2017.dat
curl "$api/Catalu%C3%B1a/daily/2016090100/2016110100" | jq '.items[] | .views ' > Cataluña-2016.dat

