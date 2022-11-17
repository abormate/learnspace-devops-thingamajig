// to look for what file npm from the public node repo
npm search file

// to install an NPM file or package -- this installs the NPM in the pwd (present working directory)
npm install file

// to install NPM globally
npm install file -g

// to look at what paths node will look at when searching for an npm dependency
node -e "console.log(module.paths)"

// built-in modules or packages for nodejs -- look for
ls /usr/lib/node_modules/npm/node_modules/
  
// how to look for external modules or packages on nodejs
ls /usr/lib/node_modules/

  // the file called package.json that is included with an npm install, inside its npm directory which could be inside the pwd when you installed the package hosts the important meta data for that package -- such as author name, author email address, main git repo for the npm, guides, dependency versions and what other packages that particular npm needs
