FROM arm32v7/alpine:edge

LABEL AUTHOR=Junv<wahyd4@gmail.com>

RUN apk update && apk add wget bash gnupg --no-cache

USER root

ENV BAIDUPCS_VERSION 3.6.7

WORKDIR /app

#AriaNg
RUN wget -N --no-check-certificate https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${BAIDUPCS_VERSION}/BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-arm.zip \
 && unzip BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-arm.zip && rm BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-arm.zip \
 && cd BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-arm \
 && mv BaiduPCS-Go .. && cd .. \
 && mv BaiduPCS-Go baidupcs \
 && chmod +x baidupcs

EXPOSE 5299

CMD "/app/baidupcs"


