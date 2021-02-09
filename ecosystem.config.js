module.exports = {
    apps: [
        {
            name: 'decor-admin',
            host: process.env.APP_URL,
            script: 'npm run start',
            watch: true,
            env: {
                NODE_ENV: 'development'
            },
            env_production: {
                NODE_ENV: 'production'
            }
        },
        {
            name: 'laravel-decor-admin',
            script: 'php artisan serve --host=192.168.0.107 --port=8041',
            watch: true,
            env: {
                NODE_ENV: 'development',
            },
            env_production: {
                NODE_ENV: 'production',
            }
        },
    ]
};
