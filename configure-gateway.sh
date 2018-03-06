#!/bin/bash
# ----------------------------------------------------------------------------
# Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

UNZIPPED_FILE_NAME=wso2am-2.1.0
DOWNLOAD_ZIP_FILE_NAME=wso2am-2.1.0.zip
ON_PREM_GATEWAY_DOWNLOAD_LINK=https://s3.amazonaws.com/wso2cloud-resources/on-premise-gateway/wso2am-2.1.0.zip

# Check for mandatory pre-requisites
command -v wget >/dev/null 2>&1 || { echo >&2 "wget was not found. Please install wget first."; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo >&2 "unzip was not found. Please install unzip first."; exit 1; }

if [ ! -f $DOWNLOAD_ZIP_FILE_NAME ]; then
    echo "Setting up WSO2 API Microgateway..."
    wget -q $ON_PREM_GATEWAY_DOWNLOAD_LINK
fi

if [ ! -f $DOWNLOAD_ZIP_FILE_NAME ]
    then
        echo "$DOWNLOAD_ZIP_FILE_NAME doesn't exist in current file location."
        exit 1
    else
        if [ ! -d $UNZIPPED_FILE_NAME ]; then
            #Unzip downloaded On-prem gateway to current location and remove the zip file.
            unzip -q $DOWNLOAD_ZIP_FILE_NAME

            #Binding Heroku dynamic port to Axis2 synapse port.
            sed -i 's/JVM_MEM_OPTS="-Xms256m -Xmx1024m"/JVM_MEM_OPTS="-Xms256m -Xmx300m"/' $UNZIPPED_FILE_NAME/bin/wso2server.sh
            sed -i 's#AUTOSTART="${WSO2_CLOUD_AUTOSTART:-"false"}"#AUTOSTART="${WSO2_CLOUD_AUTOSTART:-"true"}" \nsed -i "s/8280/$PORT/" wso2am-2.1.0/repository/conf/axis2/axis2.xml#' $UNZIPPED_FILE_NAME/bin/configure-gateway.sh
        fi
fi

# Remove zip file after extracting files.
if [ -f $DOWNLOAD_ZIP_FILE_NAME ]; then
    rm -rf $DOWNLOAD_ZIP_FILE_NAME
fi

sh $UNZIPPED_FILE_NAME/bin/configure-gateway.sh
