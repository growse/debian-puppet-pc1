#!/bin/bash

vagrant up --provider virtualbox
vagrant package --output output.box
vagrant destroy -f
curl -o upload.txt -H "X-Atlas-Token: ${ATLAS_TOKEN}"-XPUT --upload-file output.box $(curl -H "X-Atlas-Token: ${ATLAS_TOKEN}" -XGET 'https://atlas.hashicorp.com/api/v1/box/growse/debian-jessie64-puppet4/version/1.0.0/provider/virtualbox/upload' | jq -r .upload_path)

