# install list of dependencies inside list of package.json file inside express app package 
npm install

# run with node the starting point of an app -- for example for an app named "sample_app.js"
node sample_app.js

# when you need different scripts to initialize different environments for an app -- like for example, a different set of settings for when you're testing, as opposed to when you're in development or when you're in production
npm run start

# the "start" at the bash command above this line, is a fragment of the package.json file inside the app directory that initilizes a specific number of other scripts to run
# other example found below

npm run start:dev
npm run start:production

# to install latest pm2 or "process manager 2" with npm
sudo npm install pm2@latest -g

# start pm2
pm2 start app.js

#stop pm2 running and run with 4 instances of app
# Run
pm2 delete app.js ; pm2 start app.js -i 4
