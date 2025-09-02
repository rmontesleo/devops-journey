# DigitalOcean Spaces & Nodejs (con Mongodb)


```bash
mkdir 

cd 


#
npm init -y

# install project dependencies
npm i express mongoose morgan multer multer-s3 aws-sdk dotenv ejs 

# install development dependencies
npm i nodemon -D

#
mkdir src

cd src

# create the application files
touch app.js  index.js database.js

# create required folders
mkdir controllers libs public routes views

#
cd ..

#
node src/index.js

# stop the application


# configure nodemon in pakcage.json
vim package.json
```

```json
"scripts": {
    "dev": "nodemon src/index.js"
  },
```

```bash

# pull mongodb image
docker pull mongo:4.4

# 
docker run --name mongodb -d -p 27017:27017 mongo:4.4


# run project in dev mode with nodemon
npm run dev


touch views/upload.ejs

touch libs/multer.js

touch routes/index.router.js

touch controllers/index.controllers.js

touch .env

```



## TODOS

- Validate the input data in the forms




## References

- [DigitalOcean Spaces & Nodejs (con Mongodb)](https://www.youtube.com/watch?v=QLwJn_F84Sg&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=9)

-[Nodejs & DigitalOcean Spaces Example](https://github.com/FaztWeb/nodejs-digitalocean-spaces)

- [](https://www.mongodb.com/support-policy/lifecycles)

- [MongoDB Software Lifecycle Schedules](https://hub.docker.com/_/mongo)

- [Free themes for Bootstrap](https://bootswatch.com/)

- [BootstrapCDN](https://www.bootstrapcdn.com/bootswatch/)

- [Set up AWS Credentials and Region for Development](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html)


- [How To Upload a File to Object Storage with Node.js](https://www.digitalocean.com/community/tutorials/how-to-upload-a-file-to-object-storage-with-node-js)


- [](https://www.npmjs.com/package/multer-s3)

- [](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingAWSSDK.html#specify-signature-version)

- [](https://www.freecodecamp.org/news/how-to-update-npm-dependencies/)