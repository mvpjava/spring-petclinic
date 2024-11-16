#!/bin/sh

aws codepipeline get-pipeline --name petclinic-pipeline --output json > petclinic-pipeline.json
