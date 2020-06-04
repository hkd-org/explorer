module.exports = {
  apps : [{
    name: 'app',
    script: 'app.js',
    cwd: '/var/www/etzBrowser',

    // Options reference: https://pm2.io/doc/en/runtime/reference/ecosystem-file/
    // args: 'one two',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '4G',
    log_date_format: 'YYYY-MM-DD HH:mm:ss ZZ',
    env: {
      PORT: 3010,
      NODE_ENV: 'development',
    },
    env_production: {
      PORT: 3010,
      NODE_ENV: 'production',
    }
  },
  {
    name: 'grabber',
    script: 'tools/grabber.js',
    cwd: '/var/www/etzBrowser',

    // Options reference: https://pm2.io/doc/en/runtime/reference/ecosystem-file/
    // args: 'one two',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '4G',
    log_date_format: 'YYYY-MM-DD HH:mm:ss ZZ',
    env: {
      NODE_ENV: 'development'
    },
    env_production: {
      NODE_ENV: 'production'
    }
  }
],

  // deploy : {
  //   production : {
  //     user : 'node',
  //     host : '212.83.163.1',
  //     ref  : 'origin/master',
  //     repo : 'git@github.com:repo.git',
  //     path : '/var/www/production',
  //     'post-deploy' : 'npm install && pm2 reload ecosystem.config.js --env production'
  //   }
  // }
};
