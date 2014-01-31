### config
**configs/backend.coffee** for backend configs
**configs/cloudinary.coffee** for cloudinary configs


sudo npm install coffee-script -g
sudo npm install nodemon -g  
npm install

### running
nodemon -e js,json,coffee,dust,less app.coffee
or
coffee app.coffee

####for production (minified css,js etc)
export NODE_ENV=production
coffee app.coffee

