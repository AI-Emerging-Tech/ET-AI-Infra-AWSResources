server {

    listen ${LISTEN_PORT};
 
    location /static/static {

        alias /vol/static;

    }

    location /static/media {

        alias /vol/media;

    }
 
    location / {

        include                 gunicorn_headers;

        proxy_redirect          off;

        proxy_pass              http://${APP_HOST}:${APP_PORT};

        client_max_body_size    10M;

    }
    location /et-ai-tools/ {
            proxy_pass              http://${ET_AI_TOOLS_HOST}:${ET_AI_TOOLS_PORT};
            proxy_redirect          off;
            proxy_set_header        Host $host;
            proxy_set_header        X-Real-IP $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-Forwarded-Proto $scheme;
        }

}
 

