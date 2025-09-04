upstream app_upstream { server 127.0.0.1:${APP_PORT};  keepalive 32; }
upstream ocr_upstream { server 127.0.0.1:${OCR_PORT};  keepalive 16; }

server {
    listen ${LISTEN_PORT};

    # Static & media (note trailing slashes with alias)
    location /static/ { alias /vol/static/; }
    location /media/  { alias /vol/media/;  }

    # Django/Gunicorn app
    location / {
        # Use a known include file; replace with your absolute path if you have a custom one
        include /etc/nginx/proxy_params;

        proxy_redirect off;
        proxy_http_version 1.1;
        proxy_set_header Connection "";

        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        client_max_body_size 10m;

        proxy_pass http://app_upstream;
    }

    # OCR service
    location /upload {
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        proxy_pass http://ocr_upstream;
    }
}