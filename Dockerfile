FROM alpine:3.10.2

RUN apk update \
  # psycopg2 dependencies
  && apk add --virtual build-deps gcc python3-dev musl-dev \
  && apk add postgresql-dev \
  # Pillow dependencies
  && apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
  # CFFI dependencies
  && apk add libffi-dev py-cffi

## ADD PostGIS & dpendencies here                                               
RUN apk add --no-cache --virtual .build-deps-testing \                          
     --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \           
     gdal-dev \                                                                 
     geos-dev \                                                                 
     proj-dev \                                                                 
     postgis-dev 

CMD ["gdaltransform", "-s_srs", "EPSG:28992", "-t_srs", "EPSG:31370"]
