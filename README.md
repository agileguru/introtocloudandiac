# About 

This Repo is part of the [https://www.youtube.com/@agileguru](https://www.youtube.com/@agileguru) series code. This is a terraform code creates 2 site using load balancer and gcs sites. 


## Pre-requisites 

* You have a valid google project
* you are logged in using the cli (gcloud auth)
* You have permission to create / delete load balancer and cloud storage buckets
* You alreaday have terraform binary installed on the computer 

## How to guide 

* Clone the code and make introtocloudandiac as your present working directory. 
* Execute the command 

    ```
    terraform init 
    terraform apply
    ```
* using the console you will find the load balancer ip. Wait for 3 mins and you will see the site. 

* Once tested please execute the command to destroy the resources to avoid have a bill. 

    ```
    terraform destroy 
    ```

