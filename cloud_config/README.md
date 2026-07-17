## How to deploy Meltano CE to a VM in cloud with custom DNS names

This directory contains the extra files required to deploy Meltano CE into the cloud or as a server.  (i.e. where the application is accessible from outside the server deployment. Not in localhost)

- `app_certificate/privkey.pem`  : the private key for your certificate. - for the application
- `app_certificate/fullchain.pem`: the certificate file used in most server software.  - for the application
- `catalog_certificate/privkey.pem`  : the private key for your certificate. - for the catalog
- `catalog_certificate/fullchain.pem`: the certificate file used in most server software.  - for the catalog

Presequisite: 
- NGINX is installed in the VM.

## Steps to run the cloud version:

1. Generate the SSL certificates for app and catalog:
    Option 1 - generate 2 certificates, one for app and one for catalog (company-app.domain.com and company-catalog.domain.com). Copy required files into the appropriate folders
    Option 2 - generate 1 certificate for both app and catalog (matatika.domain.com). In this case, please copy the required files into both locations (duplicate the files) - in this case, ports for the app and catalog can't be the same. Please change those in nginx.conf file included in this folder.  Here is the documentation link on how to generate SSL qualified certificates - https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal - copy the certificate files from certbot folder into *_certificates appropiate folder. If the automatic generate is not working, (VM does not have public IP or DNS not configured yet), please follow the certbot manual certificate creation with manual DNS verification. (https://ongkhaiwei.medium.com/generate-lets-encrypt-certificate-with-dns-challenge-and-namecheap-e5999a040708)
2. Edit nginx.conf file and replace `<fullpath>` with the full path of the folders. Also, edit the `<app_dns_name>` and `<catalog_dns_name>` with your dns names for app and catalog. 
3. Edit the variables in **.env.app.cloud** file (see comments inside the file)
4. Edit the variables in **.env.catalog.cloud** file (see comments inside the file)
5. If you are using your own Auth0 Identity Provider please see the comments in file ../config/.env.catalog. Lines number 4 and 5 needs to be updated.
6. Edit run.sh file `<fullpath>` for the nginx configuration file needs to be added. Nginx needs to point to this configuration file, and full path is required. This shell script will copy the cloud configuration files to be loaded by docker compose, start the Meltano CE and finally start the nginx.
7. Run the run.sh file.

## Quick guide
This is the same as above, but into more summary

1. Generate and add certificate files into *_certificate folders.
2. Change files **.env.app.cloud, .env.catalog.cloud, nginx.conf, run.sh**
    - `<fullpath>` needs to be replaced with the linux full path
    - `<app_dns_name>` to be replaced with application DNS name
    - `<catalog_dns_name>` to be replaced with catalog DNS name
    - `<auth0_client_id>` - Auth0 client id - Please refer to this: https://www.matatika.com/docs/getting-started/community-edition#specify-a-custom-auth0-identity-provider on how to configure auth0 with your organization, but instead **localhost:port** you should use https://`<app_dns_name>` and https://`<catalog_dns_name>`/api. Please see the comments in file ../config/.env.catalog. Lines number 4 and 5 needs to be updated.
    - `<auth0_databse_connection>` - Auth0 database
    - change `APP_IDENTITY_DOMAIN` value in **.env.app.cloud** file if you are not using Meltano Auth0 Identity Provider.
