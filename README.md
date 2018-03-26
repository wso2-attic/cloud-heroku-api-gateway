# WSO2 API Gateway

WSO2 API Gateway can be deployed as your own Heroku dyno. This reduces the average response time to serve an API call, which performs all the functions, without the need to connect to other API management components.

![](https://s3.amazonaws.com/wso2cloud-resources/images/wso2_on_prem_api_gateway.png)

There are multiple advantages to this deployment model:
* **Performance**: You can put your API gateway close to your backend services and API subscribers, avoiding the costly extra hops to the cloud and back.
* **Security and Compliance**: API calls and payload data does not leave your network. This keeps your security and compliance officers happy.
* **Connectivity**: Your API gateway is running on Heroku, so you do not have to set up a VPN or another alternative to expose your Heroku backend to the internet.
* **Low Total Cost of Ownership (TCO)**: Most of the infrastructure is run and maintained by WSO2 for you.

## Prerequisite

- Install [WSO2 API Cloud add-on](https://elements.heroku.com/addons/wso2apicloud)

## Deploy on Heroku

The ‘Deploy to Heroku’ button enables users to deploy WSO2 API Gateway on Heroku without leaving the web browser,
 and with little configuration.

Try WSO2 API Gateway with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/wso2/cloud-heroku-api-gateway/tree/master)

## Documentation

For more information about WSO2 API Gateway, see these WSO2 documentations:

- [Working with Hybrid API Management](https://docs.wso2.com/display/APICloud/Working+with+Hybrid+API+Management)
- [WSO2 Cloud Blog](https://wso2.com/blogs/cloud/going-hybrid-on-premises-api-gateways/)
